import qs.config.style
import qs.components
import qs.services

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Rectangle {
    id: root

    property int volume: AudioService.volume
    property bool muted: AudioService.muted

    color: "transparent"

    implicitWidth: parent.width
    implicitHeight: Math.max(Constant.sliderSize, sliderControls.implicitHeight)

    RowLayout {
        id: sliderControls

        anchors.fill: parent
        spacing: Constant.spacingMedium

        SliderButton {
            buttonIcon: {
                if (root.muted || root.volume === 0) {
                    return "";
                } else if (root.volume < 33) {
                    return "";
                } else if (root.volume < 66) {
                    return "";
                } else {
                    return "";
                }
            }
            tooltipText: "Volume"

            iconColor: root.muted ? Color.colRed : Color.textNormal
            iconColorHover: root.muted ? Color.colMaroon : Color.accentNormal

            onRightClicked: {
                Hyprland.dispatch("exec [float; center; size monitor_w*0.5 monitor_h*0.5] pavucontrol");
            }
            onLeftClicked: () => {
                AudioService.toggleMute();
            }
        }
        Slider {
            id: slider
            ratio: root.volume / 100

            onApplied: ratio => {
                AudioService.setVolume(ratio);
            }
        }
    }
}
