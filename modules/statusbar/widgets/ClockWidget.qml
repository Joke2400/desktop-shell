import qs.services
import qs.components
import qs.config.style

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property bool isToggled: false
    property string time: Qt.formatTime(ClockService.date, "HH:mm:ss")
    property string date: Qt.formatDate(ClockService.date, "dd.MM.yyyy")
    property string dateTime: Qt.formatDateTime(ClockService.date, "ddd dd MMM")

    color: "transparent"
    implicitWidth: column.implicitWidth
    implicitHeight: column.implicitHeight

    ColumnLayout {
        id: column
        anchors.centerIn: parent
        spacing: 0

        DisplayText {
            id: timeText
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            text: root.time
            col: Color.textNormal
            colHover: Color.textNormal
            hovered: false
            size: Constant.textSizeSmall
        }

        DisplayText {
            id: dateText
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            text: root.dateTime
            col: Color.textNormal
            colHover: Color.textNormal
            hovered: false
            size: Constant.textSizeTiny
            bold: false
        }
    }
}