pragma ComponentBehavior: Bound
import qs.config.style

import Quickshell
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property int activeIndex: 0

    color: Qt.hsla(Color.baseNormal.hslHue, Color.baseNormal.hslSaturation, Color.baseNormal.hslLightness, 0.7)
    border.color: Color.surfaceNormal

    border.width: Constant.borderSmall
    radius: Constant.roundingLarge * 5
    focus: true

    anchors.centerIn: parent
    implicitWidth: row.implicitWidth + Constant.marginMedium * 4
    implicitHeight: row.implicitHeight + Constant.marginMedium * 3

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
                color: Qt.rgba(0, 0, 0, 0.05)
            }
        }
    }

    RowLayout {
        id: row
        anchors.centerIn: parent
        anchors.margins: Constant.paddingLarge * 4
        spacing: Constant.spacingLarge

        Repeater {
            model: ListModel {
                id: listModel
                ListElement {
                    buttonIcon: ""
                    tooltipText: "Shutdown"
                    action: "systemctl poweroff"
                }
                ListElement {
                    buttonIcon: ""
                    tooltipText: "Restart"
                    action: "systemctl reboot"
                }
                ListElement {
                    buttonIcon: "󰌾"
                    tooltipText: "Lock"
                    action: "hyprlock"
                }
                ListElement {
                    buttonIcon: "󰒲"
                    tooltipText: "Sleep"
                    action: "systemctl suspend"
                }
                ListElement {
                    buttonIcon: ""
                    tooltipText: "Hibernate"
                    action: "systemctl hibernate"
                }
            }

            delegate: PowerMenuButton {
                required property var model
                required property int index

                buttonIcon: model.buttonIcon
                action: model.action
                isActive: index == root.activeIndex
            }
        }
    }

    Keys.onPressed: event => {
        if (event.isAutoRepeat)
            return;
        if (event.key === Qt.Key_Left) {
            const inx = root.activeIndex - 1;
            root.activeIndex = inx < 0 ? listModel.count - 1 : inx;
            event.accepted = true;
        } else if (event.key === Qt.Key_Right) {
            const inx = root.activeIndex + 1;
            root.activeIndex = inx > listModel.count - 1 ? 0 : inx;
            event.accepted = true;
        } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
            const item = listModel.get(root.activeIndex);
            if (item && item.action) {
                Quickshell.execDetached(item.action.split(" "));
            }
            event.accepted = true;
        }
    }
}
