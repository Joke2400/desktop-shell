pragma ComponentBehavior: Bound
import qs.config.style
import qs.components.style

import Quickshell
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property int activeIndex: 0

    color: Qt.hsla(Color.baseNormal.hslHue, Color.baseNormal.hslSaturation, Color.baseNormal.hslLightness, 0.7)
    radius: Constant.roundingLarge * 5
    focus: true

    anchors.centerIn: parent
    implicitWidth: row.implicitWidth + Constant.marginMedium * 4
    implicitHeight: row.implicitHeight + Constant.marginMedium * 3

    GradientHighlight {}
    BorderHighlight {}
    GradientShadow {}

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
                    action: "hyprshutdown --vt 2 -p 'systemctl poweroff'"
                }
                ListElement {
                    buttonIcon: ""
                    tooltipText: "Restart"
                    action: "hyprshutdown --vt 2 -p 'systemctl reboot'"
                }
                ListElement {
                    buttonIcon: "󰌾"
                    tooltipText: "Lock"
                    action: "hyprlock"
                }
                ListElement {
                    buttonIcon: "󰗼"
                    tooltipText: "Logout"
                    action: "hyprshutdown --vt 2"
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
