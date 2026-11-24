import qs.config.style
import qs.modules.controlsmenu.buttons

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    color: "transparent"
    implicitWidth: parent.width
    implicitHeight: Math.max(networkButton.implicitHeight, bluetoothButton.implicitHeight) + Constant.paddingMedium * 2

    RowLayout {
        id: connectivityRow
        anchors.fill: parent
        spacing: Constant.spacingLarge

        NetworkControlButton {
            id: networkButton
            Layout.fillWidth: true
        }
        BluetoothControlButton {
            id: bluetoothButton
            Layout.fillWidth: true
        }
    }
}