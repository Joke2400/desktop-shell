pragma ComponentBehavior: Bound
import qs.services
import qs.config.style
import qs.modules.controlsmenu.components.buttons

import QtQuick
import QtQuick.Layouts

ColumnLayout {
    id: root
    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    implicitWidth: Constant.controlsMenuWidth
    spacing: Constant.spacingLarge

    readonly property int columns: 6

    readonly property var buttons: [
        { text: "󰄀", tooltip: "Screenshot", action: () => {} },
        { text: "󰕧", tooltip: "Screenrecord", action: () => {} },
        { text: "", tooltip: "Calculator", action: () => {} },
        { text: "󱘟", tooltip: "Clipboard", action: () => {} },
        { text: "", tooltip: "System Monitor", action: () => {} },
        { text: "", tooltip: "Disks", action: () => {} }
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
                    leftAction: modelData.action
                }
            }
        }
    }
}