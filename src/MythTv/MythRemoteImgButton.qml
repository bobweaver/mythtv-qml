import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import  ZeroConf 1.0
import QtQuick.Window 2.0
import QtQuick.XmlListModel 2.0
import "Util.js" as Util
import  "dbUtil.js" as DataBase
import  "Remote.js" as Remote
Item {
    id: remoteRoot
    width: Screen.width
    height: Screen.height
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string backgroundImage: remoteBackground.source
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int buttonRadius: remoteButton.radius
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property variant buttonColor
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property variant nameColor
    Image{
        id: remoteBackground
        width: parent.width
        height: parent.height
        source: backgroundImage
        anchors{
            centerIn: parent
        }
        Rectangle{
            id: remoteLed
            radius: 180
            width: remoteRoot.width / 30
            height:    remoteRoot.width / 30
            color: "#44000000"
            Behavior on color{ColorAnimation { from: "red"; to: "#44000000"; duration: 1200; easing.type: Easing.InOutQuad}}
            border.color: "#55000000"
            border.width: 1
            anchors{
                horizontalCenter: parent.horizontalCenter
            }
        }
        GridView{
            width: Screen.width
            height: Screen.height
            cellWidth: Math.round(width / 13)
            cellHeight: Math.round(height / 10 )
            cacheBuffer: 1000
            anchors.centerIn: parent
            model: actionsModel
            delegate: Item{
                width: 120
                height: 120
                Text{
                    id:marker
                    color: "transparent"
                    text: value
                }
                MythButton{
                    id: remoteButton
                    width:   Math.round(Screen.width / 20 )
                    height:  Math.round( Screen.width / 20)
                    namepxSize: height / 4
                    radius:buttonRadius
                    buttonColor:  buttonColor
                    borderColor: borderColor
                    borderWidth: borderWidth
                    name: {
                        function convertKeys(){
                            var mName  = key.toLowerCase()
                            return mName
                        }
                        convertKeys();
                        }
                    anchors{centerIn: parent}
                    onButtonClick: {
                        remoteLed.color = "red"
                        var q = Util.zeroConf(frontend.getFrontendString())+":6547/Frontend/SendAction?Action=" + key
                        Remote.sendAction(q)
                    }
                }
            }
        }
    }
//    BonjourFrontend{
//        id:frontend
//    }
    XmlListModel{
        id: actionsModel
        source: Util.zeroConf(frontend.getFrontendString())+":6547/Frontend/GetActionList"
        query: "/FrontendActionList/ActionList/Action"
        XmlRole{name:"key"; query: "Key/string()"}
        XmlRole{name: "value"; query: "Value/string()"}
        onStatusChanged: {
            if(status === XmlListModel.Loading){
                console.log("Loading" + count)
                console.log(source)
            }
            if(status === XmlListModel.Ready){
                console.log("loaded " + count)
            }
            if(status === XmlListModel.Error){
                console.log("ERRR ")
                actionsModel.source = Util.zeroConf(frontend.getFrontendString())+":6547/Frontend/GetActionList"
                reload()
            }
        }
    }
}

