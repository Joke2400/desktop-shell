import qs.config.style
import qs.components
import qs.services

import QtQuick
import Quickshell.Hyprland

Button {
    id: root

    property bool muted: AudioService.muted

    buttonIcon: {
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
    tooltipText: "Volume"
    backgroundColorHover: Color.baseLight
    iconColor: root.muted ? Color.colRed : Color.textNormal
    iconColorHover: root.muted ? Color.colMaroon : Color.textLight

    radius: Constant.roundingLarge
    iconSize: Constant.iconSizeMedium * 0.95

    onRightClicked: {
        Hyprland.dispatch("exec [float; center; size monitor_w*0.5 monitor_h*0.5] pavucontrol");
    }
    onLeftClicked: () => {
        AudioService.toggleMute();
    }
}
