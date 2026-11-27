import qs.config.style
import qs.components

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    required property string icon
    required property string text
    required property string tooltip

    property int iconSize: Constant.textSizeMedium
    property int textSize: Constant.textSizeSmall
    property int padding: Constant.paddingSmall
    property int spacing: Constant.spacingSmall

    property color textCol: Color.subTextLight
    property color bgCol: "transparent"
    property color brCol: "transparent"

    color: bgCol
    border.color: brCol
    border.width: 0

    implicitWidth: layout.implicitWidth + root.padding * 2
    implicitHeight: layout.implicitHeight + root.padding * 2

    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: root.spacing

        DisplayText {
            id: iconText
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            text: root.icon
            col: root.textCol
            colHover: root.textCol
            hovered: false
            size: root.iconSize
        }
        DisplayText {
            id: btnText
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            text: root.text
            col: root.textCol
            colHover: root.textCol
            hovered: false
            size: root.textSize
            alignToBaseline: true
        }
    }
}