import qs.config.style
import qs.components
import qs.services

import QtQuick

Button {
    id: root

    buttonIcon: GlobalStates.systemTrayIsVisible ? "" : ""
    tooltipText: "System Tray"
    backgroundColorHover: Color.baseLight
    iconColor: Color.textNormal
    iconColorHover: Color.textLight
    radius: Constant.roundingLarge
    iconSize: Constant.iconSizeMedium * 1.1
    buttonPadding: Constant.paddingSmall * 0.5

    function readPos() {
        var pos = root.mapToGlobal(root.width / 2, root.height / 2);
        GlobalStates.trayButtonPosX = pos.x;
        GlobalStates.trayButtonPosY = pos.y;
    }

    Timer {
        id: settleTimer
        interval: 16
        running: true
        onTriggered: root.readPos()
    }

    onLeftClicked: () => {
        if (!GlobalStates.systemTrayIsVisible) {
            GlobalStates.systemTrayIsVisible = true;
            GlobalStates.volumeSliderIsVisible = false;
            GlobalStates.brightnessSliderIsVisible = false;
        } else {
            GlobalStates.systemTrayIsVisible = false;
        }
    }
}
