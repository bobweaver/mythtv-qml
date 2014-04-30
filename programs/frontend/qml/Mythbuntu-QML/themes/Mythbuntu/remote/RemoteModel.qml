import QtQuick 2.0
import QtQuick.XmlListModel 2.0
Item {
    id: actionKeys
    property string souceUrl: actionsModel.source
    XmlListModel{
        id: actionsModel
    source: souceUrl
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
            console.log(XmlListModel.errorString() + count)
        reload()
        }
    }
}
}
