import QtQuick

Rectangle {
    id: root

    readonly property bool hovered: hover.hovered
    property color bgCol: "transparent"
    property color brCol: "transparent"

    property color bgColHover: bgCol
    property color brColHover: brCol

    signal leftClicked
    signal middleClicked
    signal rightClicked
    signal scrolled(int scrollDelta)

    color: hovered ? bgColHover : bgCol
    border.color: hovered ? brColHover : brCol
    border.width: 0

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
    WheelHandler {
        id: wheel
        acceptedDevices: PointerDevice.AllDevices
        onWheel: event => root.scrolled(event.angleDelta.y)
    }
}
