import qs.config.style
import qs.modules.statusbar.indicators
import qs.modules.statusbar.controls
import qs.modules.statusbar.workspaces
import qs.modules.statusbar.clock

import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    id: root

    anchors.top: true
    anchors.left: true
    anchors.right: true
    color: "transparent"

    implicitHeight: barContainer.implicitHeight

    margins {
        top: Constant.marginSmall
        left: Constant.marginMedium
        right: Constant.marginMedium
        bottom: Constant.marginSmall
    }

    Rectangle {
        id: barContainer

        radius: Constant.roundingMedium
        color: Color.baseNormal //Qt.hsla(Color.baseNormal.hslHue, Color.baseNormal.hslSaturation, Color.baseNormal.hslLightness, 0.8)

        anchors.centerIn: parent
        width: parent.width
        implicitHeight: rowLayout.implicitHeight + Constant.paddingSmall * 2

        ClockWidget {
            anchors.centerIn: parent
        }

        RowLayout {
            id: rowLayout

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: Constant.marginMedium
            anchors.rightMargin: Constant.marginMedium
            spacing: 0

            AppLauncherButton {}
            WorkspaceWidget {}
            ColorTestTray {}

            Item {
                Layout.fillWidth: true
            }

            IndicatorWidget {}
            ControlsWidget {}
        }
    }
}
