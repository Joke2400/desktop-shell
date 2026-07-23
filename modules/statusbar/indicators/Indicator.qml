import qs.config.style
import qs.components

import QtQuick

Button {
    id: root

    property bool isToggled: false

    backgroundColorHover: Color.baseLight
    textColor: Color.subTextNormal
    textColorHover: Color.accentNormal
    iconColor: Color.subTextNormal
    iconColorHover: Color.accentNormal

    textSize: Constant.fontSizeMedium
    iconSize: Constant.iconSizeSmall
    innerSpacing: Constant.spacingSmall
    radius: Constant.roundingLarge
    buttonPadding: Constant.paddingMedium

    onLeftClicked: () => {
        isToggled = !isToggled;
    }
}
