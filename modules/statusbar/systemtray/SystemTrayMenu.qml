pragma ComponentBehavior: Bound
import qs.config.style
import qs.components.style
import qs.services

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

PanelWindow {
    id: root

    property bool menuOpen: false

    screen: MonitorService.selectedMonitor
    visible: GlobalStates.systemTrayIsVisible
    color: "transparent"

    anchors {
        top: true
        left: true
    }
    margins {
        top: Constant.marginSmall
        left: GlobalStates.trayButtonPosX + (Constant.iconSizeMedium / 2) - (root.implicitWidth / 2)
    }
    exclusiveZone: 0

    implicitWidth: gridContainer.implicitWidth
    implicitHeight: gridContainer.implicitHeight

    HyprlandFocusGrab {
        id: focusGrab
        windows: [root]
        active: root.visible && !root.menuOpen
        onCleared: {
            if (!root.menuOpen)
                GlobalStates.systemTrayIsVisible = false;
        }
    }

    Rectangle {
        id: gridContainer

        implicitWidth: column.implicitWidth + Constant.marginMedium * 2
        implicitHeight: column.implicitHeight + Constant.marginMedium * 2
        color: Qt.hsla(Color.surfaceDark.hslHue, Color.surfaceDark.hslSaturation, Color.surfaceDark.hslLightness, 0.7)
        radius: Constant.roundingLarge
        border.width: 1
        border.color: Color.surfaceNormal

        GradientHighlight {}
        BorderHighlight {
            borderCol: Qt.rgba(1, 1, 1, 0.01)
        }
        GradientShadow {}

        GridLayout {
            id: column
            columnSpacing: Constant.spacingMedium
            rowSpacing: Constant.spacingMedium
            anchors.centerIn: parent
            columns: 4

            Repeater {
                model: SystemTrayService.trayItems
                delegate: SystemTrayItem {
                    displayIcon: SystemTrayService.getTrayItemIcon(modelData)

                    onMenuOpened: root.menuOpen = true
                    onMenuClosed: root.menuOpen = false
                }
            }
        }
    }
}
