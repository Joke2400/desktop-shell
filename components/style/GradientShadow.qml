import QtQuick

Rectangle {
    id: root

    property bool inverted: false

    property double topPos: 0.5
    property color topCol: Qt.rgba(0, 0, 0, 0.01)

    property double centerPos: 0.7
    property color centerCol: Qt.rgba(0, 0, 0, 0.03)

    property double bottomPos: 1.0
    property color bottomCol: Qt.rgba(0, 0, 0, 0.08)

    anchors.fill: parent
    radius: parent.radius
    gradient: Gradient {
        GradientStop {
            position: root.topPos
            color: root.inverted ? root.bottomCol : root.topCol
        }
        GradientStop {
            position: root.centerPos
            color: root.centerCol
        }
        GradientStop {
            position: root.bottomPos
            color: root.inverted ? root.topCol : root.bottomCol
        }
    }
}
