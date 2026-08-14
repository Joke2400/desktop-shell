import qs.services
import qs.config.style
import qs.config.settings
import QtQuick

PathView {
    id: root

    implicitWidth: Constant.carouselWidth + Constant.carouselItemWidth * 2
    implicitHeight: Constant.carouselHeight

    x: switcherContainer.x - Constant.carouselItemWidth

    anchors.centerIn: parent

    model: WallpaperService.model
    pathItemCount: Settings.carouselItemCount + 2
    cacheItemCount: 4
    snapMode: PathView.SnapToItem
    preferredHighlightBegin: 0.5
    preferredHighlightEnd: 0.5
    highlightRangeMode: PathView.StrictlyEnforceRange
    highlightMoveDuration: 50

    path: Path {
        startX: 0
        startY: root.height / 2
        PathLine {
            x: root.width
            y: root.height / 2
        }
    }

    delegate: WallpaperItem {}

    onCurrentIndexChanged: {
        console.log("Current index changed:", root.currentIndex);
    }
}
