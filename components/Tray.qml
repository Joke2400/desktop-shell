import qs.config.style

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    default property alias contents: row.data
    property color backgroundColor: "transparent"
    property int innerSpacing: Constant.spacingSmall

    color: backgroundColor
    border.color: "transparent"

    border.width: 0
    implicitWidth: Math.max(24, row.implicitWidth)
    implicitHeight: row.implicitHeight

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: root.innerSpacing
    }
}
