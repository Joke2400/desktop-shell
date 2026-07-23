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
        implicitHeight: Math.max(Constant.sliderSize, sliderLayout.implicitHeight)

        RowLayout {
            id: sliderLayout

            anchors.fill: parent
            spacing: Constant.spacingMedium

            Slider {
                id: slider
                ratio: root.volume / 100

                onApplied: ratio => {
                    AudioService.setVolume(ratio);
                }
            }
        }
    }
}
