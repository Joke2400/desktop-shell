import qs.config.style
import qs.components

import QtQuick

Button {
    id: root

    required property var action

    bgCol: "transparent"
    bgColHover: "transparent"

    textSize: Constant.textSizeMedium

    padding: Constant.paddingSmall
    radius: Constant.roundingLarge

    onLeftClicked: action()
}
