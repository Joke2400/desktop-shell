import qs.components
import qs.services
import qs.config.style
import QtQuick

PathView {
    id: root

    anchors.fill: parent
    model: WallpaperService.model
    pathItemCount: 7
    snapMode: PathView.SnapToItem
    preferredHighlightBegin: 0.5
    preferredHighlightEnd: 0.5
    highlightRangeMode: PathView.StrictlyEnforceRange
    highlightMoveDuration: 200

    path: Path {
        startX: 0
        startY: root.height / 2
        PathLine {
            x: root.width
            y: root.height / 2
        }
    }

    delegate: WallpaperItem {}

    Instantiator {
        model: root.model

        delegate: Image {
            source: fileUrl
            visible: false
            asynchronous: true

            sourceSize.width: Math.min(root.height, root.width / root.pathItemCount)
            sourceSize.height: root.height
        }
    }

    onCurrentIndexChanged: {
        console.log("Current index changed:", root.currentIndex);
    }
}
