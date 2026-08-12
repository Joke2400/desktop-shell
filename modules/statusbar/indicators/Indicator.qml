import qs.config.style
import qs.components

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

    Rectangle {
        anchors.fill: parent
        radius: parent.radius
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: Qt.rgba(0, 0, 0, 0.25)
            }
            GradientStop {
                position: 0.3
                color: Qt.rgba(0, 0, 0, 0.05)
            }
            GradientStop {
                position: 0.7
                color: Qt.rgba(0.5, 0.5, 0.5, 0.0)
            }
            GradientStop {
                position: 0.9
                color: Qt.rgba(1, 1, 1, 0.05)
            }
            GradientStop {
                position: 1.0
                color: Qt.rgba(1, 1, 1, 0.1)
            }
        }
    }
    Rectangle {
        anchors.fill: parent
        radius: parent.radius
        color: "transparent"
        border.width: 1
        border.color: Qt.rgba(1, 1, 1, 0.1)
    }

    onLeftClicked: () => {
        isToggled = !isToggled;
    }
}
