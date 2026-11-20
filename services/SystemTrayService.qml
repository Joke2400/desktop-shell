pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.SystemTray

Singleton {
    id: root

    readonly property var trayItems: SystemTray.items

    // System service tray items which will (should) always exist
    readonly property var networkTrayItem: getTrayItem("nm-applet")
    readonly property var bluetoothTrayItem: getTrayItem("blueman")

    function getTrayItem(id) {
        const items = root.trayItems.values;
        for (let i = 0; i < items.length; i++) {
            if (items[i].id === id)
                return items[i];
        }
        return null;
    }

    function getTrayItemIcon(trayItem) {
        switch (trayItem.id) {
        case "nm-applet":
            return getNetworkTrayItemIcon(trayItem);
        case "blueman":
            return "󰂯";
        case "steam":
            return "󰓓";
        case "discord_status_icon_1":
            return "";
        case "spotify-client":
            return "󰓇";
        case "udiskie":
            return "󱊞";
        case "easyeffects":
            return "󰺢";
        default:
            console.log("Could not find icon-preset for icon ID:", trayItem.id, "- using the default icon.");
            return trayItem.icon;
        }
    }

    function getNetworkTrayItemIcon(trayItem) {
        if (!trayItem)
            return "󱚵";

        const icon = trayItem.icon ?? "";
        if (icon.includes("no-connection")) {
            return "󱚼";
        } else if (icon.includes("connecting")) {
            return "󱛇";
        } else if (icon.includes("signal")) {
            return "󰖩";
        } else if (icon.includes("device-wired")) {
            return "󰈀";
        } else {
            return "󱚵";
        }
    }
}
