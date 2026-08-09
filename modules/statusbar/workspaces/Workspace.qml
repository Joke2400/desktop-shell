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
    backgroundColor: Color.baseLight
    backgroundColorHover: Color.surfaceDark
    iconSize: Constant.iconSizeMedium
    hoverSizeIncrease: 4

    border.width: Constant.borderMedium
    radius: Constant.roundingMedium
    color: isFocused || root.hovered ? backgroundColorHover : backgroundColor

    onIsFocusedChanged: {
        if (isFocused) {
            root.iconColor = Color.colOrange;
            root.iconColorHover = Color.colOrange;
            root.borderColor = Color.colOrange;
            root.borderColorHover = Color.colDarkOrange;
        } else {
            root.iconColor = Color.textNormal;
            root.iconColorHover = Color.textLight;
            root.borderColor = Color.surfaceDark;
            root.borderColorHover = Color.overlayDark;
        }
    }

    onLeftClicked: Hyprland.dispatch("workspace " + workspaceId)
}
