import qs.config.style
import qs.services

import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root

    visible: GlobalStates.wallpaperSwitcherIsVisible
    color: "transparent"

    implicitWidth: screen.width
    implicitHeight: screen.height * 0.5
    exclusiveZone: -1

    HyprlandFocusGrab {
        id: focusGrab
        windows: [root]
        active: root.visible
        onCleared: GlobalStates.wallpaperSwitcherIsVisible = false
    }

    Rectangle {
        id: switcherContainer

        color: Qt.hsla(Color.baseNormal.hslHue, Color.baseNormal.hslSaturation, Color.baseNormal.hslLightness, 0.7)
        border.color: Color.surfaceNormal
        border.width: Constant.borderSmall
        anchors.fill: parent
        focus: true

        WallpaperTray {}
    }
}
