pragma Singleton
import QtQuick
import Quickshell

Singleton {

    // Note: partition  paths must be correct & all must be mounted (no checks yet)!
    readonly property var mountPointsToWatch: ["/", "/home"]

    readonly property var selectedScreen: Quickshell.screens.length > 0 ? Quickshell.screens[0] : null
    readonly property string wallpaperDirPath: "file://" + Quickshell.env("HOME") + "/Pictures/wallpapers"
    readonly property bool adjustBrightnessOnLoad: false
    readonly property string statusbarPosition: "top"
    readonly property int carouselItemCount: 5
    readonly property size thumbnailSize: Qt.size(960, 540)
}
