import qs.config.style
import qs.components

import QtQuick

Tray {
    id: root

    innerSpacing: 0
    implicitHeight: Constant.barHeight

    BrightnessControl {}
    VolumeControl {}
    NotificationControl {}
    PowerControl {}
}
