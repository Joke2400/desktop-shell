import QtQuick

Rectangle {
    id: root

    property double topPos: 0.0
    property color topCol: Qt.rgba(1, 1, 1, 0.04)

    property double centerPos: 0.5
    property color centerCol: Qt.rgba(0, 0, 0, 0.0)

    property double bottomPos: 1.0
    property color bottomCol: Qt.rgba(0, 0, 0, 0.04)

    anchors.fill: parent
    radius: parent.radius
    gradient: Gradient {
        GradientStop {
            position: root.topPos
            color: root.topCol
        }
        GradientStop {
            position: root.centerPos
            color: root.centerCol
        }
        GradientStop {
            position: root.bottomPos
            color: root.bottomCol
        }
    }
}
