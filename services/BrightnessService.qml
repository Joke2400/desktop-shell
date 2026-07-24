pragma Singleton
import qs.services
import qs.config.settings
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property int gamma
    property int temperature

    function nightlight() {
        BrightnessService.setGamma(75);
        BrightnessService.setTemperature(5000);
    }

    function bluelight() {
        BrightnessService.setGamma(100);
        BrightnessService.setTemperature(6000);
    }

    Component.onCompleted: {
        if (Settings.adjustBrightnessOnLoad) {
            if (ClockService.hours >= 21 || ClockService.hours < 7) {
                nightlight();
            } else {
                bluelight();
            }
        }
        Qt.callLater(update);
    }

    function update() {
        readGammaProc.running = true;
        readTemperatureProc.running = true;
    }

    function setGamma(value) {
        setGammaProc.value = value;
        setGammaProc.running = true;
    }

    function setTemperature(value) {
        setTemperatureProc.value = value;
        setTemperatureProc.running = true;
    }

    Process {
        id: readGammaProc
        command: ["hyprctl", "hyprsunset", "gamma"]
        stdout: StdioCollector {
            onStreamFinished: {
                const parsed = parseInt(text.trim());
                if (!isNaN(parsed)) {
                    root.gamma = parsed;
                } else {
                    console.warn("BrightnessService: unexpected gamma output:", text);
                }
            }
        }
        stderr: StdioCollector {
            onStreamFinished: {
                if (text.trim().length > 0) {
                    console.warn("BrightnessService: gamma read stderr:", text);
                }
            }
        }
        onExited: (exitCode, exitStatus) => {
            if (exitCode !== 0) {
                console.warn("BrightnessService: gamma read failed, exit code", exitCode);
            }
        }
    }

    Process {
        id: setGammaProc
        property int value
        command: ["hyprctl", "hyprsunset", "gamma", String(value)]
        stderr: StdioCollector {
            onStreamFinished: {
                if (text.trim().length > 0) {
                    console.warn("BrightnessService: set gamma stderr:", text);
                }
            }
        }
        onExited: (exitCode, exitStatus) => {
            if (exitCode !== 0) {
                console.warn("BrightnessService: set gamma failed, exit code", exitCode);
            }
            root.update();
        }
    }

    Process {
        id: readTemperatureProc
        command: ["hyprctl", "hyprsunset", "temperature"]
        stdout: StdioCollector {
            onStreamFinished: {
                const parsed = parseInt(text.trim());
                if (!isNaN(parsed)) {
                    root.temperature = parsed;
                } else {
                    console.warn("BrightnessService: unexpected temperature output:", text);
                }
            }
        }
        stderr: StdioCollector {
            onStreamFinished: {
                if (text.trim().length > 0) {
                    console.warn("BrightnessService: temperature read stderr:", text);
                }
            }
        }
        onExited: (exitCode, exitStatus) => {
            if (exitCode !== 0) {
                console.warn("BrightnessService: temperature read failed, exit code", exitCode);
            }
        }
    }

    Process {
        id: setTemperatureProc
        property int value
        command: ["hyprctl", "hyprsunset", "temperature", String(value)]
        stderr: StdioCollector {
            onStreamFinished: {
                if (text.trim().length > 0) {
                    console.warn("BrightnessService: set temperature stderr:", text);
                }
            }
        }
        onExited: (exitCode, exitStatus) => {
            if (exitCode !== 0) {
                console.warn("BrightnessService: set temperature failed, exit code", exitCode);
            }
            root.update();
        }
    }
}
