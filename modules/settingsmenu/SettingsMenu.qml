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
    implicitWidth: Constant.sliderSize * 12
    implicitHeight: settingsMenuContainer.implicitHeight
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
        id: settingsMenuContainer

        color: Qt.hsla(Color.surfaceDark.hslHue, Color.surfaceDark.hslSaturation, Color.surfaceDark.hslLightness, 0.7)
        radius: Constant.roundingMedium
        focus: true

        implicitWidth: parent.width
        implicitHeight: settingsLayout.implicitHeight

        GradientHighlight {}
        BorderHighlight {}
        GradientShadow {}

        ColumnLayout {
            id: settingsLayout

            anchors.centerIn: parent
            implicitWidth: parent.width - Constant.marginSmall * 2

            spacing: Constant.spacingMedium

            Rectangle {
                color: "red"
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40
            }
            Rectangle {
                color: "green"
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40
            }
            Rectangle {
                color: "blue"
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40
            }
        }
    }
}
