import qs.services
import qs.config.style

import Quickshell
import Quickshell.Hyprland
import QtQuick

PanelWindow {
    id: root

    screen: MonitorService.selectedMonitor
    visible: GlobalStates.wallpaperSwitcherIsVisible
    color: "transparent"

    implicitWidth: MonitorService.selectedMonitor.width
    implicitHeight: Constant.carouselPanelHeight + 2 * (Constant.marginLarge * 2)
    exclusiveZone: -1

    HyprlandFocusGrab {
        id: focusGrab
        windows: [root]
        active: root.visible
        onCleared: GlobalStates.wallpaperSwitcherIsVisible = false
    }

    Rectangle {
        id: switcherContainer

        color: Qt.hsla(Color.baseNormal.hslHue, Color.baseNormal.hslSaturation, Color.baseNormal.hslLightness, 0.5)
        border.color: Color.surfaceNormal
        border.width: Constant.borderSmall

        implicitWidth: parent.width + Constant.carouselItemWidth * 2
        implicitHeight: parent.height

        x: -Constant.carouselItemWidth

        anchors.fill: parent
        focus: true

        WallpaperCarousel {
            monitorOutStr: root.screen.name
        }
    }
}
