import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import MythTv 1.0
Image {
    id: background
    source: "../background.png"
    width:  parent.width
    height: parent.height
    Rectangle{
        id: root
        width:  parent.width
        height: parent.height
        color: "transparent"
        ListView{
            model: databaseInfo


            delegate: Item{
                width: root.width
                height: root.height
                Text {
                id: header
                font.pixelSize: 64
                color: "white"
                height: 67
                width:  root.width
                text: qsTr("General Settings")
            }
                Column{
                    width:  root.width
                    height: root.height
                    anchors.top: header.bottom
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
                    Rectangle{
                        id: usernameRec
                        width:  root.width
                        height: root.height / 10
                        color: "#64C7C7C7"
                        Text {
                            id: usernameTxt
                            font.pixelSize: 42
                            color: "lightblue"
                            text:"DataBase Username: \t "+ UserName
                            anchors.centerIn: usernameRec
                        }
                    }

                    Rectangle{
                        id: passRec
                        width:  root.width
                        height: root.height / 10
                        color: "#64C7C7C7"
                        Text {
                            id: passTxt
                            font.pixelSize: 42
                            color: "lightblue"
                            text:"DataBase Password: \t "+ Password
                            anchors.centerIn: passRec
                        }
                    }

                    Rectangle{
                        id: lenabledRec
                        width:  root.width
                        height: root.height / 10
                        color: "#64C7C7C7"
                        Text {
                            id: lenabledTxt
                            font.pixelSize: 42
                            color: "lightblue"
                            text:"DataBase Type: \t "+ LocalEnabled
                            anchors.centerIn: lenabledRec
                        }
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
        XmlRole{name: "UserName"; query: "UserName/string()"  }
        XmlRole{name: "Password"; query: "Password/string()"  }
        XmlRole{name: "LocalEnabled"; query: "LocalEnabled/string()"  }


    }
}
