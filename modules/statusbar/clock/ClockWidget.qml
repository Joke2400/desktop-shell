import qs.config.style
import qs.components
import qs.services

import QtQuick
import QtQuick.Layouts
import Quickshell

Button {
    id: root
    property bool isToggled: false

    buttonText: Qt.formatTime(ClockService.date, "HH:mm:ss")
    tooltipText: "Clock"

    backgroundColorHover: Color.baseDark
    textColor: Color.subTextNormal
    textColorHover: Color.accentNormal
    borderColor: Color.surfaceNormal
    borderColorHover: Color.accentDark

    textSize: Constant.fontSizeLarge
    innerSpacing: 0
    radius: Constant.roundingLarge
    buttonPadding: Constant.paddingMedium
    border.width: Constant.borderSmall

    width: textElementMaxWidthMetric.advanceWidth + buttonPadding * 2

    TextMetrics {
        id: textElementMaxWidthMetric
        font.family: Theme.fontFamily
        font.pixelSize: root.textSize + root.hoverSizeIncrease
        font.bold: true
        text: Qt.formatDate(ClockService.date, "dd.MM.yyyy")
    }

    onLeftClicked: () => {
        isToggled = !isToggled;
        if (isToggled) {
            root.buttonText = Qt.formatDate(ClockService.date, "dd.MM.yyyy");
        } else {
            root.buttonText = Qt.formatTime(ClockService.date, "HH:mm:ss");
        }
    }
}
