import qs.config.style
import qs.services

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Rectangle {
    id: root

    color: "transparent"

    implicitWidth: rowLayout.implicitWidth
    implicitHeight: Constant.barHeight + Constant.paddingSmall * 2

    RowLayout {
        id: rowLayout
        anchors.centerIn: parent
        spacing: Constant.spacingSmall

        IndicatorButton {
            id: batteryIndicator
            btnIcon: {
                if (BatteryService.isFull)
                    return "󰂄";
                if (BatteryService.percentage < 15) {
                    return BatteryService.isCharging ? "󰢟" : "󰂎";
                } else if (BatteryService.percentage < 33) {
                    return BatteryService.isCharging ? "󱊤" : "󱊡";
                } else if (BatteryService.percentage < 66) {
                    return BatteryService.isCharging ? "󱊥" : "󱊢";
                } else {
                    return BatteryService.isCharging ? "󱊦" : "󱊣";
                }
            }
            btnText: BatteryService.percentage + "%"
            tooltip: "Battery Level"

            visible: BatteryService.battery !== null
        }

        IndicatorButton {
            id: cpuIndicator
            btnIcon: ""
            btnText: isToggled ? SystemDataService.cpuFreqGHz + "GHz" : SystemDataService.cpuPercent.toFixed(1) + "%"
            tooltip: "CPU Usage"
            onRightClicked: () => {
                Hyprland.dispatch("exec [float; center; size 1000 700] kitty --override font_size=12 --title float_kitty btop");
            }
        }
        IndicatorButton {
            id: memIndicator
            btnIcon: ""
            btnText: isToggled ? SystemDataService.memUsedGB + "GB" : SystemDataService.memPercent.toFixed(1) + "%"
            tooltip: "Memory Usage"
            onRightClicked: () => {
                Hyprland.dispatch("exec [float; center; size 1000 700] kitty --override font_size=12 --title float_kitty btop");
            }
        }
        IndicatorButton {
            id: diskIndicator
            btnIcon: "󰋊"
            btnText: isToggled ? (SystemDataService.diskUsedGB / 1024).toFixed(2) + "TB/" + (SystemDataService.diskTotalGB / 1024).toFixed(2) + "TB" : SystemDataService.diskPercent.toFixed(1) + "%"
            tooltip: "Disk Usage"
            onRightClicked: () => {
                Hyprland.dispatch("exec [float; center; size 1000 700] gnome-disks");
            }
        }
    }
}
