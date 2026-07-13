import qs.config.style
import qs.components
import qs.services

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Button {
    id: root

    property bool isMuted: NotificationService.isMuted
    property bool isInhibited: NotificationService.isInhibited
    property int notificationCount: NotificationService.notificationCount

    buttonIcon: {
        if (isMuted || isInhibited) {
            if (notificationCount > 0) {
                return "";
            } else {
                return "";
            }
        }
        if (notificationCount > 0) {
            return "";
        } else {
            return "";
        }
    }
    tooltipText: "Notifications"
    backgroundColorHover: Color.overlayLight
    iconColor: isMuted || isInhibited ? Color.colRed : Color.textNormal
    iconColorHover: isMuted || isInhibited ? Color.colRed : Color.textDark
    borderColor: Color.accentLight
    borderColorHover: Color.baseNormal

    radius: Constant.roundingLarge
    iconSize: Constant.iconSizeMedium
    border.width: Constant.borderSmall

    onLeftClicked: () => {
        Hyprland.dispatch("exec swaync-client -t");
    }
    onMiddleClicked: () => {
        Hyprland.dispatch("exec swaync-client -C");
    }
    onRightClicked: () => {
        Hyprland.dispatch("exec swaync-client -d");
    }
}
