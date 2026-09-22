import qs.config.style
import qs.services

import QtQuick

ControlButton {
    id: root

    property int gamma: BrightnessService.gamma
    property int temperature: BrightnessService.temperature
    property bool dimmed: BrightnessService.temperature !== 6000

    tooltip: "Brightness"
    btnIcon: {
        if (root.gamma < 70) {
            return "󰃞";
        } else if (root.gamma < 85) {
            return "󰃟";
        } else {
            return "󰃠";
        }
    }
    btnText: ""

    iconCol: GlobalStates.brightnessSliderIsVisible ? Color.colYellow : (root.dimmed ? Color.colDarkOrange : Color.textNormal)
    iconColHover: GlobalStates.brightnessSliderIsVisible ? Color.colYellow : (root.dimmed ? Color.colOrange : Color.textLight)

    onLeftClicked: () => {
        if (!GlobalStates.brightnessSliderIsVisible) {
            GlobalStates.brightnessSliderIsVisible = true;
            GlobalStates.volumeSliderIsVisible = false;
            GlobalStates.systemTrayIsVisible = false;
        } else {
            GlobalStates.brightnessSliderIsVisible = false;
        }
    }
    onMiddleClicked: () => {
        if (root.dimmed) {
            BrightnessService.bluelight();
        } else {
            BrightnessService.nightlight();
        }
    }
}
