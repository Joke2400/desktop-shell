import qs.config.style
import qs.components
import qs.services

import QtQuick
import QtQuick.Layouts
import Quickshell

Button {
    id: root
    property bool isToggled: false

    property string time: Qt.formatTime(ClockService.date, "HH:mm:ss")
    property string date: Qt.formatDate(ClockService.date, "dd.MM.yyyy")

    buttonIcon: root.isToggled ? "" : ""
    buttonText: root.isToggled ? root.date : root.time
    tooltipText: "Clock"

    backgroundColorHover: Color.baseLight

    iconColor: Color.textNormal
    iconColorHover: Color.textLight
    textColor: Color.textNormal
    textColorHover: Color.textLight
    textSize: Constant.fontSizeLarge
    iconSize: Constant.iconSizeSmall
    innerSpacing: Constant.spacingSmall
    radius: Constant.roundingLarge
    buttonPadding: Constant.paddingMedium

    alignToBaseline: false

    height: Constant.barHeight
    width: implicitWidth + buttonPadding * 2

    onLeftClicked: () => {
        isToggled = !isToggled;
    }
}
