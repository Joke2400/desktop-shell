import qs.services
import qs.config.style

import QtQuick
import Quickshell

PanelWindow {
    id: root

    screen: MonitorService.selectedMonitor
    color: "transparent"
    implicitWidth: Constant.sliderWidth
    implicitHeight: Constant.sliderHeight + Constant.paddingLarge * 1.5
    exclusiveZone: 0

    anchors {
        top: true
        right: true
    }
    margins {
        top: Constant.marginSmall
        right: Constant.marginLarge
    }
}
