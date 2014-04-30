import QtQuick 2.0
import QtQuick.Window 2.0
import MythTv 1.0
import "common"
import "Settings"
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
        model: SettingsMenuModel{}
        delegate:Item{
            width: Screen.height / 8
            height: Screen.height / 9
            MythButton{
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
                Keys.onEnterPressed: {
                    settingsPageLoader.source = loaderSource
                    settingsPageLoader.opacity = 1
                }
                onButtonClick: {
                        settingsPageLoader.source = loaderSource
                        settingsPageLoader.opacity = 1
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
        Component.onCompleted: positionViewAtIndex(count - 1, ListView.Beginning)

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
                easing.type: Easing.OutQuart
            }
        }
      onStatusChanged: {
          if (status === Loader.Ready)
              backaroo.opacity = 0
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
                settingsPageLoader.source = "StartHere.qml"
                settingsPageLoader.opacity = 1
                pageLoader.source = ""
                pageLoader.opacity = 0
                mediaLibRoot.opacity = 0
            }
        }
    }
}
