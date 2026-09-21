import qs.config.style
import qs.components
import qs.components.style

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
    brCol: Color.surfaceDark
    brColHover: Color.overlayDark
    bgCol: Color.baseDark
    bgColHover: Color.baseLight
    iconSize: Constant.iconSizeMedium
    hoverSizeIncrease: 4

    border.width: Constant.borderMedium
    radius: Constant.roundingLarge
    color: isFocused || root.hovered ? bgColHover : bgCol

    GradientShadow {
        topCol: Qt.rgba(1, 1, 1, 0)
        centerCol: Qt.rgba(1, 1, 1, 0.03)
        bottomCol: Qt.rgba(1, 1, 1, 0.06)
    }

    onIsFocusedChanged: {
        if (isFocused) {
            root.iconColor = Color.accentNormal;
            root.iconColorHover = Color.accentLight;
            root.brCol = Color.accentDark;
            root.brColHover = Color.accentNormal;
        } else {
            root.iconColor = Color.textNormal;
            root.iconColorHover = Color.textLight;
            root.brCol = Color.surfaceDark;
            root.brColHover = Color.overlayDark;
        }
    }

    onLeftClicked: Hyprland.dispatch("workspace " + workspaceId)
}
