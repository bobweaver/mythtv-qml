import QtQuick 2.0
import MythTv 1.0
import QtQuick.Window 2.0
import QtQuick.XmlListModel 2.0
Image{
    id: roottangle
    width: Screen.width
    height: Screen.height
    source:  "images/backgrounds/background.png"
    Rectangle{
        id:sliderRec
        color: "#77000000"
        width: Screen.width + 30
        height: Screen.height / 10
        border.color: "#66FFFFFF"
        border.width: 2
        x: -10
        y: Screen.height / 1.5
        ListView{
            width: Screen.width
            height: Screen.height / 10
            orientation: ListView.Horizontal
            clip: true
            cacheBuffer: 1000
            spacing: 1
            model: menuModel
            focus: true
            delegate: Item{
                width: na.name === "" ? 0 :  Screen.width / 6
                height: Screen.height / 10
                MythButton {
                    id: na
                    visible: name === "" ? false :  true
                    color: "#22000000"
                    namepxSize: 33
                    name: value
                    nameColor: "#88FFFFFF"
                    nameEffect: Text.Sunken
                    nameWraping: Text.WrapAnywhere
                    nameEffectColor: "grey"
                    width: name === "" ? 0 :  Screen.width / 6
                    height:  Screen.height / 10
                    onButtonClick: {
                        na.nameColor = "yellow"
                    }
                }
            }
        }
    }
    Rectangle{
        id:timeRec
        color: "#88000000"
        border.color: "#88FFFFFF"
        border.width: 2
        radius: 20
        width: Screen.width / 5
        height:  Screen.height / 14
        anchors{
         horizontalCenter: parent.horizontalCenter
         bottom: parent.bottom
         bottomMargin: -width / 12
    }
    Text {
        id: time
        color: "white"
        font.bold: true
        text: Qt.formatDateTime(new Date(),"ddd MMMM d yyyy , hh:mm ap")
        font.pixelSize:  parent.height / 6
        anchors{
        centerIn: timeRec
        }
    }
}
    XmlListModel{
        id: menuModel
        source:"https://raw.github.com/MythTV-Themes/TintedGlass/master/menu-ui.xml"
        query: "//mythuitheme/window/statetype/state"
        XmlRole{name: "value"; query: "textarea/value/string()"}
        onStatusChanged: {
            if (status === XmlListModel.Ready){
                console.log(get(0).menuName)
            }
            if (status === XmlListModel.Loading){console.log("loading")}
            if (status === XmlListModel.Error){console.log(errorString())}
        }
    }
}
