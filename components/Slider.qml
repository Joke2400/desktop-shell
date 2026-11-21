import qs.config.style

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    required property real ratio
    required property int sliderSize
    required property int handleSize
    required property int trackSize
    property int textSize: Constant.textSizeSmall

    property real ratioMin: 0
    property real ratioMax: 1

    property color trackCol: Qt.hsla(Color.surfaceNormal.hslHue, Color.surfaceNormal.hslSaturation, Color.surfaceNormal.hslLightness, 0.9)
    property color handleCol: dragHandler.active ? Color.colOrange : (hoverHandler.hovered ? Color.accentLight : Color.accentNormal)
    property color fillCol: Qt.hsla(Color.overlayDark.hslHue, Color.overlayDark.hslSaturation, Color.overlayDark.hslLightness, 0.9)
    property color textCol: Color.textNormal

    property real liveRatio: ratio
    readonly property real ratioVisual: (liveRatio - ratioMin) / (root.ratioMax - ratioMin)

    signal applied(real ratio)

    onRatioChanged: {
        if (!dragHandler.active && !tap.pressed) {
            liveRatio = ratio;   // resync from parent when not interacting
        }
    }

    color: Color.baseLight
    radius: Constant.roundingLarge

    implicitWidth: parent.width
    implicitHeight: root.sliderSize

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
                const usableWidth = track.width - root.handleSize;
                const visualFraction = Math.max(0, Math.min(1, (pos.x - root.handleSize / 2) / usableWidth));
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

        onTranslationChanged: () => {
            root.calculateDragRatio(startRatio, translation.x)
            if (active) root.applied(root.liveRatio)
        }
    }

    function calculateScrollRatio(event, step) {
        const delta = event.angleDelta.y > 0 ? step : -step;
        root.liveRatio = Math.max(root.ratioMin, Math.min(root.ratioMax, root.liveRatio + delta)).toFixed(2);
    }

    function calculateDragRatio(startRatio, translationX) {
        const usableWidth = track.width - root.handleSize;
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
                color: root.trackCol

                anchors.centerIn: parent
                width: parent.width
                height: root.trackSize
                radius: Constant.roundingSmall
            }
            Rectangle { // fill
                color: root.fillCol

                anchors.left: track.left
                anchors.verticalCenter: parent.verticalCenter
                width: track.width * root.ratioVisual
                height: root.trackSize
                radius: Constant.roundingSmall
            }
            Rectangle { // handle
                id: handle
                color: root.handleCol
                anchors.verticalCenter: parent.verticalCenter
                x: track.x + root.ratioVisual * (track.width - width)
                width: root.handleSize
                height: root.handleSize
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
                pixelSize: root.textSize
                bold: true
            }
            color: root.textCol
            text: (root.liveRatio * 100).toFixed(0) + "%"
        }
    }
}
