import qs.config.style
import qs.services

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

PanelWindow {
    id: root

    visible: GlobalStates.systemTrayIsVisible
    color: "transparent"

    anchors {
        top: true
        left: true
    }
    margins {
        top: 0
        left: GlobalStates.trayButtonPosX + (Constant.iconSizeMedium / 2) - (root.implicitWidth / 2)
    }
    exclusiveZone: 0

    implicitWidth: gridContainer.implicitWidth
    implicitHeight: gridContainer.implicitHeight

    HyprlandFocusGrab {
        id: focusGrab
        windows: [root]
        active: root.visible
        onCleared: GlobalStates.systemTrayIsVisible = false
    }

    Rectangle {
        id: gridContainer

        implicitWidth: column.implicitWidth + Constant.paddingLarge * 2
        implicitHeight: column.implicitHeight + Constant.paddingLarge * 2
        color: Color.baseLight
        border.color: Color.surfaceNormal
        radius: Constant.roundingMedium

        GridLayout {
            id: column
            columnSpacing: Constant.spacingMedium
            rowSpacing: Constant.spacingMedium
            anchors.centerIn: parent
            columns: 3

            Repeater {
                model: SystemTrayService.trayItems
                delegate: SystemTrayItem {
                    displayIcon: SystemTrayService.getTrayItemIcon(modelData)
                    iconSize: Constant.iconSizeMedium
                    radius: Constant.roundingMedium
                    buttonPadding: Constant.paddingSmall
                    border.width: Constant.borderSmall
                }
            }
        }
    }
}
