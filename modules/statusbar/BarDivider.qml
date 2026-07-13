import qs.config.style

import QtQuick

Rectangle {
    id: root

    property int fontSize: Constant.fontSizeMedium
    property int fontColor: Color.subTextNormal

    implicitWidth: implicitHeight
    implicitHeight: 24
    color: "transparent"

    Text {
        id: divider
        anchors.centerIn: parent
        font {
            family: Theme.fontFamily
            pixelSize: root.fontSize
        }
        color: root.fontColor
        text: "|"
    }
}
