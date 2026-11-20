import qs.config.style
import qs.config.settings
import qs.components
import qs.components.style

import QtQuick
import Quickshell
import Quickshell.Services.SystemTray

Button {
    id: root
    required property SystemTrayItem modelData

    bgCol: Qt.hsla(Color.baseLight.hslHue, Color.baseLight.hslSaturation, Color.baseLight.hslLightness, 0.9)
    brCol: Color.surfaceNormal
    bgColHover: Qt.hsla(Color.surfaceDark.hslHue, Color.surfaceDark.hslSaturation, Color.surfaceDark.hslLightness, 0.9)
    brColHover: Color.surfaceLight

    tooltip: (modelData.tooltipTitle || modelData.title).toUpperCase()
    iconSize: Constant.iconSizeMedium

    signal menuOpened
    signal menuClosed

    padding: Constant.paddingMedium * 1.8
    radius: Constant.roundingMedium
    border.width: Constant.borderSmall

    visible: Settings.showPassiveTrayIcons ? true : modelData.status !== SystemTrayItem.Passive

    GradientHighlight {}
    BorderHighlight {
        borderCol: Qt.rgba(1, 1, 1, 0.02)
    }
    GradientShadow {}

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
