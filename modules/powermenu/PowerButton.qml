import qs.config.style
import qs.components
import qs.components.visuals

import QtQuick

Button {
    id: root

    required property var leftAction
    required property bool isActive

    bgCol: "transparent"
    brCol: "transparent"

    textSize: Constant.powerButtonSize
    textCol: isActive ? Color.accentLight : Color.overlayNormal
    textColHover: isActive ? Color.accentNormal : Color.overlayLight

    padding: Constant.paddingLarge
    radius: Constant.roundingLarge * 4

    border.width: Constant.borderMedium

    onLeftClicked: leftAction()

    Rectangle {
        anchors.fill: parent
        radius: Constant.roundingLarge * 4
        color: Qt.hsla(Color.baseLight.hslHue, Color.baseLight.hslSaturation, Color.baseLight.hslLightness, 0.5)
        z: -2
    }

    GlassSurface {
        anchors.fill: parent
        radius: Constant.roundingLarge * 4
        tint: root.hovered || root.isActive ? Color.tintLight : Color.tintNormal
        z: -1
    }
}

