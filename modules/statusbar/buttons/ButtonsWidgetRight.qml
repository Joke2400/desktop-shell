import qs.services
import qs.config.style

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    color: "transparent"
    radius: Constant.roundingMedium

    RowLayout {
        id: layout
        spacing: 0

        BarButton {
            text: ""
            tooltip: "Controls"
            leftAction: () => { StateService.openMenu("showControlsMenu") }
        }

        NotificationButton {}

        BarButton {
            text: ""
            tooltip: "Power"
            leftAction: () => { StateService.openMenu("showPowerMenu") };
        }

    }
}
