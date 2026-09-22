import qs.config.style

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Rectangle {
    id: root

    readonly property int activeWorkspace: Hyprland.focusedWorkspace?.id ?? 1
    readonly property int extraWorkspace: activeWorkspace > 4 ? activeWorkspace : 0
    readonly property var workspaces: {
        const base = [1, 2, 3, 4]; // always display a minimum of 4
        if (extraWorkspace > 0)
            base.push(extraWorkspace);
        return base;
    }

    color: "transparent"

    implicitWidth: rowLayout.implicitWidth
    implicitHeight: Constant.barHeight + Constant.paddingSmall * 2

    Layout.leftMargin: Constant.marginSmall

    RowLayout {
        id: rowLayout
        anchors.centerIn: parent
        spacing: Constant.spacingSmall * 0.6

        Repeater {
            model: root.workspaces
            delegate: WorkspaceButton {
                required property int modelData
                workspaceId: modelData
                isFocused: workspaceId == root.activeWorkspace
            }
        }
    }
}
