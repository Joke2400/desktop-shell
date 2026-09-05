//@ pragma UseQApplication
import qs.modules.statusbar
import qs.modules.sliders
import qs.modules.powermenu
import qs.modules.systemtray
import qs.modules.wallpaperswitcher

import Quickshell
import QtQuick

ShellRoot {
    StatusBar {}
    PowerMenu {}
    WallpaperSwitcher {}
    BrightnessSlider {}
    VolumeSlider {}
    SystemTrayMenu {}
}
