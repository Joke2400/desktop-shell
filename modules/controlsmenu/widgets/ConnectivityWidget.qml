import qs.config.style
import qs.modules.controlsmenu.components.buttons

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    color: "transparent"
    implicitWidth: Constant.controlsMenuWidth
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