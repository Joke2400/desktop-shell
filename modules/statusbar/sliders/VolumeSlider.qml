import qs.config.style
import qs.components
import qs.services

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

SliderPanel {
    id: root

    visible: GlobalStates.volumeSliderIsVisible
    color: "transparent"

    property int volume: AudioService.volume
    property bool muted: AudioService.muted

    HyprlandFocusGrab {
        id: focusGrab
        windows: [root]
        active: root.visible
        onCleared: GlobalStates.volumeSliderIsVisible = false
    }

    Rectangle {
        id: sliderContainer
        color: "transparent"

        implicitWidth: MonitorService.selectedMonitor.width / 7.5
        implicitHeight: Constant.sliderSize + Constant.paddingMedium * 2

        RowLayout {
            id: sliderLayout

            anchors.fill: parent
            spacing: Constant.spacingMedium

            Slider {
                id: slider
                color: Qt.hsla(Color.surfaceDark.hslHue, Color.surfaceDark.hslSaturation, Color.surfaceDark.hslLightness, 0.6)
                ratio: root.volume / 100

                onApplied: ratio => {
                    AudioService.setVolume(ratio);
                }
            }
        }
    }
}
