import qs.config.style

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    color: "transparent"

    implicitWidth: rowLayout.implicitWidth
    implicitHeight: Constant.barHeight + Constant.paddingSmall * 2

    RowLayout {
        id: rowLayout
        anchors.centerIn: parent
        spacing: Constant.spacingSmall

        SystemTrayControl {}
        WallpaperControl {}
        BrightnessControl {}
        VolumeControl {}
        NotificationControl {}
        PowerControl {}
    }
}
