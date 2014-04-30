import QtQuick 2.0
import "../common"
import MythTv 1.0

Image {
    id: mediaLibRoot
width:parent.width
height: parent.height
source: "artwork/background.png"
BorderImage {
    id: watermark
    source: "artwork/watermark/dvd.png"
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
            id: playDisk
            buttonHeight: focus === true ? parent.height / 7.7 : parent.height / 8
            buttonWidth: focus === true ? parent.width : parent.width / 1.7
            name: "Play Disk"
            MouseArea{anchors.fill: playDisk
                onClicked: {console.log("Hello ")
                }
            }
        }
        MButton{
            id: importCd
            buttonHeight: focus === true ? parent.height / 7.7 : parent.height / 8
            buttonWidth: focus === true ? parent.width : parent.width / 1.7
            name: "Import Disk"
            MouseArea{anchors.fill: importCd
                onClicked: {console.log("Hello ")
                }
            }
        }
        MButton{
            id: eject
            buttonHeight: focus === true ? parent.height / 7.7 : parent.height / 8
            buttonWidth: focus === true ? parent.width : parent.width / 1.7
            name: "Eject Disk"
            MouseArea{anchors.fill: eject
                onClicked: {console.log("Hello ")
                }
            }
        }
    }
}
Text {
    id: time
    color: "grey"
    text: Qt.formatDateTime(new Date(),"ddd MMMM d yyyy , hh,mm ap")
    font.pixelSize:  parent.width / 30
    anchors{
        bottom:parent.bottom
        bottomMargin: bkgRoot.height / 20
        right: parent.right
        rightMargin: 12
    }
}
BackButton{
 id: backaroo
 backButtonWidth: parent.width / 6
 backButtionHeight:  parent.width / 6
 iconSource: "artwork/leftarrow.png"
 backButtonsmooth: false
MouseArea{
 anchors.fill: backaroo
 onClicked:{
     pageLoader.source = ""
     pageLoader.opacity = 0
    mediaLibRoot.opacity = 0
 }
}
}

}





