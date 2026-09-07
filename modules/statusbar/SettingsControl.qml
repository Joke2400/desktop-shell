import qs.config.style
import qs.components
import qs.components.style
import qs.services

import QtQuick

Button {
    id: root

    buttonIcon: "󱄅"
    tooltipText: "Launcher"

    backgroundColor: Color.accentNormal
    backgroundColorHover: Color.accentLight

    iconColor: Color.textNormal
    iconColorHover: Color.textLight

    iconSize: Constant.iconSizeLarge
    radius: Constant.roundingLarge
    buttonPadding: 0

    GradientShadow {
        topCol: Qt.rgba(1, 1, 1, 0)
        centerCol: Qt.rgba(1, 1, 1, 0.03)
        bottomCol: Qt.rgba(1, 1, 1, 0.06)
    }

    Rectangle {
        anchors.fill: parent
        radius: parent.radius
        color: "transparent"
        border.width: 1
        border.color: Qt.rgba(1, 1, 1, 0.1)
    }

    onLeftClicked: () => {
        if (!GlobalStates.settingsMenuIsVisible) {
            GlobalStates.settingsMenuIsVisible = true;
        } else {
            GlobalStates.settingsMenuIsVisible = false;
        }
    }
}
