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
    visible: GlobalStates.settingsMenuIsVisible
    color: "transparent"

    anchors {
        top: true
        bottom: true
        left: true
    }
    margins {
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
        onCleared: GlobalStates.settingsMenuIsVisible = false

        onActiveChanged: {
            if (active) {}
        }
    }

    Rectangle {
        id: sidebarContainer

        color: Qt.hsla(Color.surfaceDark.hslHue, Color.surfaceDark.hslSaturation, Color.surfaceDark.hslLightness, 0.7)
        radius: Constant.roundingMedium
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
