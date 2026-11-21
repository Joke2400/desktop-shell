import qs.services
import qs.config.style
import qs.components.visuals

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Rectangle {
    id: root

    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    color: "transparent"
    radius: Constant.roundingMedium

    RowLayout {
        id: layout
        spacing: 0

        BarButton {
            id: settingsBtn
            text: ""
            tooltip: "Settings"
            leftAction: () => { StateService.openMenu("showSettingsMenu") }

            implicitWidth: settingsBtn.implicitHeight
            implicitHeight: settingsBtn.minBtnSize + Constant.paddingSmall * 2.5

            Rectangle {
                anchors.fill: parent
                radius: Constant.roundingLarge
                color: Qt.hsla(Color.accentNormal.hslHue, Color.accentNormal.hslSaturation, Color.accentNormal.hslLightness, 0.66)
                z: -2
            }

            GlassSurface {
                anchors.fill: parent
                radius: Constant.roundingLarge
                tint: Color.tintDark
                edgeLight: 0
                z: -1
            }
        }
        BarButton {
            text: ""
            tooltip: "Search"
            leftAction: () => { Hyprland.dispatch("exec toggle-rofi") }
        }
        BarButtonDual {
            icon: "󱟲"
            text: WorkspaceService.activeWorkspace
            tooltip: "Workspaces"
            textSize: Constant.textSizeSmall * 1.2
            leftAction: () => { }
        }
    }
}
