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

    onLeftClicked: () => {
        Hyprland.dispatch("exec toggle-rofi");
    }
}
