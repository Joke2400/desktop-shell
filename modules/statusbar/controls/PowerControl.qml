import qs.config.style
import qs.components
import qs.services

import QtQuick

Button {
    id: root

    buttonIcon: ""
    tooltipText: "Power Menu"
    backgroundColorHover: Color.overlayLight
    iconColorHover: Color.textDark
    borderColor: Color.accentLight
    borderColorHover: Color.baseNormal

    radius: Constant.roundingLarge
    iconSize: Constant.iconSizeMedium
    border.width: Constant.borderSmall

    onLeftClicked: () => {
        GlobalStates.powerMenuIsVisible = !GlobalStates.powerMenuIsVisible;
    }
}
