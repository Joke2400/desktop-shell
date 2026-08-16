pragma ComponentBehavior: Bound
import qs.services
import qs.config.style

import QtQuick

PathView {
    id: root

    property string monitorOutStr: ""

    implicitWidth: Constant.carouselViewWidth + Constant.carouselItemWidth * 2
    implicitHeight: Constant.carouselViewHeight
    anchors.centerIn: parent
    focus: true

    model: WallpaperService.model
    pathItemCount: Constant.carouselItemCount + 2
    snapMode: PathView.SnapToItem
    preferredHighlightBegin: {
        if (Constant.carouselItemCount % 2 === 0) {
            return (Constant.carouselItemWidth * 2.5) / root.width;
        } else
            return 0.5;
    }

    preferredHighlightEnd: {
        if (Constant.carouselItemCount % 2 === 0) {
            return (Constant.carouselItemWidth * 2.5) / root.width;
        } else
            return 0.5;
    }
    highlightRangeMode: PathView.StrictlyEnforceRange
    highlightMoveDuration: 300

    path: Path {
        startX: 0
        startY: root.height / 2
        PathLine {
            x: root.width
            y: root.height / 2
        }
    }

    delegate: WallpaperItem {
        monitorOutStr: root.monitorOutStr
        isCurrentItem: PathView.isCurrentItem
    }

    Keys.onPressed: event => {
        if (event.isAutoRepeat)
            return;
        if (event.key === Qt.Key_Left) {
            const inx = root.currentIndex - 1;
            root.currentIndex = inx < 0 ? root.model.count - 1 : inx;
            event.accepted = true;
        } else if (event.key === Qt.Key_Right) {
            const inx = root.currentIndex + 1;
            root.currentIndex = inx > root.model.count - 1 ? 0 : inx;
            event.accepted = true;
        } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
            const currentWallpaperItem = root.currentItem as WallpaperItem;
            if (currentWallpaperItem) {
                currentWallpaperItem.action();
            }
            event.accepted = true;
        }
    }
}
