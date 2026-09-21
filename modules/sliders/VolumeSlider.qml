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

        implicitWidth: parent.width
        implicitHeight: parent.height

        RowLayout {
            id: sliderLayout

            anchors.fill: parent
            spacing: Constant.spacingMedium

            Slider {
                id: slider
                color: Qt.hsla(Color.baseNormal.hslHue, Color.baseNormal.hslSaturation, Color.baseNormal.hslLightness, 0.9)
                ratio: root.volume / 100

                onApplied: ratio => {
                    AudioService.setVolume(ratio);
                }
            }
        }
    }
}
