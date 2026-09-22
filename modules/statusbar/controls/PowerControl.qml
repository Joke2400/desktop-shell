import qs.config.style
import qs.services

import QtQuick

ControlButton {
    id: root

    tooltip: "Power Menu"
    btnIcon: ""
    btnText: ""

    iconCol: GlobalStates.powerMenuIsVisible ? Color.colYellow : Color.textNormal
    iconColHover: GlobalStates.powerMenuIsVisible ? Color.colYellow : Color.textLight

    onLeftClicked: () => {
        GlobalStates.powerMenuIsVisible = !GlobalStates.powerMenuIsVisible;
    }
}
