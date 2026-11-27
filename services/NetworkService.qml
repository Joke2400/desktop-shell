pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Networking

Singleton {
    id: root

    readonly property var primaryNetwork:
        availableWiredNetworks.find(d => d.connected)
        || availableWifiNetworks.find(d => d.connected)
        || null

    readonly property string networkConnectivity: NetworkConnectivity.toString(Networking.connectivity)

    readonly property bool wifiRadioEnabled: !wifiSoftwareBlock && !wifiHardwareBlock
    readonly property bool wifiSoftwareBlock: !Networking.wifiEnabled
    readonly property bool wifiHardwareBlock: !Networking.wifiHardwareEnabled

    readonly property var networkDevices: Networking.devices.values
    readonly property var wifiDevices: {Networking.devices.values.filter( device => DeviceType.toString(device.type) === "Wifi")}
    readonly property var wiredDevices: {Networking.devices.values.filter( device => DeviceType.toString(device.type) === "Wired" && device.hasLink)}
    readonly property var connectedDevices: Networking.devices.values.filter( device => device.connected)

    readonly property var availableNetworks: availableWiredNetworks.concat(availableWifiNetworks)
    readonly property var availableWifiNetworks: scanAvailableWifiNetworks(wifiDevices)
    readonly property var availableWiredNetworks: scanAvailableWiredNetworks(wiredDevices)
    readonly property var connectedNetworks: mapConnectedNetworks(networkDevices)

    Timer {
        id: settleTimer
        interval: 150
        running: true
        onTriggered: () => {
            // is seemingly disabled by default
            Networking.connectivityCheckEnabled = true
            Networking.wifiEnabled = true
            root.checkNetworkConnectivity()

            //for (const [name, net] of Object.entries(root.availableNetworks)) {
            //    console.log(JSON.stringify(root.getNetworkDetails(net)))
            //}
        }
    }

    function checkNetworkConnectivity() {
        console.log(`Identified networking backend as: '${NetworkBackendType.toString(Networking.backend)}'`)
        if (Networking.canCheckConnectivity && Networking.connectivityCheckEnabled) {
            Networking.checkConnectivity()
            console.log("Checked network connectivity, got result:", root.networkConnectivity)
        } else {
            console.log(`Unable to check network connectivity (canCheckConnectivity=${Networking.canCheckConnectivity}, connectivityCheckEnabled=${Networking.connectivityCheckEnabled})`)
        }
    }

    function scanAvailableWifiNetworks(wifiDevices) {
        if (!root.wifiRadioEnabled) {
            console.log("WI-FI is not enabled, unable to scan for WI-FI networks")
            return []
        }
        const networks = []
        for (const device of wifiDevices) {
            device.scannerEnabled = true
            for (const network of device.networks.values) {
                networks.push(network)
            }
        }
        return networks
    }

    function scanAvailableWiredNetworks(wiredDevices) {
        const networks = []
        for (const device of wiredDevices) {
            for (const network of device.networks.values) {
                networks.push(network)
            }
        }
        return networks
    }

    function mapConnectedNetworks(networkDevices) {
        const networks = {};
        for (const device of networkDevices) {
            for (const network of device.networks.values) {
                if (!network.connected) continue
                networks[network.name] = network;
            }
        }
        return networks;
    }

    function getNetworkDetails(network) {
        return {
            "networkName": network.name,
            "deviceName" : network.device.name,
            "deviceType" : DeviceType.toString(network.device.type),
            "connectionName" : network.nmSettings.length > 0 ? network.nmSettings[0].id : "",
            "state" : ConnectionState.toString(network.state),
            "known" : network.known
        }
    }
}
