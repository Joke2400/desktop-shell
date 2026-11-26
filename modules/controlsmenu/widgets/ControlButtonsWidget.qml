import qs.services
import qs.config.style
import qs.modules.controlsmenu.components.buttons

import QtQuick.Layouts

GridLayout {
    id: root

    implicitWidth: Constant.controlsMenuWidth

    columnSpacing: Constant.spacingLarge
    rowSpacing: Constant.spacingLarge
    columns: 3

    ControlButton {
        text: "󰄀"
        tooltip: "Screenshot"
        leftAction: () => {  }
    }
    ControlButton {
        text: "󰕧"
        tooltip: "Screenrecord"
        leftAction: () => {  }
    }
    ControlButton {
        text: ""
        tooltip: "Calculator"
        leftAction: () => {  }
    }
    ControlButton {
        text: "󱘟"
        tooltip: "Clipboard"
        leftAction: () => {  }
    }
    ControlButton {
        text: "󰀠"
        tooltip: "Alarm"
        leftAction: () => {  }
    }
    ControlButton {
        text: "X"
        tooltip: "bruh"
        leftAction: () => {
            StateService.showSystemTrayMenu = !StateService.showSystemTrayMenu
        }
    }
}