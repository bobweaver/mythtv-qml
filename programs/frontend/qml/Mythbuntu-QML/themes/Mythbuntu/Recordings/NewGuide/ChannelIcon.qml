import QtQuick 2.0
import MythTv 1.0
import QtQuick.LocalStorage 2.0
Item {
    property string path
    property bool isSelected
    Image {
        id: logo
        anchors.fill: parent
        anchors.topMargin: 1
        anchors.bottomMargin: 1
        source:DataBase.ipAddress()+":"+DataBase.port()+IconURL
        sourceSize.width: 200
        sourceSize.height: 78
        width: sourceSize.width
        height: sourceSize.height
        opacity: (isSelected) ? 1.0 : 0.0
        asynchronous: true
    }

    Rectangle {
        anchors.fill: unselectedLogo
        color: Qt.darker(Util.darkAubergine)
        opacity: (!isSelected) ? 1.0 : 0.0
    }

    Image {
        id: unselectedLogo
        anchors.fill: parent
        anchors.topMargin: 1
        anchors.bottomMargin: 1
        source: DataBase.ipAddress()+":"+DataBase.port()+IconURL
        sourceSize.width: 200
        sourceSize.height: 78
        width: sourceSize.width
        height: sourceSize.height
        opacity: (!isSelected) ? 0.5 : 0.0
        asynchronous: true
    }
}
