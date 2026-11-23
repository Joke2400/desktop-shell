import qs.services

ControlButtonWide {
    id: root

    property var test: NetworkService.devices

    icon: SystemTrayService.getNetworkIcon(SystemTrayService.networkTrayItem)
    text: "WI-FI"
    subText: "<network name>"
    tooltip: "Network"
}