import qs.config.style
import qs.services

import QtQuick
import Quickshell.Hyprland

ControlButton {
    id: root

    property int volume: AudioService.volume
    property bool muted: AudioService.muted

    tooltip: "Volume"
    btnIcon: {
        if (root.muted || root.volume === 0) {
            return "";
        } else if (root.volume < 33) {
            return "";
        } else if (root.volume < 66) {
            return "";
        } else {
            return "";
        }
    }
    btnText: ""

    iconSize: Constant.iconSizeMedium * 0.95 // accounting for differences in apparent font size

    iconCol: GlobalStates.volumeSliderIsVisible ? Color.colYellow : (root.muted ? Color.colMaroon : Color.textNormal)
    iconColHover: GlobalStates.volumeSliderIsVisible ? Color.colYellow : (root.muted ? Color.colRed : Color.textLight)

    onLeftClicked: () => {
        if (!GlobalStates.volumeSliderIsVisible) {
            GlobalStates.volumeSliderIsVisible = true;
            GlobalStates.brightnessSliderIsVisible = false;
            GlobalStates.systemTrayIsVisible = false;
        } else {
            GlobalStates.volumeSliderIsVisible = false;
        }
    }
    onMiddleClicked: () => {
        AudioService.toggleMute();
    }
    onRightClicked: {
        Hyprland.dispatch("exec [float; center; size monitor_w*0.5 monitor_h*0.5] pavucontrol");
    }
}
