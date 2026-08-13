pragma ComponentBehavior: Bound
import qs.config.style
import qs.services

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

PanelWindow {
    id: root

    property bool menuOpen: false

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
        color: Qt.hsla(Color.baseNormal.hslHue, Color.baseNormal.hslSaturation, Color.baseNormal.hslLightness, 0.9)
        radius: Constant.roundingSmall

        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: Qt.rgba(1, 1, 1, 0.07)
                }
                GradientStop {
                    position: 0.1
                    color: Qt.rgba(1, 1, 1, 0.05)
                }
                GradientStop {
                    position: 0.4
                    color: Qt.rgba(0, 0, 0, 0.0)
                }
                GradientStop {
                    position: 0.7
                    color: Qt.rgba(0, 0, 0, 0.05)
                }
                GradientStop {
                    position: 1.0
                    color: Qt.rgba(0, 0, 0, 0.25)
                }
            }
        }

        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            color: "transparent"
            border.width: 1
            border.color: Qt.rgba(1, 1, 1, 0.2)
        }

        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: Qt.rgba(0, 0, 0, 0.0)
                }
                GradientStop {
                    position: 0.7
                    color: Qt.rgba(0, 0, 0, 0.0)
                }
                GradientStop {
                    position: 1.0
                    color: Qt.rgba(0, 0, 0, 0.08)
                }
            }
        }

        GridLayout {
            id: column
            columnSpacing: Constant.spacingMedium
            rowSpacing: Constant.spacingLarge
            anchors.centerIn: parent
            columns: 4

            Repeater {
                model: SystemTrayService.trayItems
                delegate: SystemTrayItem {
                    displayIcon: SystemTrayService.getTrayItemIcon(modelData)
                    iconSize: Constant.iconSizeMedium * 1.1
                    radius: Constant.roundingMedium
                    buttonPadding: Constant.paddingMedium
                    border.width: Constant.borderSmall

                    onMenuOpened: root.menuOpen = true
                    onMenuClosed: root.menuOpen = false
                }
            }
        }
    }
}
