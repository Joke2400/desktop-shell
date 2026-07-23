import qs.config.style
import qs.services

import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    id: root
    default property alias contents: column.data
    color: Color.baseNormal

    anchors {
        top: true
        right: true
    }
    margins {
        top: 0
        right: Constant.marginLarge
    }
    exclusiveZone: 0

    implicitWidth: Constant.sliderSize * 10
    implicitHeight: Constant.sliderSize

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
