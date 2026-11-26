import qs.config.style
import qs.components.visuals

import QtQuick

Rectangle {
    id: root
    anchors {
        left: parent.left
        right: parent.right
    }
    implicitHeight: 160

    color: "transparent"
    radius: Constant.roundingMedium

    Rectangle {
        anchors.fill: parent
        radius: Constant.roundingMedium
        color: Qt.hsla(Color.baseDark.hslHue, Color.baseDark.hslSaturation, Color.baseDark.hslLightness, 0.5)
        z: -2
    }

    GlassSurface {
        anchors.fill: parent
        radius: Constant.roundingMedium
        tint: Color.tintLight
        z: -1
    }

    Rectangle {
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            margins: Constant.marginSmall
        }

        Rectangle {
            anchors.fill: parent
            radius: Constant.roundingMedium
            color: Qt.hsla(Color.surfaceDark.hslHue, Color.surfaceDark.hslSaturation, Color.surfaceDark.hslLightness, 0.5)
            z: -2
        }

        GlassSurface {
            anchors.fill: parent
            radius: Constant.roundingMedium
            tint: Color.tintDark
            z: -1
        }

        color: "transparent"
        radius: Constant.roundingMedium

        Column {
            id: column
            anchors.fill: parent
            spacing: Constant.spacingSmall

            Rectangle {
                anchors {
                    left: parent.left
                    right: parent.right
                }
                implicitHeight: 40

                color: "transparent"

                Rectangle {
                    anchors.fill: parent
                    radius: Constant.roundingMedium
                    color: Qt.hsla(Color.surfaceNormal.hslHue, Color.surfaceNormal.hslSaturation, Color.surfaceNormal.hslLightness, 0.5)
                    z: -2
                }

                GlassSurface {
                    anchors.fill: parent
                    radius: Constant.roundingMedium
                    tint: Color.tintNormal
                    z: -1
                    edgeLight: 0
                }
            }
            Rectangle {
                anchors {
                    left: parent.left
                    right: parent.right
                }
                implicitHeight: 40

                color: "transparent"

                Rectangle {
                    anchors.fill: parent
                    radius: Constant.roundingMedium
                    color: Qt.hsla(Color.surfaceNormal.hslHue, Color.surfaceNormal.hslSaturation, Color.surfaceNormal.hslLightness, 0.5)
                    z: -2
                }

                GlassSurface {
                    anchors.fill: parent
                    radius: Constant.roundingMedium
                    tint: Color.tintNormal
                    z: -1
                    edgeLight: 0
                }
            }
            Rectangle {
                anchors {
                    left: parent.left
                    right: parent.right
                }
                implicitHeight: 40

                color: "transparent"

                Rectangle {
                    anchors.fill: parent
                    radius: Constant.roundingMedium
                    color: Qt.hsla(Color.surfaceNormal.hslHue, Color.surfaceNormal.hslSaturation, Color.surfaceNormal.hslLightness, 0.5)
                    z: -2
                }

                GlassSurface {
                    anchors.fill: parent
                    radius: Constant.roundingMedium
                    tint: Color.tintNormal
                    z: -1
                    edgeLight: 0
                }
            }

        }
    }

}