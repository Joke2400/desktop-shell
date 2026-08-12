import qs.config.style
import qs.components

import QtQuick

Button {
    id: root

    property bool isToggled: false

    backgroundColorHover: Color.baseLight
    textColor: Color.subTextNormal
    textColorHover: Color.accentLight
    iconColor: Color.subTextNormal
    iconColorHover: Color.accentLight

    textSize: Constant.fontSizeMedium
    iconSize: Constant.iconSizeSmall
    innerSpacing: Constant.spacingSmall
    radius: Constant.roundingLarge
    buttonPadding: Constant.paddingMedium * 1.25

    onLeftClicked: () => {
        isToggled = !isToggled;
    }
}
