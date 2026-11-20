import qs.services
import qs.config.style

import Quickshell
import Quickshell.Hyprland

PanelWindow {
    id: root

    screen: MonitorService.selectedMonitor
    visible: StateService.showSettingsMenu
    anchors {
        top: true
        left: true
    }
    margins {
        top: Constant.marginSmall
        left: Constant.marginSmall
        bottom: Constant.marginSmall
    }

    implicitWidth: Constant.settingsMenuWidth
    implicitHeight: 500

    color: "blue"
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