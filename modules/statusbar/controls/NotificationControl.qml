import qs.config.style
import qs.components
import qs.services

import QtQuick
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
    backgroundColorHover: Color.baseLight
    iconColor: GlobalStates.notificationPanelIsVisible ? Color.colYellow : (isMuted || isInhibited ? Color.colMaroon : Color.textNormal)
    iconColorHover: GlobalStates.notificationPanelIsVisible ? Color.colYellow : (isMuted || isInhibited ? Color.colRed : Color.textLight)

    radius: Constant.roundingLarge
    iconSize: Constant.iconSizeMedium

    onLeftClicked: () => {
        Hyprland.dispatch("exec swaync-client -t");
        GlobalStates.notificationPanelIsVisible = !GlobalStates.notificationPanelIsVisible;
    // This toggle will not work correctly as it is currently implemented,
    // the plan, however, is to stop using swaync for the GUI entirely
    }
    onMiddleClicked: () => {
        Hyprland.dispatch("exec swaync-client -C");
    }
    onRightClicked: () => {
        Hyprland.dispatch("exec swaync-client -d");
    }
}
