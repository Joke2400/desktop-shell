import qs.services
import qs.config.style
import qs.components.visuals
import qs.modules.controlsmenu.components.buttons

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    color: "transparent"
    Layout.alignment: Qt.AlignLeft | Qt.AlignTop

    implicitWidth: Constant.systemTrayMenuWidth
    Layout.fillHeight: true

    Rectangle {
        anchors.fill: parent
        radius: Constant.roundingMedium
        color: Qt.hsla(Color.baseDark.hslHue, Color.baseDark.hslSaturation, Color.baseDark.hslLightness, 0.5)
        z: -2
    }

    GlassSurface {
        anchors.fill: parent
        radius: Constant.roundingMedium
        tint: Color.tintNormal
        z: -1
        edgeLight: 0
    }

    ListView {
        anchors.centerIn: parent
        width: parent.width
        height: parent.height - Constant.marginMedium * 2
        clip: true
        spacing: Constant.spacingMedium
        model: SystemTrayService.systemTrayOther

        //ScrollBar.vertical: ScrollBar {}  // optional visible scrollbar

        delegate: SystemTrayButton {
            id: btn
            text: SystemTrayService.getSystemTrayIcon(modelData)
            tooltip: (modelData.tooltipTitle || modelData.title).toUpperCase()

            anchors.horizontalCenter: parent.horizontalCenter

            onMenuOpened: StateService.systemTrayContextMenuOpen = true
            onMenuClosed: StateService.systemTrayContextMenuOpen = false
        }
    }
}