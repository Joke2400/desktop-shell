import qs.config.style
import qs.components

import QtQuick

Button {
    id: root

    property bool isToggled: false

    backgroundColorHover: Color.baseDark
    textColor: Color.subTextNormal
    textColorHover: Color.accentNormal
    iconColor: Color.subTextNormal
    iconColorHover: Color.accentNormal
    borderColor: Color.surfaceNormal
    borderColorHover: Color.accentDark

    textSize: Constant.fontSizeMedium
    iconSize: Constant.iconSizeSmall
    innerSpacing: Constant.spacingSmall
    radius: Constant.roundingLarge
    buttonPadding: Constant.paddingMedium
    border.width: Constant.borderSmall

    onLeftClicked: () => {
        isToggled = !isToggled;
    }
}
