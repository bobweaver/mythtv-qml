import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import MythTV 1.0
import "../themes/UbuntuSDK/ubuntu/components"
//import "../common/dbUtil.js" as DataBase
//import "../common/Util.js" as Util
Rectangle {
    width: parent.width
    height: parent.height
    color: "transparent"

    Text {
        id: portEnterAdd
        width:  portOptionsPage.width - (parent.width / 30 )
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
        width:  portOptionsPage.width - (parent.width / 30 )
        text: qsTr("example:  6994")
        color: "white"
        wrapMode: Text.WordWrap
        font.pixelSize: parent.width / 30
        anchors{
            top: portEnterAdd.bottom
            left: parent.left
            leftMargin: parent.width / 60
        }
    }
    Column{
        spacing: parent.height / 30
        width: parent.width   / 2.2
        anchors{
            top: portEnterAddbottom.bottom
            topMargin: parent.height / 30
            horizontalCenter: parent.horizontalCenter
        }
        UbuntuShape{
            id: portboxArea
            width: parent.width
            color: "grey"
            TextArea{
                id: portboxEdit
                text: DataBase.ipAddress() !== "6544"  ? "6544" : DataBase.port()
                color: "black"
                font.pixelSize:  parent.width / 16
                focus: true
                cursorVisible: true
                anchors{
                    centerIn: portboxArea
                }
                onTextChanged:{
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
        UbuntuShape{
            id: saveArea
            width: parent.width
            color: "grey"
            MouseArea{
                id: saveMouseArea
                anchors.fill: saveArea
                onClicked:{
                    DataBase.createInitPortTable()
                    DataBase.truncatePort()
                    function getportText(){return portboxEdit.text.toString()}
                    function insertIntoPortTableBack() {
                        var db = DataBase.portDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_backend_port VALUES(?, ?)', ['1',getportText() ]);
                                    }
                                    )
                    }
                    insertIntoPortTableBack()
                    //debug
                                        console.log("Port Number  is:   " + DataBase.port())
                }
            }
            Text {
                id: saveText
                text: qsTr("Save")
                font.pixelSize:  parent.width / 16
                color: "white"
                anchors.centerIn: saveMouseArea
            }
        }
        UbuntuShape{
            id:backButton
            width: parent.width
            color: "grey"
            MouseArea{
                id:backButtonMouseArea
                anchors.fill: backButton
                onClicked: {
                    portOptionsPage.y = startHereRoot.height
                    portOptionsPage.opacity = 0
                    pageOne.x =0
                }
            }
            Text {
                id: backButtonTXT
                text: qsTr("Back")
                font.pixelSize:  parent.width / 16
                color: "white"
                anchors.centerIn: backButtonMouseArea
            }
        }
    }//Column
}
