import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import "../themes/UbuntuSDK/ubuntu/components"
import "../common/dbUtil.js" as DataBase
import "../common/Util.js" as Util
Rectangle {
    id: frontEndOptionsRoot
    width: parent.width
    height: parent.height
    color: "transparent"

    Text {
        id: portEnterAdd
        width:  portOptionsPage.width - (parent.width / 30 )
        text: qsTr("Please Enter in your FrontEnd Info")
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
        text: qsTr("Frontend Ip address or fqdn ,  Frontend port Number")
        color: "white"
        wrapMode: Text.WordWrap
        font.pixelSize: parent.width / 50
        anchors{
            top: portEnterAdd.bottom
            left: parent.left
            leftMargin: parent.width / 60
        }
    }
    Column{
        id: mainColumn
        spacing: parent.height / 33
        height: parent.height
        width: parent.width   / 2.2
        anchors{
            top: portEnterAddbottom.bottom
            topMargin: parent.height / 30
            left: parent.left
            leftMargin:  parent.width / 15
        }























        //1
        Row{
        spacing: parent.width / 10
        width: frontEndOptionsRoot.width   / 2.2
        UbuntuShape{
            id: ipboxArea1
            width: mainColumn.width
            height: mainColumn.height / 14
            color: "grey"
            TextArea{
                id: ipboxEdit1
                text: {
                    var defaultIp = "http://127.0.0.1"
                    if ( defaultIp ===  DataBase.frontendIp1())
                        return defaultIp
                    else
                        return DataBase.frontendIp1()
                }
                color: "black"
                font.pixelSize:  parent.width / 18
                   anchors{
                    centerIn: ipboxArea1
                }
                onTextChanged:{
                    DataBase.createInitFrontEndTable()
                    function truncateFrontEnd1(){
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE  FROM mythbuntu_frontend WHERE WD_1=1')
                                    }
                             )
                    }
                    function insertIntoFrontEnd1Table() {
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_frontend VALUES(?, ?, ?)', ['1', text , portboxEdit1.text]);
                                    }
                                    )
                    }
                    truncateFrontEnd1()
                    insertIntoFrontEnd1Table()
//                                        debugging
                                        console.log("FrontEnd Table 1  is  " + DataBase.frontendIp1())
                }
            }
        }


        UbuntuShape{
            id: portboxArea1
            width: mainColumn.width / 3
            height: mainColumn.height / 14
            color: "grey"
            TextArea{
                id: portboxEdit1
                text: DataBase.frontendPort1() !== "6547" || ""  ? DataBase.frontendPort1() : "6547"
                color: "white"
                font.pixelSize:  mainColumn.width / 18
                focus: true
                anchors{
                    centerIn: portboxArea1
                }
                onTextChanged:{
                    DataBase.createInitFrontEndTable()
                    function truncateFrontEnd1(){
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE  FROM mythbuntu_frontend WHERE WD_1=1')
                                    }
                             )
                    }
                    function insertIntoFrontEnd1Table() {
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_frontend VALUES(?, ?, ?)', ['1', ipboxEdit1.text , text]);
                                    }
                                    )
                    }
                    truncateFrontEnd1()
                    insertIntoFrontEnd1Table()
//                                        debugging
                                        console.log("FrontEnd Table I 1  is \t" + DataBase.frontendIp1()
                                                                 + "\n FrontEnd P Table 1  is \t" + DataBase.frontendPort1() )
                }
            }
        }


        UbuntuShape{
            id: boxAreaSave1
            width: mainColumn.width / 3
            height: mainColumn.height / 14
            color: "grey"
            MouseArea{
                id: boxAreaSave1MouseArea
                anchors.fill: boxAreaSave1
                onClicked: {
                    DataBase.createInitFrontEndTable()
                    function truncateFrontEnd1(){
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE  FROM mythbuntu_frontend WHERE WD_1=1')
                                    }
                             )
                    }
                    function insertIntoFrontEnd1Table() {
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_frontend VALUES(?, ?, ?)', ['1', ipboxEdit1.text , portboxEdit1.text]);
                                    }
                                    )
                    }
                    truncateFrontEnd1()
                    insertIntoFrontEnd1Table()
//                                        debugging
                                        console.log("FrontEnd Table I 1  is \t" + DataBase.frontendIp1()
                                                                 + "\n FrontEnd P Table 1  is \t" + DataBase.frontendPort1() )
                }
            Text {
                id: save1
                color: "white"
                font.pixelSize:  mainColumn.width / 18
                anchors.centerIn: boxAreaSave1MouseArea
                text: qsTr("Save")
            }
        }
        }
        }//SetUp 1
        //1






        //2
        Row{
        spacing: parent.width / 10
        width: frontEndOptionsRoot.width   / 2.2
        UbuntuShape{
            id: ipboxArea2
            width: mainColumn.width
            height: mainColumn.height / 14
            color: "grey"
            TextInput{
                id: ipboxEdit2
                text: {
                    var defaultIp = "http://127.0.0.1"
                    if ( DataBase.frontendIp2() === "")
                        return defaultIp
                    else
                        return DataBase.frontendIp2().toString()
                }
                color: "white"
                font.pixelSize:  parent.width / 18
                   anchors{
                    centerIn: ipboxArea2
                }
                onAccepted:{
                    DataBase.createInitFrontEndTable()
                    function truncateFrontEnd2(){
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE  FROM mythbuntu_frontend WHERE WD_1=2')
                                    }
                             )
                    }
                    function insertIntoFrontEnd2Table() {
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_frontend VALUES(?, ?, ?)', ['2', text , portboxEdit2.text]);
                                    }
                                    )
                    }
                    truncateFrontEnd2()
                    insertIntoFrontEnd2Table()
        //                                        debugging
                                        console.log("FrontEnd Table 2  is  " + DataBase.frontendIp2())
                }
            }
        }



        UbuntuShape{
            id: portboxArea2
            width: mainColumn.width / 3
            height: mainColumn.height / 14
            color: "grey"
            TextInput{
                id: portboxEdit2
                text:{
                    if ( DataBase.frontendPort2() === "" )
                        "6547"
                    else
                        return DataBase.frontendPort2().toString()
                }
                color: "white"
                font.pixelSize:  mainColumn.width / 18
                focus: true
                anchors{
                    centerIn: portboxArea2
                }
                onAccepted:{
                    DataBase.createInitFrontEndTable()
                    function truncateFrontEnd2(){
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE  FROM mythbuntu_frontend WHERE WD_1=2')
                                    }
                             )
                    }
                    function insertIntoFrontEnd2Table() {
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_frontend VALUES(?, ?, ?)', ['2', ipboxEdit2.text , text]);
                                    }
                                    )
                    }
                    truncateFrontEnd2()
                    insertIntoFrontEnd2Table()
        //                                        debugging
                                        console.log("FrontEnd Table I 2  is \t" + DataBase.frontendIp2()
                                                                 + "\n FrontEnd P Table 2  is \t" + DataBase.frontendPort2() )
                }

            }

        }



        UbuntuShape{
            id: boxAreaSave2
            width: mainColumn.width / 3
            height: mainColumn.height / 14
            color: "grey"
            MouseArea{
                id: boxAreaSave2MouseArea
                anchors.fill: boxAreaSave2
                onClicked: {

                    DataBase.createInitFrontEndTable()
                    function truncateFrontEnd2(){
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE  FROM mythbuntu_frontend WHERE WD_1=2')
                                    }
                             )
                    }
                    function insertIntoFrontEnd2Table() {
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_frontend VALUES(?, ?, ?)', ['2', ipboxEdit2.text , portboxEdit2.text]);
                                    }
                                    )
                    }

                    truncateFrontEnd2()
                    insertIntoFrontEnd2Table()
        //                                        debugging

                    console.log("FrontEnd Table I 2  is \t" + DataBase.frontendIp2()
                                                                 + "\n FrontEnd P Table 2  is \t" + DataBase.frontendPort2() )
                }
            Text {
                id: save2
                color: "white"
                font.pixelSize:  mainColumn.width / 18
                anchors.centerIn: boxAreaSave2MouseArea
                text: qsTr("Save")
            }
        }
        }
        }//SetUp 2
        //2













        //3
        Row{
        spacing: parent.width / 10
        width: frontEndOptionsRoot.width   / 2.2
        UbuntuShape{
            id: ipboxArea3
            width: mainColumn.width
            height: mainColumn.height / 14
            color: "grey"
            TextInput{
                id: ipboxEdit3
                text: {
                    var defaultIp = "http://127.0.0.1"
                    if ( defaultIp ===  DataBase.frontendIp3())
                        return defaultIp
                    else
                        return DataBase.frontendIp3()
                }
                color: "white"
                font.pixelSize:  parent.width / 18
                   anchors{
                    centerIn: ipboxArea3
                }
                onAccepted:{
                    DataBase.createInitFrontEndTable()
                    function truncateFrontEnd3(){
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE  FROM mythbuntu_frontend WHERE WD_1=3')
                                    }
                             )
                    }
                    function insertIntoFrontEnd3Table() {
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_frontend VALUES(?, ?, ?)', ['3', text , portboxEdit3.text]);
                                    }
                                    )
                    }
                    truncateFrontEnd3()
                    insertIntoFrontEnd3Table()
        //                                        debugging
                                        console.log("FrontEnd Table 3  is  " + DataBase.frontendIp3())
                }
            }
        }


        UbuntuShape{
            id: portboxArea3
            width: mainColumn.width / 3
            height: mainColumn.height / 14
            color: "grey"
            TextInput{
                id: portboxEdit3
                text: DataBase.frontendPort3() !== "6547" || ""  ? DataBase.frontendPort3() : "6547"
                color: "white"
                font.pixelSize:  mainColumn.width / 18
                focus: true
                anchors{
                    centerIn: portboxArea3
                }
                onAccepted:{
                    DataBase.createInitFrontEndTable()
                    function truncateFrontEnd3(){
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE  FROM mythbuntu_frontend WHERE WD_1=3')
                                    }
                             )
                    }
                    function insertIntoFrontEnd3Table() {
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_frontend VALUES(?, ?, ?)', ['3', ipboxEdit3.text , text]);
                                    }
                                    )
                    }
                    truncateFrontEnd3()
                    insertIntoFrontEnd3Table()
        //                                        debugging
                                        console.log("FrontEnd Table I 3  is \t" + DataBase.frontendIp3()
                                                                 + "\n FrontEnd P Table 3  is \t" + DataBase.frontendPort3() )
                }
            }
        }


        UbuntuShape{
            id: boxAreaSave3
            width: mainColumn.width / 3
            height: mainColumn.height / 14
            color: "grey"
            MouseArea{
                id: boxAreaSave3MouseArea
                anchors.fill: boxAreaSave3
                onClicked: {
                    DataBase.createInitFrontEndTable()
                    function truncateFrontEnd3(){
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE  FROM mythbuntu_frontend WHERE WD_1=3')
                                    }
                             )
                    }
                    function insertIntoFrontEnd3Table() {
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_frontend VALUES(?, ?, ?)', ['3', ipboxEdit3.text , portboxEdit3.text]);
                                    }
                                    )
                    }
                    truncateFrontEnd3()
                    insertIntoFrontEnd3Table()
        //                                        debugging
                                        console.log("FrontEnd Table I 3  is \t" + DataBase.frontendIp3()
                                                                 + "\n FrontEnd P Table 3  is \t" + DataBase.frontendPort3() )
                }
            Text {
                id: save3
                color: "white"
                font.pixelSize:  mainColumn.width / 18
                anchors.centerIn: boxAreaSave3MouseArea
                text: qsTr("Save")
            }
        }
        }
        }//SetUp 3
        //3







        //4
        Row{
        spacing: parent.width / 10
        width: frontEndOptionsRoot.width   / 2.2
        UbuntuShape{
            id: ipboxArea4
            width: mainColumn.width
            height: mainColumn.height / 14
            color: "grey"
            TextInput{
                id: ipboxEdit4
                text: {
                    var defaultIp = "http://127.0.0.1"
                    if ( defaultIp ===  DataBase.frontendIp4())
                        return defaultIp
                    else
                        return DataBase.frontendIp4()
                }
                color: "white"
                font.pixelSize:  parent.width / 18
                   anchors{
                    centerIn: ipboxArea4
                }
                onAccepted:{
                    DataBase.createInitFrontEndTable()
                    function truncateFrontEnd4(){
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE  FROM mythbuntu_frontend WHERE WD_1=4')
                                    }
                             )
                    }
                    function insertIntoFrontEnd4Table() {
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_frontend VALUES(?, ?, ?)', ['4', text , portboxEdit4.text]);
                                    }
                                    )
                    }
                    truncateFrontEnd4()
                    insertIntoFrontEnd4Table()
        //                                        debugging
                                        console.log("FrontEnd Table 4  is  " + DataBase.frontendIp4())
                }
            }
        }


        UbuntuShape{
            id: portboxArea4
            width: mainColumn.width / 3
            height: mainColumn.height / 14
            color: "grey"
            TextInput{
                id: portboxEdit4
                text: DataBase.frontendPort4() !== "6547" || ""  ? DataBase.frontendPort4() : "6547"
                color: "white"
                font.pixelSize:  mainColumn.width / 18
                focus: true
                anchors{
                    centerIn: portboxArea4
                }
                onAccepted:{
                    DataBase.createInitFrontEndTable()
                    function truncateFrontEnd4(){
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE  FROM mythbuntu_frontend WHERE WD_1=4')
                                    }
                             )
                    }
                    function insertIntoFrontEnd4Table() {
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_frontend VALUES(?, ?, ?)', ['4', ipboxEdit4.text , text]);
                                    }
                                    )
                    }
                    truncateFrontEnd4()
                    insertIntoFrontEnd4Table()
        //                                        debugging
                                        console.log("FrontEnd Table I 4  is \t" + DataBase.frontendIp4()
                                                                 + "\n FrontEnd P Table 4  is \t" + DataBase.frontendPort4() )
                }
            }
        }


        UbuntuShape{
            id: boxAreaSave4
            width: mainColumn.width / 3
            height: mainColumn.height / 14
            color: "grey"
            MouseArea{
                id: boxAreaSave4MouseArea
                anchors.fill: boxAreaSave4
                onClicked: {
                    DataBase.createInitFrontEndTable()
                    function truncateFrontEnd4(){
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE  FROM mythbuntu_frontend WHERE WD_1=4')
                                    }
                             )
                    }
                    function insertIntoFrontEnd4Table() {
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_frontend VALUES(?, ?, ?)', ['4', ipboxEdit4.text , portboxEdit4.text]);
                                    }
                                    )
                    }
                    truncateFrontEnd4()
                    insertIntoFrontEnd4Table()
        //                                        debugging
                                        console.log("FrontEnd Table I 4  is \t" + DataBase.frontendIp4()
                                                                 + "\n FrontEnd P Table 4  is \t" + DataBase.frontendPort4() )
                }
            Text {
                id: save4
                color: "white"
                font.pixelSize:  mainColumn.width / 18
                anchors.centerIn: boxAreaSave4MouseArea
                text: qsTr("Save")
            }
        }
        }
        }//SetUp 4
        //4




        //5
        Row{
        spacing: parent.width / 10
        width: frontEndOptionsRoot.width   / 2.2
        UbuntuShape{
            id: ipboxArea5
            width: mainColumn.width
            height: mainColumn.height / 14
            color: "grey"
            TextInput{
                id: ipboxEdit5
                text: {
                    var defaultIp = "http://127.0.0.1"
                    if ( defaultIp ===  DataBase.frontendIp5())
                        return defaultIp
                    else
                        return DataBase.frontendIp5()
                }
                color: "white"
                font.pixelSize:  parent.width / 18
                   anchors{
                    centerIn: ipboxArea5
                }
                onAccepted:{
                    DataBase.createInitFrontEndTable()
                    function truncateFrontEnd5(){
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE  FROM mythbuntu_frontend WHERE WD_1=5')
                                    }
                             )
                    }
                    function insertIntoFrontEnd5Table() {
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_frontend VALUES(?, ?, ?)', ['5', text , portboxEdit5.text]);
                                    }
                                    )
                    }
                    truncateFrontEnd5()
                    insertIntoFrontEnd5Table()
        //                                        debugging
                                        console.log("FrontEnd Table 5  is  " + DataBase.frontendIp5())
                }
            }
        }


        UbuntuShape{
            id: portboxArea5
            width: mainColumn.width / 3
            height: mainColumn.height / 14
            color: "grey"
            TextInput{
                id: portboxEdit5
                text: DataBase.frontendPort5() !== "6547" || ""  ? DataBase.frontendPort5() : "6547"
                color: "white"
                font.pixelSize:  mainColumn.width / 18
                focus: true
                anchors{
                    centerIn: portboxArea5
                }
                onAccepted:{
                    DataBase.createInitFrontEndTable()
                    function truncateFrontEnd5(){
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE  FROM mythbuntu_frontend WHERE WD_1=5')
                                    }
                             )
                    }
                    function insertIntoFrontEnd5Table() {
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_frontend VALUES(?, ?, ?)', ['5', ipboxEdit5.text , text]);
                                    }
                                    )
                    }
                    truncateFrontEnd5()
                    insertIntoFrontEnd5Table()
        //                                        debugging
                                        console.log("FrontEnd Table I 5  is \t" + DataBase.frontendIp5()
                                                                 + "\n FrontEnd P Table 5  is \t" + DataBase.frontendPort5() )
                }
            }
        }


        UbuntuShape{
            id: boxAreaSave5
            width: mainColumn.width / 3
            height: mainColumn.height / 14
            color: "grey"
            MouseArea{
                id: boxAreaSave5MouseArea
                anchors.fill: boxAreaSave5
                onClicked: {
                    DataBase.createInitFrontEndTable()
                    function truncateFrontEnd5(){
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE  FROM mythbuntu_frontend WHERE WD_1=5')
                                    }
                             )
                    }
                    function insertIntoFrontEnd5Table() {
                        var db = DataBase.frontendDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_frontend VALUES(?, ?, ?)', ['5', ipboxEdit5.text , portboxEdit5.text]);
                                    }
                                    )
                    }
                    truncateFrontEnd5()
                    insertIntoFrontEnd5Table()
        //                                        debugging
                                        console.log("FrontEnd Table I 5  is \t" + DataBase.frontendIp5()
                                                                 + "\n FrontEnd P Table 5  is \t" + DataBase.frontendPort5() )
                }
            Text {
                id: save5
                color: "white"
                font.pixelSize:  mainColumn.width / 18
                anchors.centerIn: boxAreaSave5MouseArea
                text: qsTr("Save")
            }
        }
        }
        }//SetUp 5
        //5














    }//Column




        UbuntuShape{
            id:backButton
            width: parent.width / 3
            color: "grey"
            anchors{
 horizontalCenter: parent.horizontalCenter
 bottomMargin: parent.width / 20
                bottom:  parent.bottom
}
            MouseArea{
                id:backButtonMouseArea
                anchors.fill: backButton
                onClicked: {
                    frontendportOptionsPage.y = startHereRoot.height
                    frontendportOptionsPage.opacity = 0
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


}
