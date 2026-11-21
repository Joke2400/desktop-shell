import qs.services
import qs.config.style
import qs.components.visuals


import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    // Note: the added width creates an invisible margin to the right!
    implicitWidth: container.implicitWidth + Constant.marginLarge
    implicitHeight: container.implicitHeight

    color: "transparent"
    radius: Constant.roundingMedium

    RowLayout {
        id: container

        spacing: Constant.spacingLarge

        Rectangle {
            id: statsContainer

            implicitWidth: statsLayout.implicitWidth + Constant.paddingMedium * 2
            implicitHeight: statsLayout.implicitHeight - Constant.paddingSmall * 1.25

            color: "transparent"
            radius: Constant.roundingMedium

            Rectangle {
                anchors.fill: parent
                radius: Constant.roundingMedium
                color: Qt.hsla(Color.baseLight.hslHue, Color.baseLight.hslSaturation, Color.baseLight.hslLightness, 0.5)
                z: -2
            }

            GlassSurface {
                anchors.fill: parent
                radius: Constant.roundingMedium
                tint: Color.tintDark
                edgeLight: 0
                z: -1
            }

            RowLayout {
                id: statsLayout
                anchors.centerIn: parent
                spacing: Constant.spacingMedium

                BarIndicatorDual {
                    icon: ""
                    text: SystemDataService.cpuPercent.toFixed(1) + "%"
                    tooltip: "CPU " + SystemDataService.cpuPercent.toFixed(1) + "%"
                }
                BarIndicatorDual {
                    icon: ""
                    text: SystemDataService.memPercent.toFixed(1) + "%"
                    tooltip: "MEM " + SystemDataService.memPercent.toFixed(1) + "%"
                }
                BarIndicatorDual {
                    icon: "󰋊"
                    text: SystemDataService.diskPercent.toFixed(1) + "%"
                    tooltip: "DISK " + SystemDataService.diskPercent.toFixed(1) + "%"
                }
                BarIndicatorDual {
                    icon: {
                        if (BatteryService.isFull)
                            return "󰂄";
                        if (BatteryService.percentage < 15) {
                            return BatteryService.isCharging ? "󰢟" : "󰂎";
                        } else if (BatteryService.percentage < 33) {
                            return BatteryService.isCharging ? "󱊤" : "󱊡";
                        } else if (BatteryService.percentage < 66) {
                            return BatteryService.isCharging ? "󱊥" : "󱊢";
                        } else {
                            return BatteryService.isCharging ? "󱊦" : "󱊣";
                        }
                    }
                    text: BatteryService.percentage + "%"
                    tooltip: "Battery: " + BatteryService.percentage + "%"
                    visible: BatteryService.battery !== null
                }
            }
        }
    }
}
