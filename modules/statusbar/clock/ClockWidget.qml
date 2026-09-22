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

    bgCol: Color.baseDark
    brCol: Color.baseLight
    bgColHover: Color.baseLight
    brColHover: Color.surfaceDark

    tooltip: root.isToggled ? "Date" : "Clock"
    btnIcon: root.isToggled ? "" : ""
    btnText: root.isToggled ? root.date : root.time

    spacing: Constant.spacingSmall
    padding: Constant.paddingMedium * 1.25
    alignTextToBaseline: false

    radius: Constant.roundingLarge
    border.width: Constant.borderSmall

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
