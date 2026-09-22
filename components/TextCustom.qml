import qs.config.style

import QtQuick

Text {
    id: root
    required property string txt
    required property int size

    property string fontFamily: Theme.fontFamily
    property color col: Color.textNormal
    property color colHover: Color.textLight
    property bool hovered: false
    property bool bold: true

    text: txt
    font {
        pixelSize: size
        family: fontFamily
        bold: bold
    }
    color: hovered ? colHover : col
}
