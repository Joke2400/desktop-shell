import qs.services
import qs.config.style
import qs.config.settings

import Quickshell
import Quickshell.Hyprland
import QtQuick

PanelWindow {
    id: root

    visible: GlobalStates.wallpaperSwitcherIsVisible
    color: "transparent"
    screen: Quickshell.screens[0]

    implicitWidth: Settings.selectedScreen.width
    implicitHeight: Constant.carouselPanelWindowHeight
    exclusiveZone: -1

    HyprlandFocusGrab {
        id: focusGrab
        windows: [root]
        active: root.visible
        onCleared: GlobalStates.wallpaperSwitcherIsVisible = false
    }

    Rectangle {
        id: switcherContainer

        color: Qt.hsla(Color.baseNormal.hslHue, Color.baseNormal.hslSaturation, Color.baseNormal.hslLightness, 0.75)
        border.color: Color.surfaceNormal
        border.width: Constant.borderSmall

        implicitWidth: parent.width + Constant.carouselItemWidth * 2
        implicitHeight: parent.height

        x: switcherContainer.x - Constant.carouselItemWidth

        anchors.fill: parent
        focus: true

        WallpaperCarousel {}
    }
}
