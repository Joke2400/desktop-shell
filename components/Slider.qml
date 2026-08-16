import qs.config.style

import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Rectangle {
    id: root

    property real ratio
    property real ratioMin: 0
    property real ratioMax: 1

    property real liveRatio: ratio
    onRatioChanged: {
        if (!dragHandler.active && !tap.pressed) {
            liveRatio = ratio;   // resync from parent when not interacting
        }
    }

    readonly property real ratioVisual: (liveRatio - ratioMin) / (root.ratioMax - ratioMin)

    signal applied(real ratio)

    color: Color.baseLight
    border.color: Color.surfaceDark

    radius: Constant.roundingMedium
    Layout.fillWidth: true
    Layout.preferredHeight: parent.height

    Rectangle {
        anchors.fill: parent
        radius: parent.radius
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: Qt.rgba(1, 1, 1, 0.07)
            }
            GradientStop {
                position: 0.1
                color: Qt.rgba(1, 1, 1, 0.05)
            }
            GradientStop {
                position: 0.4
                color: Qt.rgba(0, 0, 0, 0.0)
            }
            GradientStop {
                position: 0.7
                color: Qt.rgba(0, 0, 0, 0.05)
            }
            GradientStop {
                position: 1.0
                color: Qt.rgba(0, 0, 0, 0.05)
            }
        }
    }

    WheelHandler {
        id: wheel
        acceptedDevices: PointerDevice.AllDevices
        property real step: 0.05
        onWheel: event => {
            root.calculateScrollRatio(event, wheel.step);
            root.applied(root.liveRatio);
        }
    }

    TapHandler {
        id: tap
        acceptedButtons: Qt.LeftButton
        onPressedChanged: {
            if (pressed) {
                const pos = track.mapFromItem(root, point.position.x, point.position.y);
                const usableWidth = track.width - Constant.sliderHandleSize;
                const visualFraction = Math.max(0, Math.min(1, (pos.x - Constant.sliderHandleSize / 2) / usableWidth));
                root.liveRatio = root.ratioMin + visualFraction * (root.ratioMax - root.ratioMin);
                dragHandler.startRatio = root.liveRatio;
                root.applied(root.liveRatio);
            }
        }
    }

    DragHandler {
        id: dragHandler
        target: null
        property real startRatio: 0
        dragThreshold: 0

        onActiveChanged: {
            if (active) {
                startRatio = root.liveRatio;
            } else {
                root.applied(root.liveRatio);
            }
        }

        onTranslationChanged: () => root.calculateDragRatio(startRatio, translation.x)
    }

    function calculateScrollRatio(event, step) {
        const delta = event.angleDelta.y > 0 ? step : -step;
        root.liveRatio = Math.max(root.ratioMin, Math.min(root.ratioMax, root.liveRatio + delta)).toFixed(2);
    }

    function calculateDragRatio(startRatio, translationX) {
        const usableWidth = track.width - Constant.sliderHandleSize;
        const visualDelta = translationX / usableWidth;
        let newRatio = startRatio + visualDelta * (root.ratioMax - root.ratioMin);
        root.liveRatio = Math.max(root.ratioMin, Math.min(root.ratioMax, newRatio)).toFixed(2);
    }

    TextMetrics {
        id: textElementMaxWidthMetric
        font.family: Theme.fontFamily
        font.pixelSize: textElement.font.pixelSize
        font.bold: true
        text: "100%"
    }

    RowLayout {
        anchors.fill: parent
        Layout.fillWidth: true
        spacing: 0

        Item {
            Layout.fillWidth: true
            Layout.leftMargin: Constant.marginMedium
            Layout.rightMargin: Constant.marginSmall

            Rectangle { // track
                id: track
                color: Color.surfaceNormal

                anchors.centerIn: parent
                width: parent.width
                height: Constant.sliderTrackSize
                radius: Constant.roundingSmall
            }
            Rectangle { // fill
                color: Color.overlayNormal

                anchors.left: track.left
                anchors.verticalCenter: parent.verticalCenter
                width: track.width * root.ratioVisual
                height: Constant.sliderTrackSize
                radius: Constant.roundingSmall
            }
            Rectangle { // handle
                id: handle
                color: dragHandler.active ? Color.colOrange : (hoverHandler.hovered ? Color.accentLight : Color.accentNormal)
                anchors.verticalCenter: parent.verticalCenter
                x: track.x + root.ratioVisual * (track.width - width)
                width: Constant.sliderHandleSize
                height: Constant.sliderHandleSize
                radius: Constant.roundingMedium

                HoverHandler {
                    id: hoverHandler
                }
            }
        }

        Text {
            id: textElement

            Layout.preferredWidth: textElementMaxWidthMetric.advanceWidth
            Layout.rightMargin: Constant.marginMedium
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font {
                family: Theme.fontFamily
                pixelSize: Constant.fontSizeHuge
                bold: true
            }
            color: Color.textNormal
            text: (root.liveRatio * 100).toFixed(0) + "%"
        }
    }
}
