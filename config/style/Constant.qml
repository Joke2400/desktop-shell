pragma Singleton
import qs.services
import qs.config.settings

import QtQuick
import Quickshell

Singleton {
    function scale(value: int): int {
        return Math.max(1, Math.round(value * Settings.uiScaleFactor));
    }

    // Component sizes
    readonly property int barHeight: scale(32)

    readonly property int sidebarWidth: scale(340)

    readonly property int sliderWidth: scale(380)
    readonly property int sliderHeight: scale(32)
    readonly property int sliderTrackSize: scale(12)
    readonly property int sliderHandleSize: scale(22)

    readonly property int carouselPanelHeight: MonitorService.selectedMonitor.height * 0.5
    readonly property int carouselPanelWidth: MonitorService.selectedMonitor.width
    readonly property int carouselViewHeight: carouselPanelHeight - borderLarge * 2
    readonly property int carouselViewWidth: carouselPanelWidth - borderLarge * 2
    readonly property int carouselItemCount: Math.max(2, Math.min(WallpaperService.model.count - 2, Settings.maxWallpapersDisplayed))
    readonly property real carouselItemWidth: carouselViewWidth / carouselItemCount

    // Basic sizes
    readonly property int spacingSmall: scale(4)
    readonly property int spacingMedium: scale(8)
    readonly property int spacingLarge: scale(12)

    readonly property int paddingSmall: scale(3)
    readonly property int paddingMedium: scale(4)
    readonly property int paddingLarge: scale(6)

    readonly property int marginSmall: scale(6)
    readonly property int marginMedium: scale(10)
    readonly property int marginLarge: scale(16)

    readonly property int textSizeTiny: scale(12)
    readonly property int textSizeSmall: scale(14)
    readonly property int textSizeMedium: scale(16)
    readonly property int textSizeLarge: scale(18)
    readonly property int textSizeHuge: scale(20)

    readonly property int iconSizeTiny: scale(18)
    readonly property int iconSizeSmall: scale(20)
    readonly property int iconSizeMedium: scale(24)
    readonly property int iconSizeLarge: scale(30)
    readonly property int iconSizeHuge: scale(36)

    readonly property int roundingSmall: 6
    readonly property int roundingMedium: 12
    readonly property int roundingLarge: 18

    readonly property int borderSmall: 1
    readonly property int borderMedium: 2
    readonly property int borderLarge: 3
}
