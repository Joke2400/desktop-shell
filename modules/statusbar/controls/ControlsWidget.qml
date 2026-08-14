import qs.config.style
import qs.components

import QtQuick

Tray {
    id: root

    innerSpacing: 0
    implicitHeight: Constant.barHeight

    SystemTrayControl {}
    WallpaperControl {}
    BrightnessControl {}
    VolumeControl {}
    NotificationControl {}
    PowerControl {}
}
