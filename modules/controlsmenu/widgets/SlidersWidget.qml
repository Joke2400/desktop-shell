import qs.config.style
import qs.modules.controlsmenu.components.sliders

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    color: "transparent"
    implicitWidth: Constant.controlsMenuWidth
    implicitHeight: row.implicitHeight

    ColumnLayout {
        id: row
        anchors.fill: parent
        spacing: Constant.spacingMedium

        VolumeSlider {}
        BrightnessSlider {}
    }
}