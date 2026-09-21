import qs.config.style
import qs.components
import qs.services

import QtQuick

Button {
    id: root

    buttonIcon: "󰸉"
    tooltipText: "Wallpaper Switcher"
    bgColHover: Color.baseLight
    iconColorHover: Color.textLight
    brCol: Color.accentLight
    visible: WallpaperService.model.count >= 2

    radius: Constant.roundingLarge
    iconSize: Constant.iconSizeMedium

    onLeftClicked: {
        GlobalStates.wallpaperSwitcherIsVisible = !GlobalStates.wallpaperSwitcherIsVisible;
    }
}
