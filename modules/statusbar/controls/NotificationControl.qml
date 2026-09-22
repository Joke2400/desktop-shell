import qs.config.style
import qs.services

import QtQuick
import Quickshell.Hyprland

ControlButton {
    id: root

    property bool isMuted: NotificationService.isMuted
    property bool isInhibited: NotificationService.isInhibited
    property int notificationCount: NotificationService.notificationCount

    tooltip: "Notifications"
    btnIcon: {
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
    btnText: ""

    iconCol: GlobalStates.notificationPanelIsVisible ? Color.colYellow : (isMuted || isInhibited ? Color.colMaroon : Color.textNormal)
    iconColHover: GlobalStates.notificationPanelIsVisible ? Color.colYellow : (isMuted || isInhibited ? Color.colRed : Color.textLight)

    onLeftClicked: () => {
        Hyprland.dispatch("exec swaync-client -t");
        GlobalStates.notificationPanelIsVisible = !GlobalStates.notificationPanelIsVisible;
    // This toggle will not work correctly as it is currently implemented,
    // the plan, however, is to stop using swaync for the GUI entirely
    }
    onMiddleClicked: () => {
        Hyprland.dispatch("exec swaync-client -d");
    }
    onRightClicked: () => {
        Hyprland.dispatch("exec swaync-client -C");
    }
}
