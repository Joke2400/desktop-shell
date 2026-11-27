import qs.services
import qs.config.style
import qs.components.visuals
import qs.modules.controlsmenu.components

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    Layout.fillWidth: true
    implicitHeight: 240

    color: "transparent"
    radius: Constant.roundingMedium

    Rectangle {
        anchors.fill: parent
        radius: Constant.roundingLarge
        color: Qt.hsla(Color.baseLight.hslHue, Color.baseLight.hslSaturation, Color.baseLight.hslLightness, 0.5)
        z: -2
    }

    GlassSurface {
        anchors.fill: parent
        radius: Constant.roundingLarge
        tint: Color.tintNormal
        z: -1
    }

    Rectangle {
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            margins: Constant.marginMedium
        }

        color: "transparent"

        ListView {
            anchors.fill: parent
            clip: true
            spacing: Constant.spacingMedium
            model: Object.values(NetworkService.availableNetworks)
                    .map(n => NetworkService.getNetworkDetails(n))

            delegate: DropdownListItem {
                required property var modelData

                icon: modelData.deviceType === "Wired" ? "󰈀" : "󰖩"
                text: modelData.deviceType === "Wired" ? "Wired LAN" : modelData.networkName
                subText: modelData.known
                            ? `${modelData.connectionName} (${modelData.deviceName})`
                            : modelData.deviceName
                action: () => {}

            }
        }
    }

}