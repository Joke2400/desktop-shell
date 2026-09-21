import qs.config.style
import qs.components
import qs.services

import QtQuick

Button {
    id: root

    buttonIcon: ""
    tooltipText: "Power Menu"
    bgColHover: Color.baseLight
    iconColorHover: Color.textLight
    brCol: Color.accentLight

    radius: Constant.roundingLarge
    iconSize: Constant.iconSizeMedium

    onLeftClicked: () => {
        GlobalStates.powerMenuIsVisible = !GlobalStates.powerMenuIsVisible;
    }
}
