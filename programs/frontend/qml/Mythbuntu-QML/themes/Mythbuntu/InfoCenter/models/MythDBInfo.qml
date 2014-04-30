import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import MythTv 1.0
        Rectangle{
            width:  parent.width
            height: parent.height
            color: "transparent"
            ListView{
                model: databaseInfo
                delegate: Item{
                    width: root.width
                    height: root.height
                    Column{
                        width:  root.width
                        height: root.height
                        spacing: 4
                    Rectangle{
                        id: hostRec
                        width:  root.width
                        height: root.height / 10
                        color: "#64C7C7C7"
                    Text {
                        id: hostTxt
                        font.pixelSize: 42
                        color: "lightblue"
                        text:"DataBase Host: \t "+ Host
                    anchors.centerIn: hostRec
                    }
                }
                    Rectangle{
                        id: pingRec
                        width:  root.width
                        height: root.height / 10
                        color: "#64C7C7C7"
                    Text {
                        id: pingTxt
                        font.pixelSize: 42
                        color: "lightblue"
                        text:"Ping: \t "+ Ping
                    anchors.centerIn: pingRec
                    }
                }
                    Rectangle{
                        id: portRec
                        width:  root.width
                        height: root.height / 10
                        color: "#64C7C7C7"
                    Text {
                        id: portTxt
                        font.pixelSize: 42
                        color: "lightblue"
                        text:"DataBase Port: \t "+ Port
                    anchors.centerIn: portRec
                    }
                }
                    Rectangle{
                        id: nameRec
                        width:  root.width
                        height: root.height / 10
                        color: "#64C7C7C7"
                    Text {
                        id: nameTxt
                        font.pixelSize: 42
                        color: "lightblue"
                        text:"DataBase Name: \t "+ Name
                    anchors.centerIn: nameRec
                    }
                }
                    Rectangle{
                        id: typeRec
                        width:  root.width
                        height: root.height / 10
                        color: "#64C7C7C7"
                    Text {
                        id: typeTxt
                        font.pixelSize: 42
                        color: "lightblue"
                        text:"DataBase Type: \t "+ Type
                    anchors.centerIn: typeRec
                    }
                }
                    }
                }
            }
            XmlListModel{
                id: databaseInfo
                source: DataBase.ipAddress() + ":"+ DataBase.port() +"/Myth/GetConnectionInfo"
                query: "//ConnectionInfo/Database"
                XmlRole{name: "Host"; query: "Host/string()"  }
                XmlRole{name: "Ping"; query: "Ping/string()"  }
                XmlRole{name: "Port"; query: "Port/string()"  }
                XmlRole{name: "Name"; query: "Name/string()"  }
                XmlRole{name: "Type"; query: "Type/string()"  }

            }
}
