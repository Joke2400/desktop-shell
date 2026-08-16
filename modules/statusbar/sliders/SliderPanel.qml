import qs.services
import qs.config.style

import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    id: root
    default property alias contents: column.data

    screen: MonitorService.selectedMonitor
    color: "transparent"
    implicitWidth: MonitorService.selectedMonitor.width / 7.5
    implicitHeight: Constant.sliderSize + Constant.paddingLarge * 2
    exclusiveZone: 0

    anchors {
        top: true
        right: true
    }
    margins {
        top: Constant.marginSmall
        right: Constant.marginLarge
    }
    ColumnLayout {
        id: column
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        spacing: Constant.marginMedium
    }
}
