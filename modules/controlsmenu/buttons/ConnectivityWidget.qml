import qs.services
import qs.config.style

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

        NetworkControl {
            id: networkButton
            Layout.fillWidth: true
        }
        BluetoothControl {
            id: bluetoothButton
            Layout.fillWidth: true
        }
    }
}