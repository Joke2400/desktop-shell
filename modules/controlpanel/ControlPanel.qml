import qs.config.style
import qs.services
import qs.modules.controlpanel.sliders
import qs.modules.controlpanel.tray

import Quickshell
import Quickshell.Wayland
import QtQuick

PanelWindow {
    id: root

    visible: GlobalStates.controlPanelIsVisible
    color: Qt.hsla(Color.baseNormal.hslHue, Color.baseNormal.hslSaturation, Color.baseNormal.hslLightness, 0.8)

    anchors {
        top: true
        right: true
    }
    margins {
        top: -Constant.marginSmall
        right: Constant.marginLarge
    }
    implicitWidth: Math.max(screen.width / 6)
    implicitHeight: column.implicitHeight + Constant.marginMedium * 2

    exclusiveZone: 0
    WlrLayershell.namespace: "quickshell:controlpanel"

    Column {
        id: column
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            margins: Constant.marginMedium
        }
        spacing: Constant.marginMedium

        VolumeControl {}
        BrightnessControl {}
        SystemTrayWidget {}
    }
}
