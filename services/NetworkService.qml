pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Networking

Singleton {
    id: root

    readonly property bool networkConnectivity: NetworkConnectivity.toString(Networking.connectivity)

    readonly property bool wifiRadioEnabled: !wifiSoftwareBlock && !wifiHardwareBlock
    property bool wifiSoftwareBlock: !Networking.wifiEnabled
    readonly property bool wifiHardwareBlock: !Networking.wifiHardwareEnabled

    readonly property var networkDevices: Networking.devices.values
    readonly property var wifiDevices: {Networking.devices.values.filter( device => device.type === 1)}
    readonly property var wiredDevices: {Networking.devices.values.filter( device => device.type === 2 && device.hasLink)}
    readonly property var connectedDevices: Networking.devices.values.filter( device => device.connected)

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
            root.checkNetworkConnectivity()
            Networking.connectivityCheckEnabled = false

            for (const [name, net] of Object.entries(root.availableWifiNetworks)) {
                console.log(JSON.stringify(root.getNetworkDetails(net)))
            }
        }
    }

    function checkNetworkConnectivity() {
        console.log(`Identified networking backend as: '${NetworkBackendType.toString(Networking.backend)}'`)
        if (Networking.canCheckConnectivity && Networking.connectivityCheckEnabled) {
            Networking.checkConnectivity()
            console.log("Checked network connectivity, got result:", root.networkConnectivity)
        }
        console.log(`Unable to check network connectivity (canCheckConnectivity=${Networking.canCheckConnectivity}, connectivityCheckEnabled=${Networking.connectivityCheckEnabled})`)
    }

    function scanAvailableWifiNetworks(wifiDevices) {
        if (!root.wifiRadioEnabled) {
            root.wifiSoftwareBlock = false
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
            "name" : network.name,
            "device" : network.device.name,
            "conName" : network.nmSettings.length > 0 ? network.nmSettings[0].id : "None",
            "state" : ConnectionState.toString(network.state)
        }
    }
}
