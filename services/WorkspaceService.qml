pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland

// will add more functionality later
Singleton {
    id: root

    readonly property int activeWorkspace: Hyprland.focusedWorkspace?.id ?? 1
}
