import qs.services
import qs.config.style
import qs.config.settings
import qs.components.style
import qs.modules.statusbar.indicators
import qs.modules.statusbar.controls
import qs.modules.statusbar.workspaces
import qs.modules.statusbar.clock

import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    id: root

    screen: MonitorService.selectedMonitor
    anchors.top: Settings.statusbarPosition === "top" ? true : false
    anchors.bottom: Settings.statusbarPosition === "bottom" ? true : false
    anchors.left: true
    anchors.right: true
    color: "transparent"

    implicitHeight: barContainer.implicitHeight + Constant.paddingSmall * 2

    margins {
        top: (Constant.marginSmall / 2)
        left: Constant.marginSmall / 2
        right: Constant.marginSmall / 2
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

        GradientHighlight {}
        BorderHighlight {}
        GradientShadow {}

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
