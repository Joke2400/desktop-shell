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

    onLeftClicked: () => {
        contextMenu.open();
    }

    QsMenuAnchor {
        id: contextMenu
        menu: modelData.menu
        anchor.item: root
        anchor.edges: Edges.Bottom
        anchor.gravity: Edges.Bottom | Edges.Right
    }
}
