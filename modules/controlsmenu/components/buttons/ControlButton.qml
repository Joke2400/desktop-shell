import qs.config.style
import qs.components
import qs.components.visuals

import QtQuick

Button {
    id: root

    required property var leftAction
    property var middleAction
    property var rightAction

    property bool displayBgGlass: true

    bgCol: "transparent"
    bgColHover: "transparent"

    textSize: Constant.textSizeHuge * 1
    minBtnSize: Constant.textSizeHuge * 1.75

    padding: Constant.paddingSmall

    onLeftClicked: leftAction()
    onMiddleClicked: if (middleAction) middleAction()
    onRightClicked: if (rightAction) rightAction()

    Rectangle {
        visible: root.displayBgGlass
        anchors.fill: parent
        radius: Constant.roundingLarge * 2
        color: Qt.hsla(Color.surfaceDark.hslHue, Color.surfaceDark.hslSaturation, Color.surfaceDark.hslLightness, 0.5)
        z: -2
    }

    GlassSurface {
        visible: root.displayBgGlass
        anchors.fill: parent
        radius: Constant.roundingLarge * 2
        tint: root.hovered ? Color.tintLight : Color.tintNormal
        z: -1
        edgeLight: 0
    }
}
