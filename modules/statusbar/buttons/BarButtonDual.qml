import qs.config.style
import qs.components

import QtQuick

ButtonDual {
    id: root

    required property var leftAction
    property var middleAction
    property var rightAction

    iconSize: Constant.textSizeMedium
    textSize: Constant.textSizeSmall

    padding: Constant.paddingSmall
    radius: Constant.roundingLarge

    onLeftClicked: leftAction()
    onMiddleClicked: middleAction()
    onRightClicked: rightAction()
}
