import QtQuick 2.0
import MythTv 1.0
import QtQuick.Window 2.0
import QtQuick.XmlListModel 2.0
Rectangle{
    id: roottangle
    width: Screen.width
    height: Screen.height
    BorderImage{
        width: parent.width / 3
        height:   parent.height
        source: "images/shared/HomeBladeLeftMenuOverlay.png"
    }
    ListView{
        width: Screen.width / 3
        height: Screen.height
        clip: true
        cacheBuffer: 1000
//        keyNavigationWraps: true
//        highlight: Rectangle { color: Qt.lighter("#22C7C7C7",1.5); radius: 5 }
//        highlightFollowsCurrentItem: true
        spacing: 1
        model: menuModel
        focus: true
        delegate: Item{
            width: Screen.width / 3
            height: na.name === "" ? 0 :  Screen.height / 10
            MythButton {
                id: na
                borderWidth: 2
                borderColor: "#44FFFFFF"
                visible: name === "" ? false :  true
                color: "#22C7C7C7"
                namepxSize: 33
                name: value
                nameColor: "white"
                nameBold: true
                nameEffect: Text.Sunken
                nameEffectColor: "blue"
                width: Screen.width / 3
                height: name === "" ? 0 :  Screen.height / 10
                onButtonClick: {
                    na.color = "#44C700SS"
                }
            }
        }
    }

    XmlListModel{
        id: menuModel
        source:"https://code.google.com/p/mythmediastream/source/browse/MythMediaStream/menu-ui.xml"
//            "https://raw.github.com/MythTV-Themes/TintedGlass/master/menu-ui.xml"
//        source: "https://raw.github.com/MythTV/mythtv/master/mythtv/themes/Terra/menu-ui.xml"
//        source: "https://raw.github.com/MythTV-Themes/LCARS/master/menu-ui.xml"
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

