import qs.config.style
import qs.components
import qs.services

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Tray {
    id: root

    innerSpacing: Constant.spacingSmall
    implicitHeight: Constant.barHeight + Constant.paddingSmall * 2

    Repeater {
        model: 4
        delegate: Workspace {}
    }
}
