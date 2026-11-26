import qs.services

ControlButtonWide {
    id: root

    icon: SystemTrayService.getBluetoothIcon(SystemTrayService.bluetoothTrayItem)
    text: "Bluetooth"
    subText: "<device name>"
    tooltip: "Bluetooth"
}