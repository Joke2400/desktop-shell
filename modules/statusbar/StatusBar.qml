import qs.services
import qs.config.style
import qs.config.settings
import qs.components.visuals
import qs.modules.statusbar.buttons
import qs.modules.statusbar.indicators

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
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
                leftAction: () => { StateService.openMenu("showSettingsMenu") }
            }
            BarButton {
                text: ""
                tooltip: "Applications"
                leftAction: () => { Hyprland.dispatch("exec toggle-rofi") }
            }
            BarButton {
                text: ""
                tooltip: "Search"
                leftAction: () => { Hyprland.dispatch("exec toggle-rofi") }
            }
            Item {
                Layout.fillWidth: true
            }

            BatteryIndicator {}
            BarIndicator {
                text: SystemTrayService.getNetworkTrayItemIcon(SystemTrayService.networkTrayItem)
                tooltip: "Internet"
            }
            BarButton {
                text: ""
                tooltip: "Controls"
                leftAction: () => { StateService.openMenu("showControlsMenu") }
            }
            NotificationButton {}
            BarButton {
                text: ""
                tooltip: "Power"
                leftAction: () => { StateService.openMenu("showPowerMenu") };
            }

        }
    }
}
