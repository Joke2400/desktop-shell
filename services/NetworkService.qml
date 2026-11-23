pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Networking

Singleton {
    id: root

    readonly property bool wifiEnabled: Networking.wifiEnabled
    readonly property var devices: Networking.devices.values
    readonly property var connectedDevices: devices.filter(
        item => item.connected
    )

    Component.onCompleted: () => {
        Networking.checkConnectivity()
        console.log(devices)
        console.log(connectedDevices[0].networks.values)
        console.log(getConnectedNetworks(connectedDevices[0]))
    }

    function getConnectedNetworks(networkDevice) {
        return networkDevice.networks.values.filter(
            network => network.connected
        )
    }

}
