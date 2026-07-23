import qs.config.style
import qs.components
import qs.services

import QtQuick

Rectangle {
    id: root

    color: "transparent"

    implicitWidth: parent.width
    implicitHeight: column.implicitHeight

    Column {
        id: column
        spacing: 0
        width: parent.width

        Tray {
            id: essentialsTray
            innerSpacing: Constant.spacingLarge * 2
            implicitWidth: parent.width
            radius: 0

            Repeater {
                model: SystemTrayService.essentialTrayItems

                SystemTrayItem {
                    displayIcon: SystemTrayService.getTrayItemIcon(modelData)

                    iconSize: Constant.iconSizeLarge

                    radius: Constant.roundingMedium
                    buttonPadding: Constant.paddingMedium
                    border.width: Constant.borderSmall
                }
            }
        }

        Tray {
            id: othersTray
            innerSpacing: Constant.spacingLarge * 2
            implicitWidth: parent.width
            radius: 0

            Repeater {
                model: SystemTrayService.otherTrayItems

                SystemTrayItem {
                    displayIcon: SystemTrayService.getTrayItemIcon(modelData)

                    iconSize: Constant.iconSizeLarge

                    radius: Constant.roundingMedium
                    buttonPadding: Constant.paddingMedium
                    border.width: Constant.borderSmall
                }
            }
        }
    }
}
