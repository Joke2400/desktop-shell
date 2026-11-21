import qs.config.style

import QtQuick
import QtQuick.Layouts

ButtonBase {
   id: root

   required property string icon

   property int iconSize: Constant.textSizeMedium
   property int spacing: Constant.spacingSmall

   implicitWidth: layout.implicitWidth + root.padding * 2
   implicitHeight: layout.implicitHeight + root.padding * 2

    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: root.spacing

        DisplayText {
            id: iconText
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            text: root.icon
            col: root.textCol
            colHover: root.textColHover
            hovered: root.hovered
            size: root.iconSize
        }
        DisplayText {
            id: btnText
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            text: root.text
            col: root.textCol
            colHover: root.textColHover
            hovered: root.hovered
            size: root.textSize
            alignToBaseline: true
        }
    }
}
