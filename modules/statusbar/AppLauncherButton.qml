import qs.config.style
import qs.components

import QtQuick
import Quickshell.Hyprland

Button {
    id: root

    buttonIcon: "󱄅"
    tooltipText: "Launcher"

    backgroundColor: Color.accentNormal
    backgroundColorHover: Color.accentLight

    iconColor: Color.textNormal
    iconColorHover: Color.textLight

    iconSize: Constant.iconSizeLarge
    radius: Constant.roundingLarge
    buttonPadding: 0

    Rectangle {
        anchors.fill: parent
        radius: parent.radius
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: Qt.rgba(1, 1, 1, 0.2)
            }
            GradientStop {
                position: 0.3
                color: Qt.rgba(1, 1, 1, 0.05)
            }
            GradientStop {
                position: 0.5
                color: Qt.rgba(0, 0, 0, 0.0)
            }
            GradientStop {
                position: 0.7
                color: Qt.rgba(0, 0, 0, 0.05)
            }
            GradientStop {
                position: 1.0
                color: Qt.rgba(0, 0, 0, 0.3)
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
        Hyprland.dispatch("exec toggle-rofi");
    }
}
