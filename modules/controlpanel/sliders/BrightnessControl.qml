import qs.config.style
import qs.config.settings
import qs.components
import qs.services

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property int gamma: BrightnessService.gamma
    property int temperature: BrightnessService.temperature
    property bool dimmed: root.temperature !== 6500

    function nightlight() {
        BrightnessService.setGamma(75);
        BrightnessService.setTemperature(5000);
    }

    function bluelight() {
        BrightnessService.setGamma(100);
        BrightnessService.setTemperature(6500);
    }

    color: "transparent"

    implicitWidth: parent.width
    implicitHeight: Math.max(Constant.sliderSize, sliderControls.implicitHeight)

    Component.onCompleted: {
        const isNight = (ClockService.hours >= 21 || ClockService.hours < 7);
        if (Settings.adjustBrightnessOnLoad) {
            if (isNight) {
                nightlight();
            } else {
                bluelight();
            }
        }
    }

    RowLayout {
        id: sliderControls

        anchors.fill: parent
        spacing: Constant.spacingMedium

        SliderButton {
            buttonIcon: {
                if (root.gamma < 70) {
                    return "󰃞";
                } else if (root.gamma < 85) {
                    return "󰃟";
                } else {
                    return "󰃠";
                }
            }
            tooltipText: "Brightness"

            iconColor: root.dimmed ? Color.colOrange : Color.textNormal
            iconColorHover: root.dimmed ? Color.colDarkOrange : Color.accentNormal

            onLeftClicked: () => {
                if (root.dimmed) {
                    root.bluelight();
                } else {
                    root.nightlight();
                }
            }
        }
        Slider {
            id: slider
            ratio: root.gamma / 100

            ratioMin: 0.5
            ratioMax: 1

            onApplied: ratio => {
                BrightnessService.setGamma(Math.round(ratio * 100))
            }
        }
    }
}
