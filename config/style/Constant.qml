pragma Singleton
import qs.services
import qs.config.settings

import QtQuick
import Quickshell

Singleton {
    function scale(value: int): int {
        return Math.max(1, Math.round(value * Settings.uiScaleFactor));
    }

    // Large components
    readonly property int barHeight: scale(28)
    readonly property int controlsMenuWidth: scale(420)
    readonly property int settingsMenuWidth: scale(280)
    readonly property int systemTrayMenuWidth: scale(60)

    // Small components
    readonly property int buttonSize: scale(22) // default button size
    readonly property int controlButtonSize: scale(36)
    readonly property int powerButtonSize: scale(64)

    readonly property int controlSliderSize: scale(36)
    readonly property int controlSliderHandleSize: scale(20)
    readonly property int controlSliderTrackSize: scale(10)

    // this needs to be improved/relocated
    readonly property int carouselPanelHeight: MonitorService.selectedMonitor.height * 0.5
    readonly property int carouselPanelWidth: MonitorService.selectedMonitor.width
    readonly property int carouselViewHeight: carouselPanelHeight - borderLarge * 2
    readonly property int carouselViewWidth: carouselPanelWidth - borderLarge * 2
    readonly property int carouselItemCount: Math.max(2, Math.min(WallpaperService.model.count - 2, Settings.maxWallpapersDisplayed))
    readonly property real carouselItemWidth: carouselViewWidth / carouselItemCount

    // Basic sizes
    readonly property int textSizeTiny: scale(14)
    readonly property int textSizeSmall: scale(16)
    readonly property int textSizeMedium: scale(22)
    readonly property int textSizeLarge: scale(24)
    readonly property int textSizeHuge: scale(30)

    readonly property int spacingSmall: scale(2)
    readonly property int spacingMedium: scale(4)
    readonly property int spacingLarge: scale(6)

    readonly property int paddingSmall: scale(4)
    readonly property int paddingMedium: scale(5)
    readonly property int paddingLarge: scale(6)

    readonly property int marginSmall: 6
    readonly property int marginMedium: 8
    readonly property int marginLarge: 10

    readonly property int roundingSmall: 6
    readonly property int roundingMedium: 12
    readonly property int roundingLarge: 18

    readonly property int borderSmall: 1
    readonly property int borderMedium: 2
    readonly property int borderLarge: 3
}
