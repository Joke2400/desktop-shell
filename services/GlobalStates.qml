pragma Singleton
import QtQuick
import Quickshell

Singleton {
    property bool powerMenuIsVisible: false
    property bool brightnessSliderIsVisible: false
    property bool volumeSliderIsVisible: false
    property bool systemTrayIsVisible: false

    property var trayButtonPosX: 0
    property var trayButtonPosY: 0
}
