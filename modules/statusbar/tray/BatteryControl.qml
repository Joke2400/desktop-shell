import qs.config.style
import qs.components
import qs.services


import QtQuick
import QtQuick.Layouts

Button {
    id: root

    property int percentage: BatteryDataService.percentage
    property int timeToEmpty: BatteryDataService.timeToEmpty
    property bool isCharging: BatteryDataService.isCharging
    property bool isFull: BatteryDataService.isFull

    icon: {
        if (isFull) return "󰂄"
        if (percentage < 15) {
            return isCharging ? "󰢟" : "󰂎"
        } else if (percentage < 33) {
            return isCharging ? "󱊤" : "󱊡"
        } else if (percentage < 66) {
            return isCharging ? "󱊥" : "󱊢"
        } else {
            return isCharging ? "󱊦" : "󱊣"
        }
    }
    tooltipText: "Battery: " + percentage + "%"
    visible: BatteryDataService.battery != null

    backgroundColor: Color.surfaceDark
    backgroundColorHover: Color.baseDark
    iconColorHover: Color.accentNormal
    textColorHover: Color.accentNormal
    borderColor: Color.surfaceNormal
    borderColorHover: Color.accentDark

}
