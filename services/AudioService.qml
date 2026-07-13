pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    property PwNode sink: Pipewire.defaultAudioSink
    property real volumeRaw: sink?.audio?.volume ?? 0
    property int volume: Math.round(volumeRaw * 100)
    property bool muted: sink?.audio?.muted ?? true

    PwObjectTracker {
        objects: [root.sink]
    }

    function setVolume(volumeRatio) {
        if (!root.sink?.audio) return;
        root.sink.audio.volume = Math.max(0, Math.min(1, volumeRatio));
    }

    function toggleMute() {
        if (!root.sink?.audio) return;
        root.sink.audio.muted = !root.sink.audio.muted;
    }
}
