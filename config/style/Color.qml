pragma Singleton
import QtQuick
import Quickshell

Singleton {
    // base = black colors
    property color baseDark: Qt.hsla(230 / 360, 0.20, 0.18, 1.0)
    property color baseNormal: Qt.hsla(230 / 360, 0.20, 0.20, 1.0)
    property color baseLight: Qt.hsla(230 / 360, 0.22, 0.24, 1.0)

    // surface = greys/darker greys
    property color surfaceDark: Qt.hsla(226 / 360, 0.22, 0.30, 1.0)
    property color surfaceNormal: Qt.hsla(226 / 360, 0.22, 0.40, 1.0)
    property color surfaceLight: Qt.hsla(226 / 360, 0.24, 0.50, 1.0)

    // overlay = lighter grays/whites
    property color overlayDark: Qt.hsla(218 / 360, 0.28, 0.65, 1.0)
    property color overlayNormal: Qt.hsla(218 / 360, 0.28, 0.77, 1.0)
    property color overlayLight: Qt.hsla(218 / 360, 0.30, 0.85, 1.0)

    // accent = accent colors (dull to vibrant)
    property color accentDark: Qt.hsla(216 / 360, 0.65, 0.35, 1.0)
    property color accentNormal: Qt.hsla(216 / 360, 0.55, 0.40, 1.0)
    property color accentLight: Qt.hsla(216 / 360, 0.45, 0.50, 1.0)

    // primary text
    property color textLight: Qt.hsla(220 / 360, 0.40, 0.85, 1.0)
    property color textNormal: Qt.hsla(220 / 360, 0.35, 0.75, 1.0)
    property color textDark: Qt.hsla(220 / 360, 0.30, 0.12, 1.0)

    // subtext
    property color subTextLight: Qt.hsla(220 / 360, 0.20, 0.60, 1.0)
    property color subTextNormal: Qt.hsla(220 / 360, 0.15, 0.45, 1.0)
    property color subTextDark: Qt.hsla(220 / 360, 0.10, 0.30, 1.0)

    // plain colors
    property color colBlue: Qt.hsla(218 / 360, 0.70, 0.45, 1.0)
    property color colOrange: Qt.hsla(20 / 360, 0.8, 0.4, 1.0)
    property color colDarkOrange: Qt.hsla(20 / 360, 0.8, 0.3, 1.0)
    property color colRed: Qt.hsla(0, 1.0, 0.40, 1.0)
    property color colMaroon: Qt.hsla(0, 1.0, 0.25, 1.0)
    property color colLightGreen: Qt.hsla(110 / 360, 1.0, 0.4, 1.0)

    // semantic colors
    property color colSuccess: colLightGreen
    property color colCritical: colRed
    property color colWarning: colMaroon
    property color colError: colOrange
    property color colInfo: colBlue
}
