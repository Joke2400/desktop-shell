import qs.config.style
import qs.components

import QtQuick

Tray {
    id: root

    backgroundColor: Color.accentNormal
    border.color: Color.accentLight

    innerSpacing: Constant.spacingMedium
    border.width: Constant.borderSmall

    implicitHeight: Constant.barHeight + Constant.paddingSmall * 2

    ControlPanelToggle {}
    NotificationControl {}
    PowerControl {}
}
