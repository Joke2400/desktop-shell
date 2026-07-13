import qs.config.style
import qs.components

import QtQuick

Button {
    id: root

    backgroundColor: Qt.hsla(Color.baseDark.hslHue, Color.baseDark.hslSaturation, Color.baseDark.hslLightness, 0.7)
    backgroundColorHover: Color.overlayNormal
    iconColor: Color.textNormal
    iconColorHover: Color.textDark
    borderColor: Color.surfaceDark
    borderColorHover: Color.baseDark
    hoverSizeIncrease: 10

    iconSize: Constant.iconSizeLarge * 2
    radius: Constant.roundingLarge * 4
    buttonPadding: Constant.paddingMedium
    border.width: Constant.borderSmall
}
