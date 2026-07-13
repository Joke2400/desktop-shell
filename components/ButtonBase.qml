import qs.config.style

import QtQuick

Rectangle {
    id: root

    readonly property bool hovered: hover.hovered
    property color backgroundColor: "transparent"
    property color backgroundColorHover: backgroundColor
    property color borderColor: "transparent"
    property color borderColorHover: borderColor

    signal leftClicked
    signal middleClicked
    signal rightClicked
    signal scrolled(int scrollDelta)

    color: backgroundColor
    border.color: borderColor

    border.width: 0
    implicitWidth: 24
    implicitHeight: 24

    onHoveredChanged: () => {
        color = hovered ? backgroundColorHover : backgroundColor;
        border.color = hovered ? borderColorHover : borderColor;
    }

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
