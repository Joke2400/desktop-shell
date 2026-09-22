import qs.config.style
import qs.components
import qs.components.style

import QtQuick
import Quickshell.Hyprland

Button {
    id: root
    required property int workspaceId
    required property bool isFocused

    bgCol: Color.baseDark
    brCol: Color.surfaceDark
    bgColHover: Color.baseLight
    brColHover: Color.overlayDark

    tooltip: "Workspace: " + workspaceId
    btnIcon: workspaceId // We're simply treating a number as an icon here
    btnText: ""

    iconSize: Constant.iconSizeMedium

    padding: Constant.paddingSmall * 1.4
    hoverIncreaseAmount: 4

    radius: Constant.roundingLarge
    border.width: Constant.borderMedium

    // Note the override here
    color: isFocused || root.hovered ? bgColHover : bgCol

    GradientShadow {
        topCol: Qt.rgba(1, 1, 1, 0)
        centerCol: Qt.rgba(1, 1, 1, 0.03)
        bottomCol: Qt.rgba(1, 1, 1, 0.06)
    }

    onIsFocusedChanged: {
        if (isFocused) {
            root.iconCol = Color.accentNormal;
            root.iconColHover = Color.accentLight;
            root.brCol = Color.accentDark;
            root.brColHover = Color.accentLight;
        } else {
            root.iconCol = Color.textNormal;
            root.iconColHover = Color.textLight;
            root.brCol = Color.surfaceDark;
            root.brColHover = Color.overlayDark;
        }
    }

    onLeftClicked: Hyprland.dispatch("workspace " + workspaceId)
}
