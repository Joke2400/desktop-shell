pragma Singleton
import QtQuick
import Quickshell

Singleton {

    // Note: paths must be correct & all must be mounted!
    property var mountPointsToWatch: ["/", "/home"]

    property string wallpaperDirPath: "file://" + Quickshell.env("HOME") + "/Pictures/wallpapers"

    property bool adjustBrightnessOnLoad: false
    property string statusbarPosition: "top"
}
