import qs.services
import qs.config.style
import qs.components
import qs.components.visuals
import qs.modules.controlsmenu.widgets


import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland

PanelWindow {
    id: root

    readonly property int maxContentWidth: trayButton.implicitWidth + systemTray.implicitWidth + Constant.controlsMenuWidth + Constant.spacingLarge * 2
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

    implicitWidth: root.maxContentWidth + Constant.marginLarge
    implicitHeight: container.implicitHeight + Constant.marginLarge

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

        width: systemTray.visible
                ? systemTray.implicitWidth + Constant.spacingLarge + Constant.controlsMenuWidth + Constant.marginLarge * 2
                : Constant.controlsMenuWidth + Constant.marginLarge * 2
        height: parent.height

        radius: Constant.roundingMedium
        tint: Color.tintNormal

        Behavior on width { NumberAnimation { duration: 50 }}
    }

    Rectangle {
        id: container

        color: "transparent"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: Constant.marginLarge
        anchors.rightMargin: Constant.marginLarge
        implicitWidth: systemTray.visible ? root.maxContentWidth : trayButton.implicitWidth + Constant.controlsMenuWidth + Constant.spacingLarge
        implicitHeight: row.height + Constant.marginLarge

        RowLayout {
            id: row
            implicitWidth: parent.width
            spacing: Constant.spacingLarge

            Button {
                id: trayButton
                text: StateService.showSystemTrayMenu ? "󰅂" : "󰅁"
                tooltip: "Open system tray"
                onLeftClicked: () => {
                    StateService.showSystemTrayMenu = !StateService.showSystemTrayMenu
                }
                implicitWidth: Constant.buttonSize
                implicitHeight: Constant.buttonSize
                textSize: Constant.textSizeHuge
                color: "transparent"
                padding: 0
            }
            SystemTrayWidget {
                id: systemTray
                opacity: StateService.showSystemTrayMenu ? 1 : 0
                visible: opacity > 0
                Behavior on opacity { NumberAnimation { duration: 100; easing.type: Easing.OutCubic } }
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