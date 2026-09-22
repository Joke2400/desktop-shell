import qs.services
import qs.config.style

import QtQuick

ControlButton {
    id: root

    visible: WallpaperService.model.count >= 2

    tooltip: "Wallpaper Switcher"
    btnIcon: "󰸉"
    btnText: ""

    iconSize: Constant.iconSizeMedium * 0.95

    onLeftClicked: {
        GlobalStates.wallpaperSwitcherIsVisible = !GlobalStates.wallpaperSwitcherIsVisible;
    }
}
