import qs.services
import qs.config.style

import Quickshell
import Quickshell.Hyprland

PanelWindow {
    id: root

    screen: MonitorService.selectedMonitor
    visible: StateService.showControlsMenu
    anchors {
        top: true
        bottom: true
        right: true
    }
    margins {
        top: Constant.marginSmall
        right: Constant.marginSmall
        bottom: Constant.marginSmall
    }

    implicitWidth: Constant.controlsMenuWidth
    implicitHeight: 500

    color: "red"
    exclusiveZone: 0

    HyprlandFocusGrab {
        id: focusGrab
        windows: [root]
        active: root.visible
        onCleared: StateService.showControlsMenu = false

        onActiveChanged: {
            if (active) {}
        }
    }
}