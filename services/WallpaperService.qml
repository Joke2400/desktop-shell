pragma Singleton
import qs.services
import qs.config.style
import qs.config.settings

import QtQuick
import Quickshell
import Quickshell.Io
import Qt.labs.folderlistmodel

Singleton {
    id: root

    property alias model: folderModel

    readonly property real preloadImageHeight: Constant.carouselViewHeight
    readonly property real preloadImageWidth: MonitorService.selectedMonitor.width / Constant.carouselItemCount

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
            //onStatusChanged: if (status === Image.Ready)
            //    console.log("Preloaded image:", fileUrl, "w/h", image.width, image.height)
        }
    }

    Process {
        id: setWallpaperProc
        property string configStr
        command: ["hyprctl", "hyprpaper", "wallpaper", String(configStr)]
    }
}
