import qs.config.style
import qs.components
import qs.components.style

import Quickshell
import QtQuick

Button {
    id: root

    required property string action
    required property bool isActive

    backgroundColor: Qt.hsla(Color.baseDark.hslHue, Color.baseDark.hslSaturation, Color.baseDark.hslLightness, 0.7)
    backgroundColorHover: Color.overlayNormal
    iconColor: isActive ? Color.accentLight : Color.overlayNormal
    iconColorHover: Color.baseDark
    borderColorHover: Color.baseDark
    hoverSizeIncrease: 10

    iconSize: Constant.iconSizeLarge * 2
    radius: Constant.roundingLarge * 4
    buttonPadding: Constant.paddingMedium

    GradientHighlight {
        inverted: true
    }
    BorderHighlight {}
    GradientShadow {
        inverted: true
    }

    onLeftClicked: () => {
        Quickshell.execDetached(action.split(" "));
    }
}
