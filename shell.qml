//@ pragma UseQApplication
import qs.modules.statusbar
import qs.modules.sliders
import qs.modules.powermenu
import qs.modules.wallpaperswitcher
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
}
