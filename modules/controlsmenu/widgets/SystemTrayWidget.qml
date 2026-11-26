import qs.services
import qs.modules.controlsmenu.components.tray

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    Layout.alignment: Qt.AlignLeft | Qt.AlignTop

    implicitWidth: 40
    implicitHeight: 300

    visible: StateService.showSystemTrayMenu

    SystemTrayMenu {}
}