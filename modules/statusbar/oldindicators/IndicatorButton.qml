import qs.config.style
import qs.components
import qs.components.style

import QtQuick

Button {
    id: root

    property bool isToggled: false

    bgCol: Color.baseDark
    brCol: Color.baseLight
    bgColHover: Color.baseLight
    brColHover: Color.surfaceDark

    iconCol: Color.subTextNormal
    textCol: Color.subTextNormal
    iconColHover: Color.accentLight
    textColHover: Color.accentLight

    spacing: Constant.spacingSmall
    padding: Constant.paddingMedium * 1.25

    radius: Constant.roundingLarge

    GradientShadow {
        topCol: Qt.rgba(1, 1, 1, 0)
        centerCol: Qt.rgba(1, 1, 1, 0.03)
        bottomCol: Qt.rgba(1, 1, 1, 0.06)
    }
    BorderHighlight {}

    onLeftClicked: () => {
        isToggled = !isToggled;
    }
}
