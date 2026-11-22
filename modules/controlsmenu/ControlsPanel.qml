import qs.services
import qs.config.style
import qs.components.visuals
import qs.modules.controlsmenu.buttons
import qs.modules.controlsmenu.sliders

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
    WlrLayershell.namespace: "quickshell:sidebar-right"
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

    GlassSurface {
        anchors.fill: parent
        radius: Constant.roundingLarge
        tint: Color.tintNormal
    }

    Rectangle {
        id: menuContainer

        color: "transparent"
        anchors.centerIn: parent

        implicitWidth: parent.width - Constant.marginLarge * 2
        implicitHeight: parent.height - Constant.marginLarge * 2

        Column {
            id: column
            anchors.fill: parent
            spacing: Constant.spacingLarge

            ConnectivityWidget {}
            VolumeSlider {}
            BrightnessSlider {}
            GridLayout {
                id: buttonGrid
                columnSpacing: Constant.spacingLarge
                rowSpacing: Constant.spacingLarge
                columns: 4

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
}