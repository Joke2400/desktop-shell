pragma ComponentBehavior: Bound
import qs.services
import qs.config.style
import QtQuick

PathView {
    id: root

    property string monitorOutStr: ""

    implicitWidth: Constant.carouselViewWidth + Constant.carouselItemWidth * 2
    implicitHeight: Constant.carouselViewHeight
    x: -Constant.carouselItemWidth

    anchors.centerIn: parent

    model: WallpaperService.model
    pathItemCount: Constant.carouselItemCount + 2
    cacheItemCount: 2
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

    delegate: WallpaperItem {
        monitorOutStr: root.monitorOutStr
    }
}
