import QtQuick

Rectangle {
    property color borderCol: Qt.rgba(1, 1, 1, 0.1)

    anchors.fill: parent
    radius: parent.radius
    color: "transparent"
    border.width: 1
    border.color: borderCol
}
