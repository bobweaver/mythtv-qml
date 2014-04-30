import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import ZeroConf 1.0
import "dbUtil.js" as DataBase
import "Util.js" as Util
Rectangle {
    id:rootTangle
    width: parent.width
    height: parent.height
    color: "transparent"
    Text {
        id: ipEnterAdd
        width:  rootTangle.width - (parent.width / 30 )
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
        width:  rootTangle.width - (parent.width / 30 )
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

    MouseArea{
        id: ipboxMouseArea
     anchors.fill: ipboxArea
        onClicked: {

            if (ipboxEdit.focus === false ){
            ipboxEdit.focus = true
            ipboxEdit.text = Util.zeroConf(backend.getString());
            }else{
                ipboxEdit.focus = false
                Util.zeroConf(backend.getString())

            }
        }
    }
        Rectangle{
            id: ipboxArea
            width: rootTangle.width / 2
           height: rootTangle.height / 2
           radius: 4
           border.width: 1
           border.color: Qt.darker(color,2)
            anchors.top: ipEnterAddbottom.bottom
            color: "white"
            TextInput{
                id: ipboxEdit
                height: ipboxArea.height
                text:{
                    function makeDB(){
                        var dbs = DataBase.ipAddress().toString()
                        var q = backend.getString()
                        if (DataBase.createInitIpAddressTable() === 1 || 0)
                            return DataBase.ipAddress().toString()
                        else
                            return   Util.zeroConf(backend.getString())

                    }
                    makeDB()
                }
                color: "black"
                font.pixelSize:  parent.width / 16
                cursorVisible: activeFocus === true ?  true : false
                anchors{
                    centerIn: ipboxArea
                }
                onAccepted: {
                 focus = false
                }
                onTextChanged:   {
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
                    console.log("database is  " + DataBase.ipAddress())
                }
            }
BonjourBackend{id: backend}
        }
}
