pragma ComponentBehavior: Bound
import qs.config.style
import qs.components.style

import Quickshell
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property int activeIndex: 0
    property var buttonData: [
        {
            buttonIcon: "",
            tooltipText: "Shutdown",
            action: () => Quickshell.execDetached(["hyprshutdown", "--vt", "2", "-p", "systemctl poweroff"])
        },
        {
            buttonIcon: "",
            tooltipText: "Reboot",
            action: () => Quickshell.execDetached(["hyprshutdown", "--vt", "2", "-p", "systemctl reboot"])
        },
        {
            buttonIcon: "󰌾",
            tooltipText: "Lock",
            action: () => Quickshell.execDetached(["hyprlock"])
        },
        {
            buttonIcon: "󰗼",
            tooltipText: "Logout",
            action: () => Quickshell.execDetached(["hyprshutdown", "--vt", "2"])
        },
        {
            buttonIcon: "󰒲",
            tooltipText: "Sleep",
            action: () => Quickshell.execDetached(["systemctl", "suspend"])
        },
        {
            buttonIcon: "",
            tooltipText: "Hibernate",
            action: () => Quickshell.execDetached(["systemctl", "hibernate"])
        }
    ]

    color: Qt.hsla(Color.surfaceDark.hslHue, Color.surfaceDark.hslSaturation, Color.surfaceDark.hslLightness, 0.7)
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
        spacing: Constant.spacingMedium

        Repeater {
            model: root.buttonData
            delegate: PowerMenuButton {
                required property var modelData
                required property int index
                buttonIcon: modelData.buttonIcon
                tooltipText: modelData.tooltipText
                action: modelData.action
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
                item.action();
            }
            event.accepted = true;
        }
    }
}
