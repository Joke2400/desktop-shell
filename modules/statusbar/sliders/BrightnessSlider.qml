import qs.config.style
import qs.components
import qs.services

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

SliderPanel {
    id: root

    visible: GlobalStates.brightnessSliderIsVisible
    color: "transparent"

    property int gamma: BrightnessService.gamma
    property int temperature: BrightnessService.temperature
    property bool dimmed: BrightnessService.temperature !== 6500

    HyprlandFocusGrab {
        id: focusGrab
        windows: [root]
        active: root.visible
        onCleared: GlobalStates.brightnessSliderIsVisible = false
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
                ratio: root.gamma / 100

                ratioMin: 0.5
                ratioMax: 1

                onApplied: ratio => {
                    BrightnessService.setGamma(Math.round(ratio * 100));
                }
            }
        }
    }
}
