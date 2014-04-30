import QtQuick 2.0
import QtQuick.Window 2.0
import "common"
import MythTv 1.0
Image {
    id: mediaLibRoot
    width:Screen.width
    height: Screen.height
    source: "background.png"
    BorderImage {
        id: watermark
        source: "watermark/settings.png"
        anchors.fill:mediaLibRoot
        width: parent.width
        height: parent.height

        Flickable{
            width: parent.width
            height: parent.height
            flickableDirection: Flickable.VerticalFlick
            contentHeight:  bkgRoot.height

            Column{
                spacing:2
                width: parent.width
                height: parent.height /1.2
                y: parent.height  / 6

                MythButton{
                    id: mediaLib
                    height:parent.height / 8
                    width:  parent.width / 1.7
                    name: "Schedual Recordings"
                 focus: true
                    nameColor: "white"
                    nameItalic: false
                    nameBold: false
                    nameEffect: Text.Raised
                    nameEffectColor: "grey"
                    namepxSize: height / 2
                 Keys.onEnterPressed: {
                     console.log("Enter Was Pressed")
                 }
                    onButtonClick: {
                        settingsPageLoader.opacity = 1
                        settingsPageLoader.source = "Recordings/Guide.qml"
                    }
                }

                MythButton{
                    id:manageRec
                    height: parent.height / 8
                    width: parent.width / 1.7
                    name: "Recording Rules"
                    namepxSize: height / 2
                    nameColor: "white"
                    onButtonClick: {
                    settingsPageLoader.opacity = 1
                    settingsPageLoader.source = "Recordings/RecordingRules.qml"
                }
                }
                MythButton{
                    id: infoCenter
                    height: parent.height / 8
                    width: parent.width / 1.7
                    namepxSize: height / 2
                    name: "Upcoming Recordings"
                    nameColor: "white"
                    onButtonClick: {
                    settingsPageLoader.opacity = 1
                    settingsPageLoader.source = "Recordings/UpandCommingRecordings.qml"
                }
                }
                MythButton{
                    id: cds
                    height: parent.height / 8
                    width: parent.width / 1.7
                    name: "Previously Recored"
                    namepxSize: height / 2
                    nameColor: "white"
                    onButtonClick: {
                    settingsPageLoader.opacity = 1
                    settingsPageLoader.source = "Recordings/PRecored.qml"
                }
                }
                MButton{
                    id:watchTV
                    buttonHeight: parent.height / 8
                    buttonWidth: parent.width / 1.7
                    name: "Set Priorities"

                }
            }
        }
    }
    Text {
        id: time
        color: "grey"
        text: Qt.formatDateTime(new Date(),"ddd MMMM d yyyy , hh : mm ap")
        font.pixelSize:  parent.width / 30
        anchors{
            bottom:parent.bottom
            bottomMargin: bkgRoot.height / 20
            right: parent.right
            rightMargin: 12
        }
    }


    Loader{
        id: settingsPageLoader
        anchors.fill: parent
        source: ""
        opacity:  0
        Behavior on opacity {
            NumberAnimation {
                target: settingsPageLoader
                property: "scale"
                from:0
                to:1
                duration: 1800
                easing.type: Easing.OutQuad
            }
        }
        //                onSourceChanged: reload()
    }
    BackButton{
        id: backaroo
        backButtonWidth: parent.width / 6
        backButtionHeight:  parent.width / 6
        iconSource: "shared/leftarrow.png"
        backButtonsmooth: false
        MouseArea{
            anchors.fill: backaroo
            onClicked:{
                settingsPageLoader.source = "StartHere.qml"
                settingsPageLoader.opacity = 1
                pageLoader.source = ""
                pageLoader.opacity = 0
                mediaLibRoot.opacity = 0
            }
        }
    }
}
