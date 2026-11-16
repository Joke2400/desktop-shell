import qs.config.style

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    readonly property bool hovered: hover.hovered

    required property string text
    required property string tooltip

    property int textSize: Constant.textSizeMedium
    property int padding: Constant.paddingSmall

    property color textCol: Color.textNormal
    property color textColHover: Color.textLight
    property color bgCol: "transparent"
    property color brCol: "transparent"
    property color bgColHover: bgCol
    property color brColHover: brCol

    signal leftClicked
    signal middleClicked
    signal rightClicked

    color: hovered ? bgColHover : bgCol
    border.color: hovered ? brColHover : brCol
    border.width: 0

    implicitWidth: btnText.implicitWidth + root.padding * 2
    implicitHeight: btnText.implicitHeight + root.padding * 2

    HoverHandler {
        id: hover
    }
    TapHandler {
        id: tap
        acceptedButtons: Qt.LeftButton | Qt.MiddleButton | Qt.RightButton
        onTapped: (eventPoint, button) => {
            if (button === Qt.LeftButton)
                root.leftClicked();
            if (button === Qt.MiddleButton)
                root.middleClicked();
            if (button === Qt.RightButton)
                root.rightClicked();
        }
    }
    DisplayText {
        id: btnText
        anchors.centerIn: parent

        text: root.text
        col: root.textCol
        colHover: root.textColHover
        hovered: root.hovered
        size: root.textSize
    }
}
