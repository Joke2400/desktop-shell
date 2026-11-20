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
    visible: StateService.showControlsMenu
    anchors {
        top: true
        right: true
    }
    WlrLayershell.namespace: "quickshell:shell"
    color: "transparent"

    margins {
        top: Constant.marginSmall
        right: Constant.marginSmall
        bottom: Constant.marginSmall
    }

    implicitWidth: Constant.controlsMenuWidth
    implicitHeight: 500

    exclusiveZone: 0

    HyprlandFocusGrab {
        id: focusGrab
        windows: [root]
        active: root.visible
        onCleared: StateService.showControlsMenu = false

        onActiveChanged: {
            if (active) {}
        }
    }

    Rectangle {
        id: menuContainer

        color: "transparent"
        anchors.fill: parent

        GlassSurface {
            anchors.fill: parent
            radius: Constant.roundingMedium
            tint: Color.tintNormal
        }

        GridLayout {
            id: buttonGrid
            columnSpacing: Constant.spacingLarge
            rowSpacing: Constant.spacingLarge
            columns: 4

            ControlButton {
                text: SystemTrayService.getNetworkTrayItemIcon(SystemTrayService.networkTrayItem)
                tooltip: "Internet"
                leftAction: () => {  }
            }
            ControlButton {
                text: "󰂯"
                tooltip: "Bluetooth"
                leftAction: () => {  }
            }
            ControlButton {
                text: "󰄀"
                tooltip: "Screenshot"
                leftAction: () => {  }
            }
            ControlButton {
                text: "󰕧"
                tooltip: "Screenrecord"
                leftAction: () => {  }
            }
            ControlButton {
                text: ""
                tooltip: "Calculator"
                leftAction: () => {  }
            }
            ControlButton {
                text: "󱘟"
                tooltip: "Clipboard"
                leftAction: () => {  }
            }
            ControlButton {
                text: "󰀠"
                tooltip: "Alarm"
                leftAction: () => {  }
            }
        }
    }
}