pragma Singleton
import qs.config.settings

import QtQuick
import Quickshell

Singleton {
    property real uiScaleFactor: 1.0

    readonly property int barHeight: Math.round(32 * uiScaleFactor)
    readonly property int sliderSize: Math.round(36 * uiScaleFactor)
    readonly property int sliderTrackSize: Math.round(10 * uiScaleFactor)
    readonly property int sliderHandleSize: Math.round(16 * uiScaleFactor)

    readonly property int carouselPanelWindowHeight: Settings.selectedScreen.height * 0.5
    readonly property int carouselHeight: carouselPanelWindowHeight - Constant.borderLarge * 2
    readonly property int carouselWidth: Settings.selectedScreen.width - Constant.borderLarge * 2
    readonly property int carouselItemWidth: carouselWidth / Settings.carouselItemCount

    readonly property int spacingSmall: Math.round(4 * uiScaleFactor)
    readonly property int spacingMedium: Math.round(8 * uiScaleFactor)
    readonly property int spacingLarge: Math.round(16 * uiScaleFactor)

    readonly property int paddingSmall: Math.round(2 * uiScaleFactor)
    readonly property int paddingMedium: Math.round(4 * uiScaleFactor)
    readonly property int paddingLarge: Math.round(8 * uiScaleFactor)

    readonly property int marginSmall: Math.round(6 * uiScaleFactor)
    readonly property int marginMedium: Math.round(12 * uiScaleFactor)
    readonly property int marginLarge: Math.round(20 * uiScaleFactor)

    readonly property int fontSizeTiny: Math.round(12 * uiScaleFactor)
    readonly property int fontSizeSmall: Math.round(14 * uiScaleFactor)
    readonly property int fontSizeMedium: Math.round(16 * uiScaleFactor)
    readonly property int fontSizeLarge: Math.round(18 * uiScaleFactor)
    readonly property int fontSizeHuge: Math.round(20 * uiScaleFactor)

    readonly property int iconSizeTiny: Math.round(18 * uiScaleFactor)
    readonly property int iconSizeSmall: Math.round(20 * uiScaleFactor)
    readonly property int iconSizeMedium: Math.round(24 * uiScaleFactor)
    readonly property int iconSizeLarge: Math.round(30 * uiScaleFactor)
    readonly property int iconSizeHuge: Math.round(36 * uiScaleFactor)

    readonly property int roundingSmall: Math.round(6 * uiScaleFactor)
    readonly property int roundingMedium: Math.round(12 * uiScaleFactor)
    readonly property int roundingLarge: Math.round(18 * uiScaleFactor)

    readonly property int borderSmall: Math.round(1 * uiScaleFactor)
    readonly property int borderMedium: Math.round(2 * uiScaleFactor)
    readonly property int borderLarge: Math.round(3 * uiScaleFactor)
}
