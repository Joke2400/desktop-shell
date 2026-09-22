import qs.config.style
import qs.components
import qs.components.style
import qs.services

import QtQuick

Button {
    id: root

    bgCol: Color.accentNormal
    brCol: Color.accentNormal
    bgColHover: Color.accentLight
    brColHover: Color.overlayDark

    tooltip: "Open Sidebar"
    btnIcon: "󱄅"
    btnText: ""

    iconSize: Constant.iconSizeLarge

    spacing: Constant.spacingSmall
    padding: 0

    radius: Constant.roundingLarge
    border.width: Constant.borderMedium

    GradientShadow {
        topCol: Qt.rgba(1, 1, 1, 0)
        centerCol: Qt.rgba(1, 1, 1, 0.03)
        bottomCol: Qt.rgba(1, 1, 1, 0.06)
    }
    BorderHighlight {}

    onLeftClicked: () => {
        if (!GlobalStates.sidebarIsVisible) {
            GlobalStates.sidebarIsVisible = true;
        } else {
            GlobalStates.sidebarIsVisible = false;
        }
    }
}
