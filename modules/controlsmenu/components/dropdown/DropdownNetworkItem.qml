import qs.services

DropdownItem {
    required property var modelData
    readonly property var networkDetails: NetworkService.getNetworkDetails(modelData)


    icon: networkDetails.deviceType === "Wired" ? "󰈀" : "󰖩"
    text: networkDetails.deviceType === "Wired" ? "Wired LAN" : networkDetails.networkName
    subText: networkDetails.known
                ? `${networkDetails.connectionName} (${networkDetails.deviceName})`
                : networkDetails.deviceName

    action: networkDetails.known
            ? () => networkDetails.connected ? modelData.disconnect() : modelData.connect()
            : null
    actionIcon: networkDetails.connected ? "" : "󱘖"
    actionTooltip: networkDetails.connected ? "Disconnect from network" : "Connect to network"
    toggled: networkDetails.connected
}