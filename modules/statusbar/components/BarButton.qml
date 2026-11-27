import qs.config.style
import qs.components

import QtQuick

Button {
    id: root

    required property var leftAction
    property var middleAction
    property var rightAction

    bgCol: "transparent"
    bgColHover: "transparent"

    textSize: Constant.textSizeMedium
    padding: Constant.paddingSmall
    radius: Constant.roundingLarge

    onLeftClicked: leftAction()
    onMiddleClicked: if (middleAction) middleAction()
    onRightClicked: if (rightAction) rightAction()
}
