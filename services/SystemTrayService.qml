pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.SystemTray

Singleton {
    id: root

    readonly property var systemTrayItems: SystemTray.items
    readonly property var systemTrayStatic: [networkTrayItem, bluetoothTrayItem]
    readonly property var systemTrayOther: systemTrayItems.values.filter(
        item => !systemTrayStatic.includes(item)
    )

    // System service tray items which will (should) always exist
    readonly property var networkTrayItem: getSystemTrayItem("nm-applet")
    readonly property var bluetoothTrayItem: getSystemTrayItem("blueman")

    //onSystemTrayOtherChanged: debuglogTray()
    //onSystemTrayStaticChanged: debuglogTray()
    //Component.onCompleted: debuglogTray()

    function getSystemTrayItem(id) {
        const items = root.systemTrayItems.values;
        for (let i = 0; i < items.length; i++) {
            if (items[i].id === id)
                return items[i];
        }
        return null;
    }

    function getSystemTrayIcon(trayItem) {
        switch (trayItem.id) {
        case "nm-applet":
            return getNetworkIcon(trayItem);
        case "blueman":
            return getBluetoothIcon(trayItem);
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
            console.warn("Could not find an icon-preset for id:", trayItem.id, "- using the default icon.");
            return trayItem.icon;
        }
    }

    function getNetworkIcon(trayItem) {
        if (!trayItem)
            return "󱚵";

        const icon = trayItem.icon ?? "";
        if (icon.includes("no-connection")) {
            return "󱚼";
        } else if (icon.includes("connecting")) {
            return "󱛇";
        } else if (icon.includes("signal") || "device-wired") {
            return "󰖩";
        } else {
            console.warn("Could not find an icon-preset for network:", trayItem.icon, "- using fallback");
            return "󱚵";
        }
    }

    function getBluetoothIcon(trayItem) {
        if (!trayItem)
            return "󰂯";

        // using tooltip title for now as it shows whether its enabled/disabled
        const tooltipTitle = trayItem.tooltipTitle ?? "";
        if (tooltipTitle.includes("Bluetooth Enabled")) {
            return "󰂯";
        } else if (tooltipTitle.includes("Bluetooth Disabled")) {
            return "󰂲";
        } else {
            console.warn("Could not find an icon-preset for bluetooth:", trayItem.icon, "- using fallback");
            return "󰂯";
        }
    }

    function debuglogTray() {
        const ids = list => list.map(item => item ? item.id : "null")

        console.log("[tray] all:", JSON.stringify(ids(systemTrayItems.values)))
        console.log("[tray] static:", JSON.stringify(ids(systemTrayStatic)))
        console.log("[tray] other:", JSON.stringify(ids(systemTrayOther)))
    }
}
