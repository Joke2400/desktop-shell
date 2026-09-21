pragma Singleton
import qs.config.settings

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property var selectedMonitor: {
        for (const s of Quickshell.screens) {
            if (s.name === Settings.selectedMonitorOutput) {
                return s;
            }
        }
        return Quickshell.screens.length > 0 ? Quickshell.screens[0] : null;
    }

    readonly property int monitorCount: Quickshell.screens.length
    readonly property var otherMonitors: Quickshell.screens.filter(s => (s.name !== Settings.selectedMonitorOutput))
}
