import qs.config.style
import qs.components

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray

Button {
    id: root
    required property SystemTrayItem modelData
    required property string displayIcon
    signal menuOpened
    signal menuClosed

    buttonIcon: displayIcon
    tooltipText: (modelData.tooltipTitle || modelData.title).toUpperCase()
    visible: modelData.status !== SystemTrayItem.Passive

    backgroundColor: Color.baseLight
    backgroundColorHover: Color.surfaceDark
    iconColor: Color.textNormal
    iconColorHover: Color.textLight
    borderColor: Color.surfaceNormal
    borderColorHover: Color.surfaceLight

    Layout.fillHeight: true

    Rectangle {
        anchors.fill: parent
        radius: parent.radius
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: Qt.rgba(1, 1, 1, 0.07)
            }
            GradientStop {
                position: 0.1
                color: Qt.rgba(1, 1, 1, 0.05)
            }
            GradientStop {
                position: 0.4
                color: Qt.rgba(0, 0, 0, 0.0)
            }
            GradientStop {
                position: 0.7
                color: Qt.rgba(0, 0, 0, 0.05)
            }
            GradientStop {
                position: 1.0
                color: Qt.rgba(0, 0, 0, 0.25)
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        radius: parent.radius
        color: "transparent"
        border.width: 1
        border.color: Qt.rgba(1, 1, 1, 0.2)
    }

    onLeftClicked: () => {
        root.menuOpened();
        contextMenu.open();
    }

    QsMenuAnchor {
        id: contextMenu
        menu: modelData.menu
        anchor.item: root
        anchor.edges: Edges.Bottom
        anchor.gravity: Edges.Bottom | Edges.Right
        onClosed: root.menuClosed()
    }
}
