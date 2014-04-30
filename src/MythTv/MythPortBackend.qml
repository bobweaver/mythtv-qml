import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import "dbUtil.js" as DataBase
import "Util.js" as Util
Rectangle {
    id:rootTangle
    width: parent.width
    height: parent.height
    color: "transparent"
    Text {
        id: portEnterAdd
        width:  rootTangle.width - (parent.width / 30 )
        text: qsTr("Please Enter in your Myth TV Port Number")
        color: "white"
        wrapMode: Text.WordWrap
        font.pixelSize: parent.width / 20
        anchors{
            top: parent.top
            topMargin: parent.height / 15
            left: parent.left
            leftMargin: parent.width / 60
        }
    }
    Text {
        id: portEnterAddbottom
        width:  rootTangle.width - (parent.width / 30 )
        text: qsTr("example:  6544")
        color: "white"
        wrapMode: Text.WordWrap
        font.pixelSize: parent.width / 30
        anchors{
            top: portEnterAdd.bottom
            left: parent.left
            leftMargin: parent.width / 60
        }
    }



    MouseArea{
        id: portMouseArea
     anchors.fill: portboxArea
     onClicked: {
             if (portboxEdit.focus === false )
             portboxEdit.focus = true
             else
                 portboxEdit.focus = false
         }
    }
        Rectangle{
            id: portboxArea
            width: rootTangle.width / 2
            height: rootTangle.height / 2.4
            radius: 4
            border.width: 1
            border.color: Qt.darker(color,2)
            color: "white"
            anchors.top: portEnterAddbottom.bottom
            TextInput{
                id: portboxEdit
                text: "6544"
                color: "black"
                font.pixelSize:  parent.width / 16
                cursorVisible:  portboxEdit.focus === true ?   true : false
                anchors{
                    centerIn: portboxArea
                }
                Keys.onEnterPressed:{
                    DataBase.createInitPortTable()
                    DataBase.truncatePort()
                    function insertIntoPortTable() {
                        var db = DataBase.portDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_backend_port VALUES(?, ?)', ['1', text ]);
                                    }
                                    )
                    }
                    insertIntoPortTable()
                    portboxEdit.focus = false
                     console.log("port is  " + DataBase.port())

                }
                onTextChanged:  {
                    DataBase.createInitPortTable()
                    DataBase.truncatePort()
                    function insertIntoPortTable() {
                        var db = DataBase.portDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_backend_port VALUES(?, ?)', ['1', text ]);
                                    }
                                    )
                    }
                    insertIntoPortTable()
                    //                    debugging
                                        console.log("port is  " + DataBase.port())
                }
            }

        }
        MythButton{
            name: "save"
            width: portboxArea.width
            height: rootTangle.height / 3
            namepxSize: height/ 1.7
            anchors{
             topMargin: parent.height / 20
                top: portMouseArea.bottom
            }
            onButtonClick: {
                DataBase.createInitIpAddressTable()
                DataBase.truncateIpAddess()
                function insertIntoTable() {
                    var sd = portboxEdit.text.toString()
                    var db = DataBase.ipDatabase();
                    db.transaction(
                                function(tx) {
                                    tx.executeSql('INSERT INTO mythbuntu_backend_location VALUES(?, ?)', ['1', sd ]);
                                }
                                )
                }
                insertIntoTable()
            }
        }
//    }//Column
}
