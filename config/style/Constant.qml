pragma Singleton
import QtQuick
import Quickshell

Singleton {

    property int barHeight: Math.round(32 * Theme.scaleFactor)
    property int sliderSize: Math.round(36 * Theme.scaleFactor)
    property int sliderTrackSize: Math.round(10 * Theme.scaleFactor)
    property int sliderHandleSize: Math.round(16 * Theme.scaleFactor)
    property int systemTrayItemSize: iconSizeMedium

    property int spacingSmall: Math.round(4 * Theme.scaleFactor)
    property int spacingMedium: Math.round(8 * Theme.scaleFactor)
    property int spacingLarge: Math.round(16 * Theme.scaleFactor)

    property int paddingSmall: Math.round(2 * Theme.scaleFactor)
    property int paddingMedium: Math.round(4 * Theme.scaleFactor)
    property int paddingLarge: Math.round(8 * Theme.scaleFactor)

    property int marginSmall: Math.round(6 * Theme.scaleFactor)
    property int marginMedium: Math.round(12 * Theme.scaleFactor)
    property int marginLarge: Math.round(20 * Theme.scaleFactor)

    property int fontSizeTiny: Math.round(12 * Theme.scaleFactor)
    property int fontSizeSmall: Math.round(14 * Theme.scaleFactor)
    property int fontSizeMedium: Math.round(16 * Theme.scaleFactor)
    property int fontSizeLarge: Math.round(18 * Theme.scaleFactor)
    property int fontSizeHuge: Math.round(20 * Theme.scaleFactor)

    property int iconSizeTiny: Math.round(18 * Theme.scaleFactor)
    property int iconSizeSmall: Math.round(20 * Theme.scaleFactor)
    property int iconSizeMedium: Math.round(24 * Theme.scaleFactor)
    property int iconSizeLarge: Math.round(30 * Theme.scaleFactor)
    property int iconSizeHuge: Math.round(36 * Theme.scaleFactor)

    property int roundingSmall: Math.round(6 * Theme.scaleFactor)
    property int roundingMedium: Math.round(12 * Theme.scaleFactor)
    property int roundingLarge: Math.round(18 * Theme.scaleFactor)

    property int borderSmall: 1
    property int borderMedium: 2
    property int borderLarge: 3
}
