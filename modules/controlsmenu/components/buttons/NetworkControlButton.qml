import qs.services

ControlButtonWide {
    id: root

    readonly property var network: NetworkService.primaryNetwork
    readonly property var netDetails: NetworkService.getNetworkDetails(network)

    icon: network ? getNetworkIcon(netDetails.state, netDetails.deviceType) : "󱚵"
    text: network ? (netDetails.deviceType === "Wired" ? "Wired LAN" : netDetails.networkName) : "No connection"
    subText: network ? netDetails.connectionName : "-"
    tooltip: network ? `${netDetails.connectionName}: ${netDetails.state}` : "No connection"
    leftAction: () => {
        if (!StateService.showInternetMenu) {
            StateService.showInternetMenu = true
            StateService.showBluetoothMenu = false
            root.toggled = true
        } else {
            StateService.showInternetMenu = false
            StateService.showBluetoothMenu = false
            root.toggled = false
        }
    }

    function getNetworkIcon(networkState, deviceType) {
        if (networkState === "Disconnected") {
            return "󱚼";
        } else if (networkState === "Connecting") {
            return "󱛇";
        } else if (networkState === "Connected") {
            if (deviceType === "Wired") {
                return "󰈀"
            } else return "󰖩"
        } else if (networkState === "Disconnecting") {
            return "󱛇";
        } else {
            console.warn("Could not determine icon for network state:", networkState, "- using fallback");
            return "󱚵"
        }
    }
}