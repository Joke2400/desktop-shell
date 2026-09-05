import qs.config.style
import qs.components
import qs.components.style
import qs.services

import QtQuick

Button {
    id: root
    property bool isToggled: false

    property string time: Qt.formatTime(ClockService.date, "HH:mm:ss")
    property string date: Qt.formatDate(ClockService.date, "dd.MM.yyyy")

    buttonIcon: root.isToggled ? "" : ""
    buttonText: root.isToggled ? root.date : root.time
    tooltipText: "Clock"

    backgroundColor: Color.baseDark
    backgroundColorHover: Color.baseLight

    iconColor: Color.textNormal
    iconColorHover: Color.textLight
    textColor: Color.textNormal
    textColorHover: Color.textLight
    textSize: Constant.fontSizeMedium
    iconSize: Constant.iconSizeSmall
    innerSpacing: Constant.spacingSmall
    radius: Constant.roundingLarge
    buttonPadding: Constant.paddingSmall

    alignToBaseline: false

    height: Constant.barHeight + buttonPadding * 2
    width: implicitWidth + buttonPadding * 2

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
