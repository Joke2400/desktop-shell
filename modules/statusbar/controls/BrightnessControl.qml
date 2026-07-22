import qs.config.style
import qs.components
import qs.services

import QtQuick
import QtQuick.Layouts

Button {
    id: root

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
    iconColorHover: Color.textLight

    radius: Constant.roundingLarge
    iconSize: Constant.iconSizeMedium

    onLeftClicked: () => {
        GlobalStates.powerMenuIsVisible = !GlobalStates.powerMenuIsVisible;
    }
}
