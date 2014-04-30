import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import "../themes/UbuntuSDK/ubuntu/components"
import "../common/dbUtil.js" as DataBase
import "../common/Util.js" as Util
Rectangle {
    width: parent.width
    height: parent.height
    color: "transparent"

    Text {
        id: ipEnterAdd
        width:  ipOptionsPage.width - (parent.width / 30 )
        text: qsTr("Please Enter in your Myth TV backend location")
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
        id: ipEnterAddbottom
        width:  ipOptionsPage.width - (parent.width / 30 )
        text: qsTr("It can be a FQDN or a number \n  example:  http://ubuntu.com \n  example:  http://127.0.0.1")
        color: "white"
        wrapMode: Text.WordWrap
        font.pixelSize: parent.width / 30
        anchors{
            top: ipEnterAdd.bottom
            left: parent.left
            leftMargin: parent.width / 60
        }
    }
    Column{
        spacing: parent.height / 30
        width: parent.width   / 2.2
        anchors{
            top: ipEnterAddbottom.bottom
            topMargin: parent.height / 30
            horizontalCenter: parent.horizontalCenter
        }
        UbuntuShape{
            id: ipboxArea
            width: parent.width
            color: "grey"
            TextArea{
                id: ipboxEdit
                text: DataBase.ipAddress() === "http://127.0.0.1" ? "http://127.0.0.1" : DataBase.ipAddress()
                color: "black"
                font.pixelSize:  parent.width / 16
//                focus: true
                cursorVisible: true
                anchors{
                    centerIn: ipboxArea
                }
                onTextChanged: {
                    DataBase.createInitIpAddressTable()
                    DataBase.truncateIpAddess()
                    function insertIntoTable() {
                        var db = DataBase.ipDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_backend_location VALUES(?, ?)', ['1', text ]);
                                    }
                                    )
                    }
                    insertIntoTable()
                    //                    debugging
                    //                    console.log("database is  " + DataBase.ipAddress())
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
//                    if (status === XmlListModel.Loading){
                        console.log("Loading");
                        DataBase.createInitMainPortDatabase()
        //                DataBase.createInitPortTable()

                //        DataBase.createInitThemeMainDatabase()
                //        DataBase.createInitITHemingTable()
                       DataBase.createInitMainDatabase()
                        DataBase.frontendDatabase()

        //                DataBase.createInitIpAddressTable()
        //            DataBase.createInitFrontEndTable()
                        console.log("\n HELOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO \n")








                    DataBase.createInitIpAddressTable()
                    DataBase.truncateIpAddess()
                    function getIpText(){return ipboxEdit.text.toString()}
                    function insertIntoTableback() {
                        var db = DataBase.ipDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_backend_location VALUES(?, ?)', ['1',getIpText() ]);
                                    }
                                    )
                    }
                    insertIntoTableback()
                    //debug
                    //                    console.log("database is  " + DataBase.ipAddress())
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
                    ipOptionsPage.y = startHereRoot.height
                    ipOptionsPage.opacity = 0
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
