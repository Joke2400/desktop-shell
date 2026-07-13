pragma Singleton
import QtQuick
import Quickshell

Singleton {

    // Note: paths must be correct & all must be mounted!
    property var mountPointsToWatch: ["/", "/home"]

    property bool adjustBrightnessOnLoad: false
}
