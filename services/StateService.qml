pragma Singleton
import QtQuick
import Quickshell

Singleton {
    // Panels
    property bool showPowerMenu: false
    property bool showControlsMenu: true
    property bool showSettingsMenu: true
    property bool showSystemTrayMenu: false
    property bool showNotificationsMenu: false
    property bool showWallpaperSwitcherMenu: false

    property bool showVolumeSlider: false
    property bool showBrightnessSlider: false

    // Tooltip positioning
    property var tooltipX: 0
    property var tooltipY: 0
}
