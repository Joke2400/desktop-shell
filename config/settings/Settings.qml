pragma Singleton
import QtQuick
import Quickshell

Singleton {

    // I/O
    readonly property var mountPointsToWatch: ["/"] // Note: partition  paths must be correct & all must be mounted (no checks yet)!
    readonly property string wallpaperDirPath: "file://" + Quickshell.env("HOME") + "/Pictures/wallpapers/horizontal"

    // Behavior
    readonly property string selectedMonitorOutput: Quickshell.env("QS_MAIN_MONITOR_OUT")
    readonly property string selectedMonitorDesc: Quickshell.env("QS_MAIN_MONITOR_DESC")
    readonly property bool adjustBrightnessOnLoad: true
    readonly property bool showPassiveTrayIcons: true

    // UI components
    readonly property real uiScaleFactor: {
        const envValue = Quickshell.env("QS_UI_SCALE_FACTOR");
        const parsed = parseFloat(envValue);
        return !isNaN(parsed) ? parsed : 1.0;
    }
    readonly property string statusbarPosition: "top" // is not used yet
    readonly property int maxWallpapersDisplayed: 5
}
