pragma ComponentBehavior: Bound
import qs.config.style
import qs.modules.controlsmenu.components.buttons

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

ColumnLayout {
    id: root
    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    implicitWidth: Constant.controlsMenuWidth
    spacing: Constant.spacingLarge

    readonly property int columns: 6

    readonly property var buttons: [
        {
            text: "󱘟",
            tooltip: "Clipboard",
            leftAction: () => {Hyprland.dispatch("exec toggle-clipboard") }
        },
        {
            text: "",
            tooltip: "Calculator",
            leftAction: () => {Hyprland.dispatch("exec ") }
        },
        {
            text: "󰄀",
            tooltip: "Screenshot",
            leftAction: () => {Hyprland.dispatch("exec screenshot --copy") },
            rightAction: () => {Hyprland.dispatch("exec screenshot --save") }
        },
        {
            text: "󰕧",
            tooltip: "Screenrecord",
            leftAction: () => {Hyprland.dispatch("exec screenrecord --copy") },
            rightAction: () => {Hyprland.dispatch("exec screenrecord --save") }
        },
        {
            text: "",
            tooltip: "System Monitor",
            leftAction: () => {Hyprland.dispatch("exec ") },
            rightAction: () => {Hyprland.dispatch("exec ") }
        },
        {
            text: "",
            tooltip: "Disks",
            leftAction: () => {Hyprland.dispatch("exec ") },
            rightAction: () => {Hyprland.dispatch("exec ") }
        }
    ]

    Repeater {
        model: Math.ceil(root.buttons.length / root.columns)

        delegate: RowLayout {
            id: row
            required property int index
            Layout.alignment: Qt.AlignHCenter
            spacing: Constant.spacingLarge * 1.75

            Repeater {
                model: root.buttons.slice(row.index * root.columns, (row.index + 1) * root.columns)

                delegate: ControlButton {
                    required property var modelData
                    text: modelData.text
                    tooltip: modelData.tooltip
                    leftAction: modelData.leftAction
                    rightAction: modelData.rightAction
                }
            }
        }
    }
}