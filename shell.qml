//@ pragma UseQApplication
import qs.modules.statusbar
import qs.modules.controlsmenu
import qs.modules.settingsmenu

import Quickshell
import QtQuick

ShellRoot {
    StatusBar {}
    ControlsPanel {}
    SettingsPanel {}
}
