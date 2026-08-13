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

    Rectangle {
        anchors.fill: parent
        radius: parent.radius
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: Qt.rgba(0, 0, 0, 0.2)
            }
            GradientStop {
                position: 0.3
                color: Qt.rgba(0, 0, 0, 0.05)
            }
            GradientStop {
                position: 0.5
                color: Qt.rgba(0.5, 0.5, 0.5, 0.0)
            }
            GradientStop {
                position: 0.8
                color: Qt.rgba(1, 1, 1, 0.05)
            }
            GradientStop {
                position: 1.0
                color: Qt.rgba(1, 1, 1, 0.07)
            }
        }
    }
    Rectangle {
        anchors.fill: parent
        radius: parent.radius
        color: "transparent"
        border.width: 1
        border.color: Qt.rgba(1, 1, 1, 0.15)
    }

    onLeftClicked: () => {
        isToggled = !isToggled;
    }
}
