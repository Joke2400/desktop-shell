pragma Singleton
pragma ComponentBehavior: Bound
import qs.config.style
import qs.config.settings

import QtQuick
import Quickshell
import Quickshell.Io
import Qt.labs.folderlistmodel

Singleton {
    id: root

    property alias model: folderModel

    // This crap is too complicated to read, TODO: simplify the PathView's sizing logic
    readonly property real preloadImageHeight: Constant.carouselViewHeight - Constant.borderLarge * 2
    readonly property real preloadImageWidth: ((Constant.carouselViewWidth + Constant.carouselItemWidth * 2) / (Constant.carouselItemCount + 2)) - Constant.borderLarge * 2

    function setWallpaper(monitorOutStr, fileUrl) {
        setWallpaperProc.configStr = `${monitorOutStr}, ${fileUrl.replace(/^file:\/\//, '')}, cover`;
        console.log("Setting wallpaper with string: '" + setWallpaperProc.configStr + "'");
        setWallpaperProc.running = true;
    }

    FolderListModel {
        id: folderModel
        folder: Settings.wallpaperDirPath
        nameFilters: ["*.png", "*.jpg"]
        showDirs: false
        sortField: FolderListModel.Name
    }

    Instantiator {
        model: folderModel
        asynchronous: true
        delegate: Image {
            id: image
            required property string fileUrl

            cache: true
            asynchronous: true
            source: fileUrl
            fillMode: Image.PreserveAspectCrop
            visible: false

            sourceSize.width: root.preloadImageWidth
            sourceSize.height: root.preloadImageHeight

            //onStatusChanged: if (status === Image.Ready)
            //    console.log("Preloaded image:", fileUrl, "w/h", image.width, image.height, sourceSize.width, sourceSize.height)
        }
    }

    Process {
        id: setWallpaperProc
        property string configStr
        command: ["hyprctl", "hyprpaper", "wallpaper", String(configStr)]
    }
}
