import qs.services

ControlButtonWide {
    id: root

    icon: SystemTrayService.getNetworkIcon(SystemTrayService.networkTrayItem)
    text: "WI-FI"
    subText: "<network name>"
    tooltip: "Network"
}