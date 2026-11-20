import qs.config.style
import qs.components

import QtQuick

Rectangle {
    id: root

    required property string text
    required property string tooltip

    property int textSize: Constant.textSizeMedium
    property int padding: Constant.paddingSmall

    property color textCol: Color.subTextLight
    property color bgCol: "transparent"
    property color brCol: "transparent"

    color: bgCol
    border.color: brCol
    border.width: 0

    implicitWidth: Math.max(btnText.implicitWidth + root.padding * 2, Constant.barButtonSize + root.padding * 2)
    implicitHeight: Math.max(btnText.implicitHeight + root.padding * 2, Constant.barButtonSize + root.padding * 2)

    DisplayText {
        id: btnText
        anchors.centerIn: parent

        text: root.text
        col: root.textCol
        colHover: root.textCol
        hovered: false
        size: root.textSize
    }
}