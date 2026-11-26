import qs.components
import qs.config.style
import qs.components.visuals

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    default property alias btn: slot.data
    required property real ratio
    required property var action

    property real ratioMin: 0
    property real ratioMax: 1

    color: "transparent"
    radius: Constant.roundingLarge

    implicitWidth: parent.width
    implicitHeight: row.implicitHeight + Constant.paddingLarge * 2

    Rectangle {
        anchors.fill: parent
        radius: Constant.roundingLarge
        color: Qt.hsla(Color.baseLight.hslHue, Color.baseLight.hslSaturation, Color.baseLight.hslLightness, 0.5)
        z: -2
    }

    GlassSurface {
        anchors.fill: parent
        radius: Constant.roundingLarge
        tint: Color.tintDark
        z: -1
    }

    RowLayout {
        id: row
        spacing: 0
        anchors.fill: parent
        anchors.leftMargin: Constant.marginLarge * 1.5

        Item {
            id: slot
            implicitWidth: childrenRect.width
            implicitHeight: childrenRect.height
        }

        Slider {
            id: slider
            Layout.fillWidth: true

            color: "transparent"

            ratio: root.ratio
            ratioMin: root.ratioMin
            ratioMax: root.ratioMax
            sliderSize: Constant.controlSliderSize
            handleSize: Constant.controlSliderHandleSize
            trackSize: Constant.controlSliderTrackSize
            textSize: Constant.textSizeMedium * 0.9

            onApplied: ratio => root.action(ratio)
        }
    }
}