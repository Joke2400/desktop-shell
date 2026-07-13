import qs.config.settings

import QtQuick
import Quickshell
import Quickshell.Io

pragma Singleton

Singleton {
    id: root
    // General
    property int procCount: 0
    property string uptime: "Up: 0d 0h 0m" // placeholder, indicative

    // CPU
    property real cpuPercent: 0 // 2 decimals
    property real cpuFreqGHz: 0 // 2 decimals
    property var coreFreqAll: [] // list of all core frequencies

    property int lastCpuTotal: -1 // do not edit
    property int lastCpuIdle: -1 // do not edit

    // MEM
    property real memPercent: 0 // 2 decimals
    property real memTotalGB: 0 // 2 decimals
    property real memUsedGB: 0 // 2 decimals

    // DISK
    property real diskPercent: 0 // 2 decimals
    property real diskTotalGB: 0 // 2 decimals
    property real diskUsedGB: 0 // 2 decimals

    // not implemented
    property real cpuTemp: -1
    property int gpuTemp: -1
    property string ip: ""
    property string osName: ""
    property string osIcon: ""
    property string username: ""
    property string hostname: ""
    property string kernelVersion: ""
    property string architecture: ""

    FileView { id: cpuStatFile; path: "/proc/stat" }
    FileView { id: memInfoFile; path: "/proc/meminfo" }
    FileView { id: uptimeFile; path: "/proc/uptime" }

    Instantiator {
        id: cores
        model: 1
        FileView { path: `/sys/devices/system/cpu/cpu${index}/cpufreq/scaling_cur_freq` }
    }

    FileView {
        id: coreCountFile
        path: "/sys/devices/system/cpu/present"
        onLoaded: {
            cores.model = parseInt(coreCountFile.text().split("-")[1].trim()) + 1

            pollCPU()
            pollMEM()
            pollUptime()
            pollProcessCount.running = true
            pollDiskUsage.running = true
            mainTimer.running = true
        }
    }

    property int _timertick: 0
    Timer {
        id: mainTimer
        interval: 1000
        running: true
        repeat: true

        onTriggered: {
            root._timertick++
            cpuStatFile.reload()
            memInfoFile.reload()
            uptimeFile.reload()
            for (let i = 0; i < cores.count; i++) {
                if (cores.objectAt(i)) cores.objectAt(i).reload()
            }

            pollCPU()
            pollMEM()
            pollUptime()

            // 10s interval
            if (root._timertick % 10 === 0) {
                pollProcessCount.running = true
            }

            // 30s interval
            if (root._timertick % 30 === 0) {
                pollDiskUsage.running = true
                root._timertick = 0
            }
        }
    }

    function pollCPU() {
        const cpuLine = cpuStatFile.text().split("\n")[0].trim().split(/\s+/).slice(1)
        const cpuIdleTime = parseInt(cpuLine[3]) + parseInt(cpuLine[4])
        const cpuTotalTime = cpuLine.reduce((tot, val) => tot + parseInt(val), 0)

        if (root.lastCpuTotal >= 0) {
            const totalDiff = cpuTotalTime - root.lastCpuTotal
            const idleDiff = cpuIdleTime - root.lastCpuIdle
            root.cpuPercent = (((totalDiff - idleDiff) / totalDiff) * 100).toFixed(2)
        }
        root.lastCpuTotal = cpuTotalTime
        root.lastCpuIdle = cpuIdleTime

        let cpuFreqSum = 0
        let coreFreqAll = []
        for (let i = 0; i < cores.count; i++) {
            let core = cores.objectAt(i)
            if (core) {
                const value = parseInt(core.text())
                cpuFreqSum += value
                coreFreqAll.push(value)
            }
        }
        root.coreFreqAll = coreFreqAll
        root.cpuFreqGHz = ((cpuFreqSum / cores.count) / 1_000_000).toFixed(2)
    }

    function pollMEM() {
        const memLines = memInfoFile.text().split("\n")
        let memTotal = 0
        let memAvailable = 0

        for (let line of memLines) {
            if (line.startsWith("MemTotal"))
                memTotal = parseInt(line.match(/\d+/)[0])
            if (line.startsWith("MemAvailable"))
                memAvailable = parseInt(line.match(/\d+/)[0])
        }
        root.memPercent = (((memTotal - memAvailable) / memTotal) * 100).toFixed(2)
        root.memUsedGB = ((memTotal - memAvailable) / 1024 / 1024).toFixed(2)
        if (root.memTotalGB === 0) {
            root.memTotalGB = (memTotal / 1024 / 1024).toFixed(2)
        }
    }

    function pollUptime() {
        const s = parseFloat(uptimeFile.text().split(" ")[0])
        const m = Math.floor((s % 3600) / 60)
        const h = Math.floor((s % 86400) / 3600)
        const d = Math.floor(s / 86400)

        root.uptime = `Up: ${d}d ${h}h ${m}m`
    }

    Process {
        id: pollProcessCount
        command: ["sh","-c","ps -e --no-headers | wc -l"]
        stdout: StdioCollector { onStreamFinished: root.procCount = parseInt(text.trim())}
    }

    Process {
        id: pollDiskUsage
        command: ["df","-k"].concat(Settings.mountPointsToWatch)
        stdout: StdioCollector {
            onStreamFinished: {
                const lines = text.trim().split("\n")
                if (lines.length < 2) return

                const seenDevices = new Set()
                let totalSize = 0
                let totalUsed = 0

                for (const line of lines.slice(1)) {
                    const parts = line.split(/\s+/)
                    const device = parts[0]
                    if (seenDevices.has(device)) continue
                    seenDevices.add(device)

                    totalSize += parseInt(parts[2]) + parseInt(parts[3])
                    totalUsed += parseInt(parts[2])
                }
                root.diskPercent = ((totalUsed / totalSize) * 100).toFixed(2)
                root.diskTotalGB = ((totalSize * 1024) / 1e9).toFixed(2)
                root.diskUsedGB = ((totalUsed * 1024) / 1e9).toFixed(2)
            }
        }
    }

}