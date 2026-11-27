import qs.services

import Quickshell.Networking

ControlButtonWide {
    id: root

    readonly property var netDetails: NetworkService.getNetworkDetails(netDevice.network)
    readonly property var netDevice: NetworkService.primaryNetworkDevice

    icon: getNetworkIcon(netDevice.state, netDevice.type)
    text: netDetails.name
    subText: netDetails.conName
    tooltip: `${netDetails.conName}: ${ConnectionState.toString(netDetails.state)}`


    function getNetworkIcon(networkState, deviceType) {
        const stateString = ConnectionState.toString(networkState)
        const typeString = DeviceType.toString(deviceType)

        if (stateString === "Disconnected") {
            return "󱚼";
        } else if (stateString === "Connecting") {
            return "󱛇";
        } else if (stateString === "Connected") {
            if (typeString === "Wired") {
                return "󰈀"
            } else return "󰖩"
        } else if (stateString === "Disconnecting") {
            return "󱛇";
        } else {
            console.warn("Could not determine icon for network state:", stateString, "- using fallback");
            return "󱚵"
        }
    }
}