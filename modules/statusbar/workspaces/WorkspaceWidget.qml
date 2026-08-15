import qs.config.style
import qs.components

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Tray {
    id: root

    readonly property int activeWorkspace: Hyprland.focusedWorkspace?.id ?? 1
    readonly property int extraWorkspace: activeWorkspace > 4 ? activeWorkspace : 0
    readonly property var workspaces: {
        const base = [1, 2, 3, 4]; // always display a minimum of 4
        if (extraWorkspace > 0)
            base.push(extraWorkspace);
        return base;
    }

    Layout.leftMargin: Constant.marginMedium
    innerSpacing: Constant.spacingSmall
    implicitHeight: Constant.barHeight + Constant.paddingSmall * 2

    Repeater {
        model: root.workspaces
        delegate: Workspace {
            required property int modelData
            workspaceId: modelData
            isFocused: workspaceId == root.activeWorkspace
        }
    }
}
