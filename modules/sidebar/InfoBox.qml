import qs.services
import qs.config.style
import qs.components.style

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    Layout.alignment: Qt.AlignHCenter
    implicitHeight: content.implicitHeight + Constant.marginMedium * 2
    Layout.fillWidth: true

    color: Qt.hsla(Color.surfaceDark.hslHue, Color.surfaceDark.hslSaturation, Color.surfaceDark.hslLightness, 0.9)
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

            Text {
                font {
                    family: Theme.fontFamily
                    pixelSize: Constant.fontSizeMedium
                    bold: true
                }
                color: Color.textNormal
                text: "Running: " + SystemDataService.osName
            }
            Text {
                font {
                    family: Theme.fontFamily
                    pixelSize: Constant.fontSizeSmall
                    bold: false
                }
                color: Color.textNormal
                text: " " + SystemDataService.kernelName + " " + SystemDataService.kernelVersion + "-" + SystemDataService.architecture
            }
            Text {
                font {
                    family: Theme.fontFamily
                    pixelSize: Constant.fontSizeSmall
                    bold: false
                }
                color: Color.textNormal
                text: " " + "Quickshell" + " " + SystemDataService.quickshellVersion
            }
        }

        Column {
            id: connectionInfo
            spacing: Constant.spacingSmall

            Text {
                font {
                    family: Theme.fontFamily
                    pixelSize: Constant.fontSizeMedium
                    bold: true
                }
                color: Color.textNormal
                text: "Host: " + SystemDataService.userName + "@" + SystemDataService.hostName
            }

            Text {
                font {
                    family: Theme.fontFamily
                    pixelSize: Constant.fontSizeSmall
                    bold: false
                }
                color: Color.textNormal
                text: " Local IP: " + SystemDataService.localIp
            }

            Text {
                font {
                    family: Theme.fontFamily
                    pixelSize: Constant.fontSizeSmall
                    bold: false
                }
                color: Color.textNormal
                text: " Global IP: " + SystemDataService.globalIp
            }
            Text {
                font {
                    family: Theme.fontFamily
                    pixelSize: Constant.fontSizeSmall
                    bold: false
                }
                color: Color.textNormal
                text: " Uptime: " + SystemDataService.uptime
            }
        }
    }
}
