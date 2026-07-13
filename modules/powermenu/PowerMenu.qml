import qs.config.style
import qs.services

import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root

    visible: GlobalStates.powerMenuIsVisible
    color: "transparent"

    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }
    margins {
        left: (screen.width - implicitWidth) / 2
        right: (screen.width - implicitWidth) / 2
        top: (screen.height - implicitHeight) / 2
        bottom: (screen.height - implicitHeight) / 2
    }
    implicitWidth: powerMenuRect.width
    implicitHeight: powerMenuRect.height
    exclusiveZone: -1
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

    Rectangle {
        id: powerMenuRect

        color: Qt.hsla(Color.baseNormal.hslHue, Color.baseNormal.hslSaturation, Color.baseNormal.hslLightness, 0.7)
        border.color: Color.surfaceNormal

        focus: true
        border.width: Constant.borderSmall
        radius: Constant.roundingLarge * 5

        anchors.centerIn: parent
        implicitWidth: row.implicitWidth + Constant.paddingLarge * 4
        implicitHeight: row.implicitHeight + Constant.paddingLarge * 3

        onVisibleChanged: {
            if (GlobalStates.powerMenuIsVisible) {
                forceActiveFocus();
            }
        }

        Keys.onPressed: event => {
            if (event.key === Qt.Key_Escape) {
                GlobalStates.powerMenuIsVisible = false;
                event.accepted = true;
            }
        }

        RowLayout {
            id: row
            anchors.centerIn: parent
            anchors.margins: Constant.paddingLarge * 2
            spacing: Constant.spacingSmall

            PowerMenuButton {
                id: powerBtn
                buttonIcon: ""
                tooltipText: "Shutdown"

                onLeftClicked: () => {
                    Quickshell.execDetached(["systemctl", "poweroff"]);
                }
            }
            PowerMenuButton {
                id: restartBtn
                buttonIcon: ""
                tooltipText: "Restart"

                onLeftClicked: () => {
                    Quickshell.execDetached(["systemctl", "reboot"]);
                }
            }
            PowerMenuButton {
                id: lockBtn
                buttonIcon: "󰌾"
                tooltipText: "Lock"

                onLeftClicked: () => {
                    Quickshell.execDetached(["hyprlock"]);
                }
            }
            PowerMenuButton {
                id: sleepBtn
                buttonIcon: "󰒲"
                tooltipText: "Sleep"

                onLeftClicked: () => {
                    Quickshell.execDetached(["systemctl", "suspend"]);
                }
            }
            PowerMenuButton {
                id: hibernateBtn
                buttonIcon: ""
                tooltipText: "Hibernate"

                onLeftClicked: () => {
                    Quickshell.execDetached(["systemct l", "hibernate"]);
                }
            }
        }
    }
}
