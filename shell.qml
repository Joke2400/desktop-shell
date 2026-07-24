//@ pragma UseQApplication
import qs.modules.statusbar
import qs.modules.powermenu
import qs.modules.statusbar.sliders
import qs.modules.statusbar.systemtray

import Quickshell

ShellRoot {
    StatusBar {}
    PowerMenu {}
    BrightnessSlider {}
    VolumeSlider {}
    SystemTrayMenu {}
}
