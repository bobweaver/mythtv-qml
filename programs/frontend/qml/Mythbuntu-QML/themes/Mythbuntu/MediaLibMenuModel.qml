import QtQuick 2.0
ListModel {
    ListElement {
        markerId: "setup"
        text: "Watch Recordings"
        loaderSource:"common/RecordedS.qml"
        waterMark: "watermark/tweak.png"
        navUp: "media"
        navDown: "general"
    }
     ListElement {
         markerId: "general"
         text: "Watch Videos"
        loaderSource: "MediaLibs/MediaLoaders.qml"
        waterMark: "watermark/settings.png"
        navUp: "setup"
        navDown: "theme"
     }
   }
