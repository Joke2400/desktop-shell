import qs.components
import qs.config.style
import qs.components.visuals

import QtQuick
import QtQuick.Layouts


ButtonBase {
   id: root

   // Note: ID titleText uses text-related properties inherited from ButtonBase
   required property string icon
   required property string subText

   property int iconSize: Constant.textSizeLarge
   property int subTextSize: Constant.textSizeTiny

   property color iconCol: Color.textNormal
   property color subTextCol: Color.subTextLight
   property color iconColHover: Color.textLight
   property color subTextColHover: Color.subTextLight

   textSize: Constant.textSizeSmall
   padding: Constant.paddingLarge

   implicitWidth: Math.max(row.implicitWidth + root.padding * 2, root.minBtnSize + root.padding * 2)
   implicitHeight: Math.max(row.implicitHeight + root.padding * 2, root.minBtnSize + root.padding * 2)

   Rectangle {
       anchors.fill: parent
       radius: Constant.roundingMedium
       color: Qt.hsla(Color.surfaceDark.hslHue, Color.surfaceDark.hslSaturation, Color.surfaceDark.hslLightness, 0.5)
       z: -2
   }

   GlassSurface {
       anchors.fill: parent
       radius: Constant.roundingMedium
       tint: root.hovered? Color.tintNormal : Color.tintDark
       z: -1
   }

   RowLayout {
       id: row
       anchors {
           top: parent.top
           bottom: parent.bottom
           left: parent.left
           right: parent.right
           leftMargin: Constant.marginMedium
           rightMargin: Constant.marginMedium
       }
       spacing: Constant.spacingSmall

       implicitWidth: iconContainer.implicitWidth + row.spacing + textColumn.implicitWidth
       implicitHeight: Math.max(iconContainer.implicitHeight, textColumn.implicitHeight)

       Rectangle {
           id: iconContainer
           Layout.alignment: Qt.AlignVCenter

           color: "transparent"

           implicitWidth: iconText.implicitHeight + Constant.marginMedium * 2
           implicitHeight: iconText.implicitHeight + Constant.marginMedium * 2

           DisplayText {
               id: iconText
               anchors.centerIn: parent
               text: root.icon
               col: root.iconCol
               colHover: root.iconColHover
               hovered: root.hovered
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
               hovered: root.hovered
               size: root.textSize
               elide: Text.ElideRight
           }
           DisplayText {
               id: detailText
               Layout.fillWidth: true
               text: root.subText
               col: root.subTextCol
               colHover: root.subTextColHover
               hovered: root.hovered
               size: root.subTextSize
               bold: false
               elide: Text.ElideRight
           }
       }
   }
}
