import qs.config.style
import qs.components
import qs.components.visuals

import QtQuick
import Quickshell

Button {
    id: root
    required property var modelData

    bgCol: "transparent"
    bgColHover: "transparent"

    textSize: Constant.textSizeMedium * 1.5
    minBtnSize: Constant.textSizeMedium * 1.5

    padding: Constant.paddingSmall

    signal menuOpened
    signal menuClosed

    onLeftClicked: () => {
        root.menuOpened();
        contextMenu.open();
    }

    QsMenuAnchor {
        id: contextMenu
        menu: root.modelData.menu
        anchor.item: root
        anchor.edges: Edges.Bottom
        anchor.gravity: Edges.Bottom | Edges.Left
        onClosed: root.menuClosed()
    }

    GlassSurface {
        anchors.fill: parent
        radius: Constant.roundingLarge * 2
        tint: root.hovered? Color.tintLight : Color.tintNormal
    }
}