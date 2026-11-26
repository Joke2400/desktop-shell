import qs.services
import qs.config.style
import qs.components.visuals
import qs.modules.controlsmenu.widgets


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
    color: "red"

    margins {
        top: Constant.marginSmall
        right: Constant.marginSmall
    }

    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight

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
        id: container
        anchors.fill: parent

        RowLayout {
            id: row
            anchors.fill: parent
            spacing: Constant.spacingMedium

            SystemTrayWidget { id: tray }
            ColumnLayout {
                id: column
                spacing: Constant.spacingMedium

                Layout.preferredWidth: Constant.controlsMenuWidth

                ConnectivityWidget {}
                SlidersWidget {}
                ControlButtonsWidget {}
            }
        }

    }
}