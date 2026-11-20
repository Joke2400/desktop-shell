import qs.services
import qs.config.style
import qs.config.settings
import qs.components.visuals

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: root

    screen: MonitorService.selectedMonitor
    anchors {
        top: Settings.statusbarPosition === "top" ? true : false
        bottom: Settings.statusbarPosition === "bottom" ? true : false
        left: true
        right: true
    }
    WlrLayershell.namespace: "quickshell:shell"
    color: "transparent"

    margins {
        top: (Constant.marginSmall / 2)
        left: Constant.marginSmall / 2
        right: Constant.marginSmall / 2
        bottom: (Constant.marginSmall / 2)
    }

    implicitHeight: barContainer.implicitHeight

    Rectangle {
        id: barContainer

        color: "transparent"

        implicitWidth: parent.width
        implicitHeight: Constant.barHeight + Constant.paddingSmall * 2

        GlassSurface {
            anchors.fill: parent
            radius: Constant.roundingMedium
            tint: Color.tintNormal
        }

        RowLayout {
            id: rowLayout
            anchors.fill: parent
            anchors.leftMargin: Constant.marginMedium
            anchors.rightMargin: Constant.marginMedium
            spacing: 0

            BarButton {
                text: ""
                tooltip: "Settings"
                leftAction: () => { }
            }
            BarButton {
                text: ""
                tooltip: "Applications"
                leftAction: () => { }
            }
            BarButton {
                text: ""
                tooltip: "Search"
                leftAction: () => { }
            }
            Item {
                Layout.fillWidth: true
            }

            BarIndicator {
                text: {
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
                tooltip: "Battery: " + BatteryService.percentage + "%"
                visible: BatteryService.battery !== null
            }
            BarIndicator {
                text: SystemTrayService.getNetworkTrayItemIcon(SystemTrayService.networkTrayItem)
                tooltip: "Internet"
            }
            BarButton {
                text: ""
                tooltip: "Controls"
                leftAction: () => { StateService.openMenu("showControlsMenu") }
            }
            // Note: the notifications menu is still handled by swaync
            BarButton {
                text: ""
                tooltip: "Notifications"
                leftAction: () => { StateService.openMenu("showNotificationsMenu") }
            }
            BarButton {
                text: ""
                tooltip: "Power"
                leftAction: () => { StateService.openMenu("showPowerMenu") };
            }

        }
    }
}
