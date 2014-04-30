import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import MythTv 1.0
Rectangle{
    id: root
    property string backgroundColor: root.color
    width:  parent.width
    height: parent.height
    color:  backgroundColor
    ListView{
        width:  parent.width
        height: parent.height
        model: mythfillStart
        delegate: Item{
            width: root.width
            height:    root.height
            Text {
                id: mythfillstartTxt
                font.pixelSize: 42
                color: "white"
                text: Value
            }
        }

    XmlListModel{
        id: mythfillStart
//        namespaceDeclarations: "declare default element namespace 'http://www.w3.org/2001/XMLSchema-instance';" ;
        source: DataBase.ipAddress()+":"+DataBase.port()+"/Myth/GetSetting/"
        query: "//*"
        XmlRole{name: "Value"; query: "Value/string()" }
        onStatusChanged: {
            if (status === XmlListModel.Loading)
                console.log("Loading")
            if (status === XmlListModel.Ready)
                console.log("Ready")
            if (status === XmlListModel.Error)
                console.log(errorString())
        }
    }
}
}
