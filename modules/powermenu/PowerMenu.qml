import qs.services

import Quickshell
import Quickshell.Hyprland
import QtQuick

PanelWindow {
    id: root

    screen: MonitorService.selectedMonitor
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
    implicitWidth: powerMenuTray.width
    implicitHeight: powerMenuTray.height
    exclusiveZone: -1

    HyprlandFocusGrab {
        id: focusGrab
        windows: [root, powerMenuTray]
        active: root.visible
        onCleared: GlobalStates.powerMenuIsVisible = false

        onActiveChanged: {
            if (active) {
                powerMenuTray.forceActiveFocus();
            }
        }
    }

    PowerMenuTray {
        id: powerMenuTray
    }
}
