import qs.config.style
import qs.components
import qs.services

import QtQuick

Button {
    id: root

    property int gamma: BrightnessService.gamma
    property int temperature: BrightnessService.temperature
    property bool dimmed: BrightnessService.temperature !== 6500

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
    backgroundColorHover: Color.baseLight
    iconColor: GlobalStates.brightnessSliderIsVisible ? Color.colYellow : (root.dimmed ? Color.colDarkOrange : Color.textNormal)
    iconColorHover: GlobalStates.brightnessSliderIsVisible ? Color.colYellow : (root.dimmed ? Color.colOrange : Color.textLight)

    radius: Constant.roundingLarge
    iconSize: Constant.iconSizeMedium

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
