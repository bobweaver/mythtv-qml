import QtQuick 2.0
import QtWebKit 3.0
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 0.1
import MythTv 1.0
Rectangle {
    id: rootTangle
    color: "#66000000"
    width: parent.width
    height: parent.height
    WebView{
        id: huluWeb
        width: rootTangle.width
        height: rootTangle.height
        url: DataBase.ipAddress()+"/mythweb"
//        smooth: true
    }
}


