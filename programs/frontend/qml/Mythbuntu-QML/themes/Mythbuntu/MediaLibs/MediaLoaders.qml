import QtQuick 2.0
import  QtQuick.Window 2.0
import MythTv 1.0
Item {
    width: Screen.width
    height: Screen.height
    Item{
        //    property string loaderSource:  mediaLibLoader.source
        width: Screen.width
        height: Screen.height
        Loader{
            id : mediaLibLoader
            anchors.fill:  parent
            source: "MythbuntuGridViewVideos.qml"
        }
    }
    Rectangle{
        width: Screen.width
        height:    Screen.height
        //      x: Screen.width - width
        color: "transparent"
        MythMediaLibMenu{
            id: settings
            width: Screen.width / 3
            height: Screen.height
            x:  Screen.width
            Behavior on x {NumberAnimation{duration: 1200 ; easing.type: Easing.OutBack}}
            y: 0
            Text {
                id: renderType
                text: qsTr("View")
                color: "white"
                width: parent.width
                wrapMode: Text.WordWrap
                font.pixelSize: 48
                height: 52
            }
            Column{
                anchors.top: renderType.bottom
                width: settings.width
                height:    settings.height / 3
                spacing:    height  / 20
                MythButton{
//                    anchors.centerIn: settings
                    height: Screen.height / 20
                    radius: 80
                    width: settings.width
                    name: "GridView"
                    namepxSize: 24
                    color: "grey"
                    onButtonClick: mediaLibLoader.source  = "MythbuntuGridViewVideos.qml"
                }
                MythButton{
//                    anchors.centerIn: settings
                    height: Screen.height / 20
                    width: settings.width
                    radius: 80
                    name: "CoverFlow"
                    namepxSize: 24
                    color: "grey"
                    onButtonClick: mediaLibLoader.source  = "MythbuntuCoverFlowVideos.qml"
                }
                MythButton{
//                    anchors.centerIn: settings
                    height: Screen.height / 20
                    width: settings.width
                    radius: 80
                    name: "CoverFlow"
                    namepxSize: 24
                    color: "grey"
                    onButtonClick: mediaLibLoader.source  = "MythbuntuPathViewOne.qml"
                }
            Text {
                id: searchOptions
                text: qsTr("Search")
                color: "white"
                anchors.top: Column.bottom
                width: parent.width
                wrapMode: Text.WordWrap
                font.pixelSize: 48
                height: 52
            }
            MythButton{
//                anchors.centerIn: settings
                height: Screen.height / 20
                width: settings.width
                radius: 80
                name: "Search"
                namepxSize: 24
                color: "grey"
                onButtonClick: mediaLibLoader.source  = "MythbuntuCoverFlowVideos.qml"
            }

}

        }



















        MythPictureButton{
            id:settingsButtin
            height: Screen.height / 20
            width: Screen.height / 20
            x: Screen.width - width
            buttonImage: "../../../artwork/mythbuntu.png"
            onButtonClicked: {
                if (settings.x ===  Screen.width  )
                    settings.x =  Screen.width - (settings.width)
                else
                    settings.x =  Screen.width

            }
        }
    }
}
