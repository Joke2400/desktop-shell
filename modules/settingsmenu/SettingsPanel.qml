import qs.services
import qs.config.style

import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland

PanelWindow {
    id: root

    screen: MonitorService.selectedMonitor
    visible: StateService.showControlsMenu
    anchors {
        top: true
        left: true
    }
    WlrLayershell.namespace: "quickshell:sidebar-left"
    color: "transparent"

    margins {
        top: Constant.marginSmall
        left: Constant.marginSmall
        bottom: Constant.marginSmall
    }

    implicitWidth: Constant.settingsMenuWidth
    implicitHeight: 500

    exclusiveZone: 0

    HyprlandFocusGrab {
        id: focusGrab
        windows: [root]
        active: root.visible
        onCleared: StateService.showSettingsMenu = false

        onActiveChanged: {
            if (active) {}
        }
    }
}