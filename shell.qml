//@ pragma UseQApplication
import qs.modules.statusbar
import qs.modules.powermenu
import qs.modules.wallpaperswitcher
import qs.modules.statusbar.sliders
import qs.modules.statusbar.systemtray

import Quickshell

ShellRoot {
    StatusBar {}
    PowerMenu {}
    WallpaperSwitcher {}
    BrightnessSlider {}
    VolumeSlider {}
    SystemTrayMenu {}
}
