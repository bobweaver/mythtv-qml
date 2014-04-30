import QtQuick 2.0
import "common"
import MythTv 1.0
import "InfoCenter"
Image {
    id: mediaLibRoot
    width:parent.width
    height: parent.height
    source: "background.png"
    BorderImage {
        id: watermark
        source: "watermark/settings.png"
        anchors.fill:mediaLibRoot
        width: parent.width
        height: parent.height
    }
    Flickable{
        width: parent.width
        height: parent.height
        flickableDirection: Flickable.VerticalFlick
        contentHeight:  mediaLibRoot.height
        Column{
            spacing:2
            width: parent.width
            height: parent.height /1.2
            y: parent.height  / 6

            MButton{
                id: mediaLib
                buttonHeight: focus === true ? parent.height / 7.7 : parent.height / 8
                buttonWidth: focus === true ? parent.width : parent.width / 1.7
                name: "System Status "
                MouseArea{anchors.fill: mediaLib
                    onClicked: {
                        infoLoader.source = "InfoCenter/Info.qml"
                        infoLoader.opacity = 1
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
        id: infoLoader
        anchors.fill: parent
        source: ""
        opacity:  0
        Behavior on opacity {
            NumberAnimation {
                target: infoLoader
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
        iconSource: "../../artwork/mythbuntu.png"
        backButtonsmooth: false
        MouseArea{
            anchors.fill: backaroo
            onClicked:{
                infoLoader.source = "StartHere.qml"
                infoLoader.opacity = 1
                pageLoader.source = ""

                pageLoader.opacity = 0
                mediaLibRoot.opacity = 0
            }
        }
    }
}
