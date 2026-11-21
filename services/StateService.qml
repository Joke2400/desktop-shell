pragma Singleton
import QtQuick
import Quickshell

Singleton {
    id: root
    // Panels
    property bool showPowerMenu: false
    property bool showControlsMenu: false
    property bool showSettingsMenu: false
    property bool showSystemTrayMenu: false
    property bool showNotificationsMenu: false
    property bool showWallpaperSwitcherMenu: false

    // Functionality not yet planned/unsure if will be needed
    property bool showInternetMenu: false
    property bool showBluetoothMenu: false
    property bool showBatteryMenu: false

    // Mutually exclusive properties
    readonly property var menus: [
        "showPowerMenu",
        "showControlsMenu",
        "showSettingsMenu",
        "showSystemTrayMenu",
        "showNotificationsMenu",
        "showWallpaperSwitcherMenu",
        "showInternetMenu",
        "showBluetoothMenu",
        "showBatteryMenu"
    ]

    function openMenu(name) {
        if (!menus.includes(name)) {
            console.warn("StateService.openMenu: unknown menu", name);
            return;
        }
        for (const m of menus)
            root[m] = (m === name);
    }

    // Tooltip positioning
    property var tooltipX: 0
    property var tooltipY: 0
}
