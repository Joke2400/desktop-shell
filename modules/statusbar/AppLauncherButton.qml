import qs.config.style
import qs.components

import QtQuick
import Quickshell.Hyprland

Button {
    id: root

    buttonIcon: "󱄅"
    tooltipText: "Launcher"
    backgroundColor: Color.accentNormal
    backgroundColorHover: Color.overlayLight
    iconColorHover: Color.textDark
    borderColor: Color.accentLight
    borderColorHover: Color.baseNormal
    iconSize: Constant.iconSizeLarge
    buttonPadding: 0

    border.width: Constant.borderSmall
    radius: Constant.roundingLarge

    onLeftClicked: () => {
        Hyprland.dispatch("exec toggle-rofi");
    }
}
