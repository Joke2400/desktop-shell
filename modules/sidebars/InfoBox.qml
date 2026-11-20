import qs.services
import qs.config.style
import qs.components
import qs.components.style

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    Layout.alignment: Qt.AlignHCenter
    implicitHeight: content.implicitHeight + Constant.marginMedium * 2
    Layout.fillWidth: true

    color: Qt.hsla(Color.surfaceNormal.hslHue, Color.surfaceNormal.hslSaturation, Color.surfaceNormal.hslLightness, 0.7)
    border.color: Color.surfaceNormal
    radius: Constant.roundingMedium

    GradientHighlight {}
    BorderHighlight {}
    GradientShadow {}

    Column {
        id: content

        anchors.centerIn: parent
        width: parent.width - Constant.marginLarge * 2
        spacing: Constant.spacingLarge

        Column {
            id: systemInfo
            spacing: Constant.spacingSmall

            TextCustom {
                txt: "Running: " + SystemDataService.osName
                size: Constant.textSizeMedium
            }

            TextCustom {
                txt: " " + SystemDataService.kernelName + " " + SystemDataService.kernelVersion + "-" + SystemDataService.architecture
                size: Constant.textSizeSmall
                bold: false
            }

            TextCustom {
                txt: " " + "Quickshell" + " " + SystemDataService.quickshellVersion
                size: Constant.textSizeSmall
                bold: false
            }
        }

        Column {
            id: connectionInfo
            spacing: Constant.spacingSmall

            TextCustom {
                txt: "Host: " + SystemDataService.userName + "@" + SystemDataService.hostName
                size: Constant.textSizeMedium
            }

            TextCustom {
                txt: " Local IP: " + SystemDataService.localIp
                size: Constant.textSizeSmall
                bold: false
            }

            TextCustom {
                txt: " Global IP: " + SystemDataService.globalIp
                size: Constant.textSizeSmall
                bold: false
            }

            TextCustom {
                txt: " Uptime: " + SystemDataService.uptime
                size: Constant.textSizeSmall
                bold: false
            }
        }
    }
}
