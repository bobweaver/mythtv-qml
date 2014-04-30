import QtQuick 2.0
import QtQuick.Window 2.0
import "common"
import "MediaLibs"
import MythTv 1.0
Item{
    id:rootMediaLib
    width:Screen.width
    height: Screen.height
//    color: "#00000000"
    Image {
        id: mediaLibRoot
        width:parent.width
        height: parent.height
        source: "background.png"
        BorderImage {
            id: watermark
            source: "watermark/tv_schedule.png"
            anchors.fill:mediaLibRoot
            width: parent.width
            height: parent.height
        }
        ListView{
            height:  Screen.height /1.2
            y: parent.height  / 6
            x: parent.width / 20
            width: Screen.width
            keyNavigationWraps: true
            focus: true
            spacing: 14
            cacheBuffer: 1000
            flickableDirection: Flickable.VerticalFlick
            model: MediaLibMenuModel{}
            delegate: Item{
                width: Screen.height / 8
                height: Screen.height / 9
                MythButton{
                    id: mediaLib
                    height:Screen.height / 9
                    width: Screen.width / 1.7
                    name: text
                    buttonColor: "#44FFFFFF"
                    nameColor: "white"
                    nameItalic: false
                    nameBold: false
                    nameEffect: Text.Raised
                    nameEffectColor: "grey"
                    namepxSize:  Math.round(height / 1.7)
                    radius: 80
                    onButtonClick:{
                        mediaPageLoader.opacity = 1
                        mediaPageLoader.source = loaderSource

                    }
                    onStateChanged: {
                        if (state === "hovered"){
                            buttonColor = Qt.darker(buttonColor,1.2)
                            scale = 1.1
                            watermark.source = waterMark
                        }
                        if (state === "exited"){
                            buttonColor = "#44FFFFFF"
                            scale = 1
                            watermark.source = waterMark
                        }
                    }
                }
            }
        }





        Text {
            id: time
            color: "grey"
            text: Qt.formatDateTime(new Date(),"ddd MMMM d yyyy , hh:mm ap")
            font.pixelSize:  parent.width / 30
            anchors{
                bottom:parent.bottom
                bottomMargin: bkgRoot.height / 20
                right: parent.right
                rightMargin: 12
            }
        }
        Loader{
            id: mediaPageLoader
            anchors.fill: parent
            source: ""
            opacity:  0
            Behavior on opacity {
                NumberAnimation {
                    target: mediaPageLoader
                    property: "scale"
                    from:0
                    to:1
                    duration: 1800
                    easing.type: Easing.OutBounce
                }
            }
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
                    pageLoader.source = ""
                    pageLoader.opacity = 0
                    mediaLibRoot.destroy()
                }
            }
        }
    }
}
