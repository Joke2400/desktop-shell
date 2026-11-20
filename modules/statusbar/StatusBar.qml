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
    anchors.top: Settings.statusbarPosition === "top" ? true : false
    anchors.bottom: Settings.statusbarPosition === "bottom" ? true : false
    anchors.left: true
    anchors.right: true
    WlrLayershell.namespace: "quickshell:shell"
    color: "transparent"

    implicitHeight: barContainer.implicitHeight

    margins {
        top: (Constant.marginSmall / 2)
        left: Constant.marginSmall / 2
        right: Constant.marginSmall / 2
        bottom: (Constant.marginSmall / 2)
    }

    Rectangle {
        id: barContainer

        color: "transparent"

        anchors.fill: parent
        implicitWidth: parent.width
        implicitHeight: Constant.barHeight + Constant.paddingSmall * 2

        GlassSurface {
            anchors.fill: parent
            radius: Constant.roundingMedium
            tint: Qt.hsla(Color.baseNormal.hslHue, Color.baseNormal.hslSaturation, Color.baseNormal.hslLightness, 0.06)
        }

        RowLayout {
            id: rowLayout
            anchors.fill: parent
            anchors.leftMargin: Constant.marginMedium
            anchors.rightMargin: Constant.marginMedium
            spacing: Constant.spacingSmall

            Item {
                Layout.fillWidth: true
            }


            BarButton {
                text: "󱊣"
                tooltip: "Battery"
                action: () => {  }
            }
            BarButton {
                text: "󰖩"
                tooltip: "Internet"
                action: () => {  }
            }
            BarButton {
                text: ""
                tooltip: "Controls"
                action: () => {  }
            }
            BarButton {
                text: ""
                tooltip: "Notifications"
                action: () => {  }
            }
            BarButton {
                text: ""
                tooltip: "Power"
                action: () => { GlobalStates.powerMenuIsVisible = !GlobalStates.powerMenuIsVisible };
            }

        }
    }
}
