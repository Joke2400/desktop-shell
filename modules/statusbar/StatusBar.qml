import qs.components
import qs.services
import qs.config.style
import qs.config.settings
import qs.modules.statusbar.indicators
import qs.modules.statusbar.controls
import qs.modules.statusbar.workspaces
import qs.modules.statusbar.clock

import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    id: root

    anchors.top: Settings.statusbarPosition === "top" ? true : false
    anchors.bottom: Settings.statusbarPosition === "bottom" ? true : false
    anchors.left: true
    anchors.right: true
    color: "transparent"

    implicitHeight: barContainer.implicitHeight + Constant.paddingSmall * 2

    margins {
        top: (Constant.marginSmall / 2)
        left: Constant.marginSmall
        right: Constant.marginSmall
        bottom: (Constant.marginSmall / 2)
    }

    Rectangle {
        id: barContainer

        radius: Constant.roundingMedium
        color: Qt.hsla(Color.baseNormal.hslHue, Color.baseNormal.hslSaturation, Color.baseNormal.hslLightness, 0.9)

        anchors.fill: parent
        width: parent.width
        implicitHeight: rowLayout.implicitHeight + Constant.paddingSmall * 2

        ClockWidget {
            anchors.centerIn: parent
        }

        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: Qt.rgba(1, 1, 1, 0.07)
                }
                GradientStop {
                    position: 0.1
                    color: Qt.rgba(1, 1, 1, 0.05)
                }
                GradientStop {
                    position: 0.4
                    color: Qt.rgba(0, 0, 0, 0.0)
                }
                GradientStop {
                    position: 0.7
                    color: Qt.rgba(0, 0, 0, 0.05)
                }
                GradientStop {
                    position: 1.0
                    color: Qt.rgba(0, 0, 0, 0.25)
                }
            }
        }

        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            color: "transparent"
            border.width: 1
            border.color: Qt.rgba(1, 1, 1, 0.2)
        }

        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: Qt.rgba(0, 0, 0, 0.0)
                }
                GradientStop {
                    position: 0.7
                    color: Qt.rgba(0, 0, 0, 0.0)
                }
                GradientStop {
                    position: 1.0
                    color: Qt.rgba(0, 0, 0, 0.08)
                }
            }
        }

        RowLayout {
            id: rowLayout
            anchors.fill: parent
            anchors.leftMargin: Constant.marginMedium
            anchors.rightMargin: Constant.marginMedium
            anchors.topMargin: Constant.paddingSmall
            anchors.bottomMargin: Constant.paddingSmall
            spacing: 0

            AppLauncherButton {}
            WorkspaceWidget {}
            // ColorTestTray {}

            Item {
                Layout.fillWidth: true
            }

            IndicatorWidget {}
            ControlsWidget {}
        }
    }
}
