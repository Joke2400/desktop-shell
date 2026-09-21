import qs.services
import qs.config.style
import qs.components.style

import Quickshell
import Quickshell.Hyprland

import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root

    screen: MonitorService.selectedMonitor
    visible: GlobalStates.sidebarIsVisible
    color: "transparent"

    anchors {
        top: true
        bottom: true
        left: true
    }
    margins {
        top: Constant.marginSmall
        left: Constant.marginSmall
        bottom: Constant.marginSmall
    }
    implicitWidth: Constant.sidebarWidth
    implicitHeight: sidebarContainer.implicitHeight

    exclusiveZone: 0

    HyprlandFocusGrab {
        id: focusGrab
        windows: [root]
        active: root.visible
        onCleared: GlobalStates.sidebarIsVisible = false

        onActiveChanged: {
            if (active) {}
        }
    }

    Rectangle {
        id: sidebarContainer

        color: Qt.hsla(Color.baseLight.hslHue, Color.baseLight.hslSaturation, Color.baseLight.hslLightness, 0.7)
        border.color: Color.surfaceDark
        radius: Constant.roundingSmall
        focus: true

        implicitWidth: parent.width
        implicitHeight: sidebarLayout.implicitHeight + Constant.marginMedium * 2

        GradientHighlight {}
        BorderHighlight {}
        GradientShadow {}

        ColumnLayout {
            id: sidebarLayout

            anchors.centerIn: parent
            implicitWidth: parent.width - Constant.marginMedium * 2

            spacing: Constant.spacingMedium

            InfoBox {}
        }
    }
}
