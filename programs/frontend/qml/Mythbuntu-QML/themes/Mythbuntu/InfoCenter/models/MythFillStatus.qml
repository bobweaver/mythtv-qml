import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import MythTv 1.0
Rectangle{
    id:root
    width:  parent.width
    height: parent.height / 10
    color: "purple"
    ListView{
        model: mythfillStatus
        delegate: Item{
            width: root.width
            height:    root.height
            Text {
                id: mythfillstopStatus
                font.pixelSize: 42
                color: "white"
                text: "Finshed:   "+ lastFillStatus
            }
        }
    }
    XmlListModel{
        id: mythfillStatus
        namespaceDeclarations: "declare default element namespace 'http://www.w3.org/2001/XMLSchema-instance';"
        source:   DataBase.ipAddress()+":"+DataBase.port() +"/Myth/GetSetting?Key=mythfilldatabaseLastRunStatus"
        query: "//SettingList/HostName/Settings/String"
        XmlRole{name: "lastFillStatus"; query: "Value/string()" }
        onStatusChanged: {
            if (status === XmlListModel.Loading)
                console.log("Loading")
            if (status === XmlListModel.Ready)
                console.log("Redy")
            if (status === XmlListModel.Error)
                console.log(errorString())
        }
    }
}
