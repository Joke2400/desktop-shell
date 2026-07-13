import qs.config.style
import qs.components

import QtQuick.Layouts

Button {

    backgroundColor: Color.surfaceDark
    backgroundColorHover: Color.baseDark
    iconColorHover: Color.accentNormal
    textColorHover: Color.accentNormal
    borderColor: Color.surfaceNormal
    borderColorHover: Color.accentDark

    textSize: Constant.fontSizeLarge
    iconSize: Constant.iconSizeSmall

    radius: Constant.roundingMedium
    buttonPadding: Constant.paddingMedium
    border.width: Constant.borderSmall

    Layout.fillHeight: true
}
