import qs.services
import qs.config.style
import qs.config.settings
import qs.components.visuals
import qs.modules.statusbar.widgets
import qs.modules.statusbar.components

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: root

    screen: MonitorService.selectedMonitor
    anchors {
        top: Settings.statusbarPosition === "top" ? true : false
        bottom: Settings.statusbarPosition === "bottom" ? true : false
        left: true
        right: true
    }
    WlrLayershell.namespace: "quickshell:statusbar"
    color: "transparent"

    margins {
        top: (Constant.marginSmall / 2)
        left: Constant.marginSmall / 2
        right: Constant.marginSmall / 2
        bottom: (Constant.marginSmall / 2)
    }

    implicitHeight: barContainer.implicitHeight

    Rectangle {
        id: barContainer

        color: "transparent"

        implicitWidth: parent.width
        implicitHeight: Constant.barHeight + Constant.paddingSmall * 2

        GlassSurface {
            anchors.fill: parent
            radius: Constant.roundingMedium
            tint: Color.tintNormal
        }

        ClockWidget {
            anchors.centerIn: parent
        }

        RowLayout {
            id: rowLayout
            anchors.fill: parent
            anchors.leftMargin: Constant.marginMedium
            anchors.rightMargin: Constant.marginMedium
            spacing: 0

            ButtonsWidgetLeft {}

            Item {
                Layout.fillWidth: true
            }

            IndicatorWidgetRight {}

            ButtonsWidgetRight {}
        }
    }
}
