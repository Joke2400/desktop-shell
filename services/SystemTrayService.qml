pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.SystemTray

Singleton {
    id: root

    readonly property var trayItems: SystemTray.items

    function getNetworkTrayItemIcon(trayItem) {
        const icon = trayItem.icon ?? "";
        if (icon.includes("no-connection")) {
            return "󱚼";
        } else if (trayItem.icon.includes("connecting")) {
            return "󱛇";
        } else if (trayItem.icon.includes("signal")) {
            return "󰖩";
        } else if (trayItem.icon.includes("device-wired")) {
            return "󰈀";
        } else {
            return "󱚵";
        }
    }

    function getTrayItemIcon(trayItem) {
        switch (trayItem.id) {
        case "nm-applet":
            return getNetworkTrayItemIcon(trayItem);
        case "blueman":
            return "󰂯";
        case "steam":
            return "󰓓";
        case "chrome_status_icon_1":
            return "";
        case "udiskie":
            return "󱊞";
        case "easyeffects":
            return "󰺢";
        default:
            return trayItem.icon;
        }
    }
}
