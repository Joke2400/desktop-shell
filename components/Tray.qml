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
    radius: Constant.roundingLarge * 2

    implicitWidth: Math.max(24, row.implicitWidth + Constant.paddingMedium * 2)
    implicitHeight: row.implicitHeight + Constant.paddingSmall * 2

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: root.innerSpacing
    }
}
