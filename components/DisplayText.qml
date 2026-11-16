import qs.config.style

import QtQuick
import QtQuick.Layouts

Text {
    id: root
    required property int size

    property string fontFamily: Theme.fontFamily
    property color col: Color.textNormal
    property color colHover: Color.textLight
    property bool hovered: false
    property bool bold: true
    property bool alignToBaseline: true

    font {
        pixelSize: size
        family: fontFamily
        bold: bold
    }
    color: hovered ? colHover : col
    Layout.alignment: root.alignToBaseline ? Qt.AlignBaseline | Qt.AlignHCenter : Qt.AlignVCenter | Qt.AlignHCenter
}
