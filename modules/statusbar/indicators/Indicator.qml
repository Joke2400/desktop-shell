import qs.config.style
import qs.components
import qs.components.style

import QtQuick

Button {
    id: root

    property bool isToggled: false

    backgroundColor: Color.baseDark
    backgroundColorHover: Color.baseLight
    textColor: Color.subTextNormal
    textColorHover: Color.accentLight
    iconColor: Color.subTextNormal
    iconColorHover: Color.accentLight

    textSize: Constant.fontSizeMedium
    iconSize: Constant.iconSizeSmall
    innerSpacing: Constant.spacingSmall
    radius: Constant.roundingLarge
    buttonPadding: Constant.paddingMedium * 1.25

    GradientShadow {
        topCol: Qt.rgba(1, 1, 1, 0)
        centerCol: Qt.rgba(1, 1, 1, 0.03)
        bottomCol: Qt.rgba(1, 1, 1, 0.06)
    }
    BorderHighlight {
        borderCol: Qt.rgba(1, 1, 1, 0.1)
    }

    onLeftClicked: () => {
        isToggled = !isToggled;
    }
}
