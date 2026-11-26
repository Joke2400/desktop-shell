import qs.config.style
import qs.modules.controlsmenu.components.sliders

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    implicitWidth: Constant.controlsMenuWidth
    implicitHeight: row.implicitHeight

    RowLayout {
        id: row
        spacing: Constant.spacingSmall

        VolumeSlider {}
        BrightnessSlider {}
    }
}