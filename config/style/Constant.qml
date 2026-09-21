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

    function scaleByMonitorHeight(baseValue: int): real {
        return Math.max(1, Math.round((baseValue * monitorHeight) / referenceHeight));
    }

    property real uiScaleFactor: { // needs improvement
        if (MonitorService.selectedMonitor.height <= 1920) {
            return 1.0;
        } else
            return 0.8;
    }

    // Component sizes
    readonly property int barHeight: scaleByMonitorHeight(32)

    readonly property int sidebarWidth: scaleByMonitorHeight(340)

    readonly property int sliderWidth: scaleByMonitorHeight(380)
    readonly property int sliderHeight: scaleByMonitorHeight(32)
    readonly property int sliderTrackSize: scaleByMonitorHeight(12)
    readonly property int sliderHandleSize: scaleByMonitorHeight(22)

    readonly property int carouselPanelHeight: MonitorService.selectedMonitor.height * 0.5
    readonly property int carouselPanelWidth: MonitorService.selectedMonitor.width
    readonly property int carouselViewHeight: carouselPanelHeight - borderLarge * 2
    readonly property int carouselViewWidth: carouselPanelWidth - borderLarge * 2
    readonly property int carouselItemCount: Math.max(2, Math.min(WallpaperService.model.count - 2, Settings.maxWallpapersDisplayed))
    readonly property real carouselItemWidth: carouselViewWidth / carouselItemCount

    // Basic sizes
    readonly property int spacingSmall: scaleByMonitorHeight(4)
    readonly property int spacingMedium: scaleByMonitorHeight(8)
    readonly property int spacingLarge: scaleByMonitorHeight(16)

    readonly property int paddingSmall: scaleByMonitorHeight(2)
    readonly property int paddingMedium: scaleByMonitorHeight(4)
    readonly property int paddingLarge: scaleByMonitorHeight(8)

    readonly property int marginSmall: scaleByMonitorHeight(6)
    readonly property int marginMedium: scaleByMonitorHeight(12)
    readonly property int marginLarge: scaleByMonitorHeight(20)

    readonly property int fontSizeTiny: scaleByMonitorHeight(12)
    readonly property int fontSizeSmall: scaleByMonitorHeight(14)
    readonly property int fontSizeMedium: scaleByMonitorHeight(16)
    readonly property int fontSizeLarge: scaleByMonitorHeight(18)
    readonly property int fontSizeHuge: scaleByMonitorHeight(20)

    readonly property int iconSizeTiny: scaleByMonitorHeight(18)
    readonly property int iconSizeSmall: scaleByMonitorHeight(20)
    readonly property int iconSizeMedium: scaleByMonitorHeight(24)
    readonly property int iconSizeLarge: scaleByMonitorHeight(30)
    readonly property int iconSizeHuge: scaleByMonitorHeight(36)

    readonly property int roundingSmall: scaleByMonitorHeight(6)
    readonly property int roundingMedium: scaleByMonitorHeight(12)
    readonly property int roundingLarge: scaleByMonitorHeight(18)

    readonly property int borderSmall: scaleByMonitorHeight(1)
    readonly property int borderMedium: scaleByMonitorHeight(2)
    readonly property int borderLarge: scaleByMonitorHeight(3)
}
