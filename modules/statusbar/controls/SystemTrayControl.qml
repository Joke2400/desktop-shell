import qs.config.style
import qs.services

import QtQuick

ControlButton {
    id: root

    tooltip: "System Tray"
    btnIcon: GlobalStates.systemTrayIsVisible ? "" : ""
    btnText: ""

    iconSize: Constant.iconSizeMedium * 1.05

    function readPos() {
        var pos = root.mapToGlobal(root.width / 2, root.height / 2);
        GlobalStates.trayButtonPosX = pos.x;
        GlobalStates.trayButtonPosY = pos.y;
    }

    // This is to let the other qml files load in first
    Timer {
        id: settleTimer
        interval: 50
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
