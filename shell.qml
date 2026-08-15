//@ pragma UseQApplication
import qs.services
import qs.config.settings
import qs.config.style

import qs.modules.statusbar
import qs.modules.powermenu
import qs.modules.wallpaperswitcher
import qs.modules.statusbar.sliders
import qs.modules.statusbar.systemtray

import Quickshell
import QtQuick

ShellRoot {
    StatusBar {}
    PowerMenu {}
    WallpaperSwitcher {}
    BrightnessSlider {}
    VolumeSlider {}
    SystemTrayMenu {}

    Component.onCompleted: {
        console.log("UI scale factor: " + Constant.uiScaleFactor);
        console.log("Screen: " + MonitorService.selectedMonitor.toString());
        console.log("Screen width: " + MonitorService.selectedMonitor.width);
        console.log("Screen height: " + MonitorService.selectedMonitor.height);
        console.log("Logical pixel density: " + MonitorService.selectedMonitor.logicalPixelDensity);
        console.log("Device pixel ratio: " + MonitorService.selectedMonitor.devicePixelRatio);
        console.log("Physical pixel density: " + MonitorService.selectedMonitor.physicalPixelDensity);
    }
}
