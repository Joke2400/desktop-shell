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

            GlassSurface {
                anchors.fill: parent
                radius: Constant.roundingMedium
                tint: Color.tintDark
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
            }
        }
        Rectangle {
            id: singleContainer

            implicitWidth: singleLayout.implicitWidth + Constant.paddingMedium * 2
            implicitHeight: singleLayout.implicitHeight - Constant.paddingSmall * 1.25

            color: "transparent"
            radius: Constant.roundingMedium

            GlassSurface {
                anchors.fill: parent
                radius: Constant.roundingMedium
                tint: Color.tintDark
            }

            RowLayout {
                id: singleLayout
                anchors.centerIn: parent
                spacing: 0

                BatteryIndicator {}
                BarIndicator {
                    text: SystemTrayService.getNetworkTrayItemIcon(SystemTrayService.networkTrayItem)
                    tooltip: "Internet"
                }
                BarIndicator {
                    text: SystemTrayService.getNetworkTrayItemIcon(SystemTrayService.networkTrayItem)
                    tooltip: "Internet"
                }
            }
        }
    }
}
