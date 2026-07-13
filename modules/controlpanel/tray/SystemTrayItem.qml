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

    backgroundColor: Color.surfaceDark
    backgroundColorHover: Color.baseDark
    iconColorHover: Color.accentNormal
    textColorHover: Color.accentNormal
    borderColor: Color.surfaceNormal
    borderColorHover: Color.accentDark

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
