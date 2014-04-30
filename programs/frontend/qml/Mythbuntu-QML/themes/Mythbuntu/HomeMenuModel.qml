import QtQuick 2.0
ListModel {
    ListElement {
         text: "Media Libray"
        loaderSource:"MediaLib.qml"
        waterMark: "watermark/dvd.png"
     }
     ListElement {
         text: "Manage Recordings"
        loaderSource: "RecordingS.qml"
        waterMark: "watermark/tv_searchlistings.png"

     }
     ListElement {
         text:"Information Center"
        loaderSource: "InfoCenter.qml"
        waterMark: "watermark/search_new_titles.png"

     }
     ListElement {
         text: "Optical Disks"
         loaderSource: "Guide/EPG.qml"
         waterMark: "watermark/dvd.png"

     }
     ListElement {
         text:"Watch TV"
         loaderSource: "WatchTV.qml"
         waterMark: "watermark/tv.png"

     }
     ListElement {
         text:"Setup"
        loaderSource:   "Settings.qml"
        waterMark: "watermark/settings.png"

     }
     ListElement {
         text:"Weather"
        loaderSource: "../../plugins/Weather/Main.qml"
        waterMark: "watermark/tweak.png"

     }
     ListElement {
         text:"Remote"
        loaderSource: "remote/RemoteMouse.qml"
        waterMark: "watermark/tv.png"

     }
}
