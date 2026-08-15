pragma Singleton
import QtQuick
import Quickshell

Singleton {

    // I/O
    readonly property var mountPointsToWatch: ["/", "/home"] // Note: partition  paths must be correct & all must be mounted (no checks yet)!
    readonly property string wallpaperDirPath: "file://" + Quickshell.env("HOME") + "/Pictures/wallpapers"

    // Behavior
    readonly property string selectedMonitorOutput: Quickshell.env("QS_MAIN_MONITOR_OUT")
    readonly property bool adjustBrightnessOnLoad: false

    // UI components
    readonly property string statusbarPosition: "top" // is not used yet
}
