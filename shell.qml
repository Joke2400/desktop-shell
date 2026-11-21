//@ pragma UseQApplication
import qs.modules.statusbar
import qs.modules.powermenu
import qs.modules.controlsmenu
import qs.modules.settingsmenu

import Quickshell
import QtQuick

ShellRoot {
    StatusBar {}
    PowerMenuPanel {}
    ControlsPanel {}
    SettingsPanel {}
}
