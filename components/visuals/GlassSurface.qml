import QtQuick

// Note: this effect is AI-generated

Item {
    id: root

    property real radius: 0
    property color tint: Qt.rgba(1, 1, 1, 0.06)
    property real edgeLight: 0.4

    // Base tint
    Rectangle {
        anchors.fill: parent
        radius: root.radius
        color: root.tint
    }

    // Vertical sheen: brighter at the top, fading out
    Rectangle {
        anchors.fill: parent
        radius: root.radius
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(1, 1, 1, 0.14) }
            GradientStop { position: 0.5; color: Qt.rgba(1, 1, 1, 0.03) }
            GradientStop { position: 1.0; color: Qt.rgba(1, 1, 1, 0.0) }
        }
    }

    // Hairline outline
    Rectangle {
        anchors.fill: parent
        radius: root.radius
        color: "transparent"
        border.width: 1
        border.color: Qt.rgba(1, 1, 1, 0.16)
    }

    // Specular highlight along the top edge
    Rectangle {
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            leftMargin: root.radius
            rightMargin: root.radius
        }
        height: 1
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0.0; color: "transparent" }
            GradientStop { position: 0.5; color: Qt.rgba(1, 1, 1, root.edgeLight) }
            GradientStop { position: 1.0; color: "transparent" }
        }
    }

    // Subtle dark line along the bottom edge for depth
    Rectangle {
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            leftMargin: root.radius
            rightMargin: root.radius
        }
        height: 1
        color: Qt.rgba(0, 0, 0, 0.18)
    }
}