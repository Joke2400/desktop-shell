import qs.config.style
import qs.components
import qs.components.visuals
import qs.modules.controlsmenu.components.buttons

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    required property string icon
    required property string text
    required property string subText

    required property var action
    required property string actionIcon
    required property string actionTooltip

    property int iconSize: Constant.textSizeLarge
    property int textSize: Constant.textSizeSmall
    property int subTextSize: Constant.textSizeTiny
    property int padding: Constant.paddingLarge

    property color textCol: Color.textNormal
    property color textColHover: Color.textLight
    property color iconCol: Color.textNormal
    property color subTextCol: Color.subTextLight
    property color iconColHover: Color.textLight
    property color subTextColHover: Color.subTextLight

    color: "transparent"
    anchors {
        left: parent.left
        right: parent.right
    }
    implicitHeight: 50

    Rectangle {
        anchors.fill: parent
        radius: Constant.roundingMedium
        color: Qt.hsla(Color.surfaceDark.hslHue, Color.surfaceDark.hslSaturation, Color.surfaceDark.hslLightness, 0.5)
        z: -2
    }

    GlassSurface {
        anchors.fill: parent
        radius: Constant.roundingMedium
        tint: hover.hovered ? Color.tintLight : Color.tintNormal
        z: -1
        edgeLight: 0
    }
    HoverHandler {
        id: hover
    }

    RowLayout {
        id: row
        anchors.fill: parent
        spacing: Constant.spacingSmall

        Rectangle {
            id: iconContainer
            Layout.alignment: Qt.AlignVCenter

            color: "transparent"

            implicitWidth: iconText.implicitHeight + Constant.marginSmall * 2
            implicitHeight: iconText.implicitHeight + Constant.marginLarge * 2

            DisplayText {
                id: iconText
                anchors.centerIn: parent
                text: root.icon
                col: root.iconCol
                colHover: root.iconColHover
                hovered: hover.hovered
                size: root.iconSize
            }
        }
        ColumnLayout {
            id: textColumn
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            spacing: Constant.spacingSmall

            DisplayText {
                id: titleText
                Layout.fillWidth: true
                text: root.text
                col: root.textCol
                colHover: root.textColHover
                hovered: hover.hovered
                size: root.textSize
                elide: Text.ElideRight
            }
            DisplayText {
                id: detailText
                Layout.fillWidth: true
                text: root.subText
                col: root.subTextCol
                colHover: root.subTextColHover
                hovered: hover.hovered
                size: root.subTextSize
                bold: false
                elide: Text.ElideRight
            }
        }
        ControlButton {
            text: root.actionIcon
            tooltip: root.actionTooltip
            leftAction: root.action
            visible: !!root.action
            textSize: Constant.textSizeLarge
            minBtnSize: Constant.textSizeLarge * 1.25
            padding: Constant.paddingLarge
            Layout.rightMargin: Constant.marginSmall
        }
    }
}