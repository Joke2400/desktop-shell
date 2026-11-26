import qs.services
import qs.config.style

import Quickshell.Hyprland

ControlSlider {
    id: root

    property int volume: AudioService.volume
    property bool muted: AudioService.muted

    ratio: root.volume / 100
    action: ratio => {
        AudioService.setVolume(ratio);
    }
    btn: SliderButton {
        text: {
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
        tooltip: root.muted ? "Volume: muted" : "Volume: " + root.volume + "%"

        textCol: root.muted ? Color.colMaroon : Color.textNormal
        textColHover: root.muted ? Color.colRed : Color.textLight

        leftAction: () => {
            AudioService.toggleMute()
        }
        rightAction: () => {
            Hyprland.dispatch("exec [float; center; size monitor_w*0.5 monitor_h*0.5] pavucontrol")
        }
    }
}