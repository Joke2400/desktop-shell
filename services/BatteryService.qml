pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root

    property UPowerDevice battery: getBattery()
    property int timeToEmpty: battery ? battery.timeToEmpty : 0
    property int timeToFull: battery ? battery.timeToFull : 0
    property real percentageRaw: battery ? battery.percentage : 0
    property int percentage: Math.round(percentageRaw * 100)

    readonly property bool isCharging: battery && (battery.state === UPowerDeviceState.Charging || battery.state === UPowerDeviceState.PendingCharge)
    readonly property bool isFull: battery && battery.state === UPowerDeviceState.FullyCharged

    function getBattery() {
        var devs = UPower.devices.values;
        for (var i = 0; i < devs.length; i++) {
            var dev = devs[i];
            if (dev.type === UPowerDeviceType.Battery && dev.powerSupply)
                return dev;
        }
        return null;
    }
}
