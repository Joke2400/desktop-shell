pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Networking

Singleton {
    id: root

    readonly property bool wifiEnabled: Networking.wifiEnabled
    readonly property var devices: Networking.devices.values
    readonly property var networks: mapAvailableNetworks(root.devices)

    Timer {
        id: settleTimer
        interval: 150
        running: true
        onTriggered: () => {
            Networking.checkConnectivity()
            if (root.devices.length > 0) {
                console.log("Found network devices:", root.devices)
            }
            if (Object.keys(root.networks).length > 0) {
                console.log("Found networks:", Object.entries(root.networks))
                for (const [name, net] of Object.entries(root.networks)) {
                    console.log(name, net)
                }
            }
        }
    }

    function mapAvailableNetworks(networkDeviceList) {
        const networks = {};
        for (const device of networkDeviceList) {
            for (const network of device.networks.values) {
                networks[network.name] = network;
            }
        }
        return networks;
    }
}
