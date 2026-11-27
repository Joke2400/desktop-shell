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

    readonly property int maxContentWidth: Constant.controlsMenuWidth + Constant.spacingLarge + systemTray.implicitWidth

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
    }

    implicitWidth: root.maxContentWidth + Constant.marginMedium * 2
    implicitHeight: container.implicitHeight + Constant.marginMedium * 2
    mask: Region { item: glass }

    exclusiveZone: 0

    HyprlandFocusGrab {
        id: focusGrab
        windows: [root]
        active: root.visible && !StateService.systemTrayContextMenuOpen
        onCleared: {
            StateService.showControlsMenu = false
            StateService.showSystemTrayMenu = false
        }
        onActiveChanged: {
            if (active) {}
        }
    }

    GlassSurface {
        id: glass
        anchors.top: parent.top
        anchors.right: parent.right
        width: container.implicitWidth + Constant.marginMedium * 2
        height: parent.height

        radius: Constant.roundingMedium
        tint: Color.tintNormal

        Behavior on width { NumberAnimation { duration: 100 }}
    }

    Rectangle {
        id: container

        color: "transparent"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: Constant.marginMedium
        anchors.rightMargin: Constant.marginMedium
        implicitWidth: systemTray.visible ? root.maxContentWidth : Constant.controlsMenuWidth
        implicitHeight: row.height

        RowLayout {
            id: row
            implicitWidth: parent.width
            spacing: Constant.spacingLarge

            SystemTrayWidget {
                id: systemTray
                opacity: StateService.showSystemTrayMenu ? 1 : 0
                visible: opacity > 0
                Behavior on opacity { NumberAnimation { duration: 150; easing.type: Easing.OutCubic } }
            }
            ColumnLayout {
                id: column
                spacing: Constant.spacingLarge * 2
                Layout.preferredWidth: Constant.controlsMenuWidth
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                ConnectivityWidget {}
                SlidersWidget {}
                ControlButtonsWidget {}
            }
        }
    }
}