import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.Particles 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Window 2.0
import MythTv 1.0
//import "../common"
//import "../common/dbUtil.js" as DataBase
//import "../common/Util.js" as Util
Rectangle{
    id: root
    width: Screen.width - 10
    height: Screen.height - 10
    color: "transparent"
    Column{
        width: parent.width
        height: parent.height
        spacing: height  / 50
        ThemeButton{
            id: sdkTheme
            buttonWidth:  parent.width / 4
            buttonHeight:  parent.height / 8
            name: "UbuntuSDK"
        }

        ThemeButton{
            id: mythubuntuTheme
            buttonWidth:  parent.width / 4
            buttonHeight:  parent.height / 8
            name: "MythUbuntu"

        }
        ThemeButton{
            id: mythMediaStreamTheme
            buttonWidth:  parent.width / 4
            buttonHeight:  parent.height / 8
            name: "MythMediaStream"
        }
    }
    Loader{
        id: themeLoader
        width: parent.width ;
        height: parent.height
        source: "UbuntuSDK.qml"
        onLoaded: {
            sdkTheme.opacity = 0
            mythubuntuTheme.opacity = 0
        }
    }

    Text {
        id:maxWidth
        text: Screen.width
        color:"transparent"
    }
    Text {
        id: maxHeight
        text: Screen.height
        color: "transparent"
    }
}
