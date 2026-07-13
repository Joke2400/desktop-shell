import qs.config.style
import qs.components

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Button {
    id: root

    property var workspaceItem: Hyprland.workspaces.values.find(w => w.id === index + 1)
    property bool workspaceInFocus: Hyprland.focusedWorkspace?.id === (index + 1)

    buttonIcon: index + 1
    tooltipText: "Workspace: " + (index + 1)
    iconColor: Color.textNormal
    iconColorHover: Color.accentNormal
    backgroundColor: Color.baseNormal
    backgroundColorHover: Color.baseDark
    borderColor: Color.surfaceNormal
    borderColorHover: Color.accentDark
    iconSize: Constant.iconSizeMedium
    hoverSizeIncrease: 4

    border.width: Constant.borderSmall
    radius: Constant.roundingMedium
    color: root.hovered || workspaceInFocus ? backgroundColorHover : backgroundColor

    onLeftClicked: Hyprland.dispatch("workspace " + (index + 1))
}
