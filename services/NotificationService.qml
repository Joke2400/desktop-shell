import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

pragma Singleton

Singleton {
    id: root

    property int notificationCount: 0
    property bool isMuted: false
    property bool isInhibited: false

    // update on start
    Component.onCompleted: {
        Hyprland.dispatch(
            "exec swaync-client -c"
        )
    }

    Process {
        id: swayncProc
        command: ["swaync-client", "-s"]
        running: true

        stdout: SplitParser {
            onRead: line => {
                const state = JSON.parse(line)
                root.notificationCount = state["count"]
                root.isMuted = state["dnd"]
                root.isInhibited = state["inhibited"]
            }
        }
    }
}