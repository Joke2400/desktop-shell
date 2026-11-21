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

            GlassSurface {
                anchors.fill: parent
                radius: Constant.roundingLarge
                tint: Color.tintAccent
            }
        }
        BarButton {
            text: ""
            tooltip: "Applications"
            leftAction: () => { Hyprland.dispatch("exec toggle-rofi") }
        }
        BarButton {
            text: ""
            tooltip: "Search"
            leftAction: () => { Hyprland.dispatch("exec toggle-rofi") }
        }

    }
}
