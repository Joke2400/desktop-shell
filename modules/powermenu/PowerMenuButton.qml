import qs.config.style
import qs.components

import Quickshell
import QtQuick

Button {
    id: root

    required property string action
    required property bool isActive

    backgroundColor: Qt.hsla(Color.baseDark.hslHue, Color.baseDark.hslSaturation, Color.baseDark.hslLightness, 0.7)
    backgroundColorHover: Color.overlayNormal
    iconColor: isActive ? Color.accentNormal : Color.overlayNormal
    iconColorHover: Color.baseDark
    borderColor: Color.surfaceDark
    borderColorHover: Color.baseDark
    hoverSizeIncrease: 10

    iconSize: Constant.iconSizeLarge * 2
    radius: Constant.roundingLarge * 4
    buttonPadding: Constant.paddingMedium
    border.width: Constant.borderMedium

    onLeftClicked: () => {
        Quickshell.execDetached(action.split(" "));
    }
}
