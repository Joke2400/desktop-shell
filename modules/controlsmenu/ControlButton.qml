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

    textSize: Constant.textSizeHuge * 1.25
    minBtnSize: Constant.textSizeHuge * 2

    padding: Constant.paddingSmall

    onLeftClicked: leftAction()
    onMiddleClicked: middleAction()
    onRightClicked: rightAction()

    GlassSurface {
        anchors.fill: parent
        radius: Constant.roundingLarge * 2
        tint: root.hovered? Color.tintLight : Color.tintNormal
    }
}
