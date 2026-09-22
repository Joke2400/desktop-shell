pragma Singleton
import qs.services
import qs.config.settings

import QtQuick
import Quickshell

Singleton {
    // Logical height of dev monitor (physical 3840x2160 @ scale 1.5)
    readonly property int referencePhysicalHeight: 2160
    readonly property real referenceScale: 1.5
    readonly property real referenceHeight: referencePhysicalHeight / referenceScale
    readonly property int monitorHeight: MonitorService.selectedMonitor.height

    readonly property real densityExponent: 0.5
    readonly property real uiScaleFactor: Math.pow(referenceHeight / monitorHeight, densityExponent)

    function scaleByDensity(baseValue: real): real {
        return Math.max(1, Math.round(baseValue * uiScaleFactor));
    }

    // Component sizes
    readonly property int barHeight: scaleByDensity(32)

    readonly property int sidebarWidth: scaleByDensity(340)

    readonly property int sliderWidth: scaleByDensity(380)
    readonly property int sliderHeight: scaleByDensity(32)
    readonly property int sliderTrackSize: scaleByDensity(12)
    readonly property int sliderHandleSize: scaleByDensity(22)

    readonly property int carouselPanelHeight: MonitorService.selectedMonitor.height * 0.5
    readonly property int carouselPanelWidth: MonitorService.selectedMonitor.width
    readonly property int carouselViewHeight: carouselPanelHeight - borderLarge * 2
    readonly property int carouselViewWidth: carouselPanelWidth - borderLarge * 2
    readonly property int carouselItemCount: Math.max(2, Math.min(WallpaperService.model.count - 2, Settings.maxWallpapersDisplayed))
    readonly property real carouselItemWidth: carouselViewWidth / carouselItemCount

    // Basic sizes
    readonly property int spacingSmall: scaleByDensity(4)
    readonly property int spacingMedium: scaleByDensity(8)
    readonly property int spacingLarge: scaleByDensity(16)

    readonly property int paddingSmall: scaleByDensity(3)
    readonly property int paddingMedium: scaleByDensity(4)
    readonly property int paddingLarge: scaleByDensity(8)

    readonly property int marginSmall: scaleByDensity(6)
    readonly property int marginMedium: scaleByDensity(12)
    readonly property int marginLarge: scaleByDensity(20)

    readonly property int textSizeTiny: scaleByDensity(12)
    readonly property int textSizeSmall: scaleByDensity(14)
    readonly property int textSizeMedium: scaleByDensity(16)
    readonly property int textSizeLarge: scaleByDensity(18)
    readonly property int textSizeHuge: scaleByDensity(20)

    readonly property int iconSizeTiny: scaleByDensity(18)
    readonly property int iconSizeSmall: scaleByDensity(20)
    readonly property int iconSizeMedium: scaleByDensity(24)
    readonly property int iconSizeLarge: scaleByDensity(30)
    readonly property int iconSizeHuge: scaleByDensity(36)

    readonly property int roundingSmall: scaleByDensity(6)
    readonly property int roundingMedium: scaleByDensity(12)
    readonly property int roundingLarge: scaleByDensity(18)

    readonly property int borderSmall: 1
    readonly property int borderMedium: 2
    readonly property int borderLarge: 3
}
