import qs.services
import qs.config.style

import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    id: root
    default property alias contents: column.data

    screen: MonitorService.selectedMonitor
    color: Color.baseNormal
    implicitWidth: Constant.sliderSize * 10
    implicitHeight: Constant.sliderSize
    exclusiveZone: 0

    anchors {
        top: true
        right: true
    }
    margins {
        top: 0
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
