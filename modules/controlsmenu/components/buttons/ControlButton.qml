import qs.config.style
import qs.components
import qs.components.visuals

import QtQuick

Button {
    id: root

    required property var leftAction
    property var middleAction
    property var rightAction

    bgCol: "transparent"
    bgColHover: "transparent"

    textSize: Constant.textSizeHuge * 1
    minBtnSize: Constant.textSizeHuge * 1.75

    padding: Constant.paddingSmall

    onLeftClicked: leftAction()
    onMiddleClicked: if (middleAction) middleAction()
    onRightClicked: if (rightAction) rightAction()

    Rectangle {
        anchors.fill: parent
        radius: Constant.roundingLarge * 2
        color: Qt.hsla(Color.baseLight.hslHue, Color.baseLight.hslSaturation, Color.baseLight.hslLightness, 0.5)
        z: -2
    }

    GlassSurface {
        anchors.fill: parent
        radius: Constant.roundingLarge * 2
        tint: root.hovered? Color.tintLight : Color.tintNormal
        z: -1
    }
}
