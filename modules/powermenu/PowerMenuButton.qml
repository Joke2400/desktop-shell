import qs.config.style
import qs.components
import qs.components.style

import QtQuick

Button {
    id: root

    required property var action
    required property bool isActive

    backgroundColor: Qt.hsla(Color.baseLight.hslHue, Color.baseLight.hslSaturation, Color.baseLight.hslLightness, 0.9)
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
        root.action();
    }
}
