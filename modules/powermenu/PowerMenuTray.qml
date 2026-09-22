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
            tooltip: "Shutdown",
            btnIcon: "",
            action: () => Quickshell.execDetached(["systemd-run", "--user", "--scope", "--collect", "--", "hyprshutdown", "--vt", "2", "-p", "systemctl poweroff"])
        },
        {
            tooltip: "Reboot",
            btnIcon: "",
            action: () => Quickshell.execDetached(["systemd-run", "--user", "--scope", "--collect", "--", "hyprshutdown", "--vt", "2", "-p", "systemctl reboot"])
        },
        {
            tooltip: "Lock",
            btnIcon: "󰌾",
            action: () => Quickshell.execDetached(["hyprlock"])
        },
        {
            tooltip: "Logout",
            btnIcon: "󰗼",
            action: () => Quickshell.execDetached(["systemd-run", "--user", "--scope", "--collect", "--", "hyprshutdown", "--vt", "2"])
        },
        {
            tooltip: "Sleep",
            btnIcon: "󰒲",
            action: () => Quickshell.execDetached(["systemctl", "suspend"])
        },
        {
            tooltip: "Hibernate",
            btnIcon: "",
            action: () => Quickshell.execDetached(["systemctl", "hibernate"])
        }
    ]

    color: Qt.hsla(Color.baseLight.hslHue, Color.baseLight.hslSaturation, Color.baseLight.hslLightness, 0.7)
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

                tooltip: modelData.tooltip
                btnIcon: modelData.btnIcon
                btnText: ""
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
            root.activeIndex = inx < 0 ? root.buttonData.length - 1 : inx;
            event.accepted = true;
        } else if (event.key === Qt.Key_Right) {
            const inx = root.activeIndex + 1;
            root.activeIndex = inx > root.buttonData.length - 1 ? 0 : inx;
            event.accepted = true;
        } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
            const item = root.buttonData[root.activeIndex];
            if (item && item.action) {
                item.action();
            }
            event.accepted = true;
        }
    }
}
