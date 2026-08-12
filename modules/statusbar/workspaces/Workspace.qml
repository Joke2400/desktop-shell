import qs.config.style
import qs.components
import QtQuick
import Quickshell.Hyprland

Button {
    id: root
    required property int workspaceId
    required property bool isFocused

    buttonIcon: workspaceId
    tooltipText: "Workspace: " + workspaceId

    iconColor: Color.textNormal
    iconColorHover: Color.textLight
    borderColor: Color.surfaceDark
    borderColorHover: Color.overlayDark
    backgroundColor: Color.baseDark
    backgroundColorHover: Color.baseLight
    iconSize: Constant.iconSizeMedium
    hoverSizeIncrease: 4

    border.width: Constant.borderMedium
    radius: Constant.roundingLarge
    color: isFocused || root.hovered ? backgroundColorHover : backgroundColor

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
                position: 0.5
                color: Qt.rgba(0, 0, 0, 0.0)
            }
            GradientStop {
                position: 0.7
                color: Qt.rgba(1, 1, 1, 0.05)
            }
            GradientStop {
                position: 1.0
                color: Qt.rgba(1, 1, 1, 0.1)
            }
        }
    }

    onIsFocusedChanged: {
        if (isFocused) {
            root.iconColor = Color.colOrange;
            root.iconColorHover = Color.colOrange;
            root.borderColor = Color.colDarkOrange;
            root.borderColorHover = Color.colOrange;
        } else {
            root.iconColor = Color.textNormal;
            root.iconColorHover = Color.textLight;
            root.borderColor = Color.surfaceDark;
            root.borderColorHover = Color.overlayDark;
        }
    }

    onLeftClicked: Hyprland.dispatch("workspace " + workspaceId)
}
