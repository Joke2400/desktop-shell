import qs.config.style
import qs.components
import qs.components.style

import QtQuick

Button {
    id: root

    required property var action
    required property bool isActive

    bgCol: Qt.hsla(Color.baseLight.hslHue, Color.baseLight.hslSaturation, Color.baseLight.hslLightness, 0.9)
    brCol: Color.surfaceDark

    bgColHover: Qt.hsla(Color.overlayNormal.hslHue, Color.overlayNormal.hslSaturation, Color.overlayNormal.hslLightness, 0.9)
    brColHover: Color.surfaceLight

    iconSize: Constant.iconSizeLarge * 2

    iconCol: isActive ? Color.accentLight : Color.overlayNormal
    iconColHover: Color.baseDark

    padding: Constant.paddingMedium
    hoverIncreaseAmount: 10
    increaseSizeOnHover: true
    radius: Constant.roundingLarge * 4

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
