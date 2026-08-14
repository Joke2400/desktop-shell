//@ pragma UseQApplication
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
        console.log("Screen: " + Settings.selectedScreen.toString());
        console.log("Screen width: " + Settings.selectedScreen.width);
        console.log("Screen height: " + Settings.selectedScreen.height);
        console.log("Logical pixel density: " + Settings.selectedScreen.logicalPixelDensity);
        console.log("Device pixel ratio: " + Settings.selectedScreen.devicePixelRatio);
        console.log("Physical pixel density: " + Settings.selectedScreen.physicalPixelDensity);
    }
}
