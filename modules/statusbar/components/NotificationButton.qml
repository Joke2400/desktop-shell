import qs.services
import qs.config.style

import Quickshell.Hyprland

BarButton {
    property bool isMuted: NotificationService.isMuted
    property bool isInhibited: NotificationService.isInhibited
    property int notificationCount: NotificationService.notificationCount
    textCol: isMuted || isInhibited ? Color.colMaroon : Color.textNormal
    textColHover: isMuted || isInhibited ? Color.colRed : Color.textLight
    text: {
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
    tooltip: "Notifications"
    leftAction: () => { Hyprland.dispatch("exec swaync-client -t") }
    middleAction: () => { Hyprland.dispatch("exec swaync-client -d") }
    rightAction: () => { Hyprland.dispatch("exec swaync-client -C") }
}