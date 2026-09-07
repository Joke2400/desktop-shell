import qs.config.style
import qs.components
import qs.components.style

import QtQuick
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

    backgroundColor: Qt.hsla(Color.baseLight.hslHue, Color.baseLight.hslSaturation, Color.baseLight.hslLightness, 0.9)
    backgroundColorHover: Qt.hsla(Color.surfaceDark.hslHue, Color.surfaceDark.hslSaturation, Color.surfaceDark.hslLightness, 0.9)
    iconColor: Color.textNormal
    iconColorHover: Color.textLight
    borderColor: Color.surfaceNormal
    borderColorHover: Color.surfaceLight

    iconSize: Constant.iconSizeMedium
    radius: Constant.roundingMedium
    buttonPadding: Constant.paddingMedium * 1.8
    border.width: Constant.borderSmall

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
