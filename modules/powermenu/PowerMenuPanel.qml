import qs.services
import qs.config.style
import qs.components.visuals

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland

PanelWindow {
    id: root

    screen: MonitorService.selectedMonitor
    visible: StateService.showPowerMenu
    anchors {
        top: true
        right: true
    }
    WlrLayershell.namespace: "quickshell:shell"
    color: "transparent"

    margins {
        left: (screen.width - implicitWidth) / 2
        right: (screen.width - implicitWidth) / 2
        top: (screen.height - implicitHeight) / 2
        bottom: (screen.height - implicitHeight) / 2
    }

    implicitWidth: container.implicitWidth
    implicitHeight: container.implicitHeight

    exclusiveZone: -1

    HyprlandFocusGrab {
        id: focusGrab
        windows: [root]
        active: root.visible
        onCleared: StateService.showPowerMenu = false

        onActiveChanged: {
            if (active) {}
        }
    }

    Rectangle {
        id: container

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

        color: "transparent"
        anchors.centerIn: parent
        radius: Constant.roundingLarge * 5
        focus: true

        implicitWidth: row.implicitWidth + Constant.marginMedium * 4
        implicitHeight: row.implicitHeight + Constant.marginMedium * 3

        GlassSurface {
            anchors.fill: parent
            radius: Constant.roundingLarge * 5
            tint: Color.tintDark
        }

        RowLayout {
            id: row
            anchors.centerIn: parent
            spacing: Constant.spacingLarge * 2

            Repeater {
                model: container.buttonData
                delegate: PowerButton {
                    required property var modelData
                    required property int index

                    tooltip: modelData.tooltip
                    text: modelData.btnIcon
                    leftAction: modelData.action

                    isActive: index == container.activeIndex
                }
            }
        }

        Keys.onPressed: event => {
            if (event.isAutoRepeat)
                return;

            if (event.key === Qt.Key_Left) {
                const inx = container.activeIndex - 1;
                container.activeIndex = inx < 0 ? container.buttonData.length - 1 : inx;
                event.accepted = true;

            } else if (event.key === Qt.Key_Right) {
                const inx = container.activeIndex + 1;
                container.activeIndex = inx > container.buttonData.length - 1 ? 0 : inx;
                event.accepted = true;

            } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                const item = container.buttonData[container.activeIndex];
                if (item && item.action) {
                    item.action();
                }
                event.accepted = true;
            }
        }
    }
}