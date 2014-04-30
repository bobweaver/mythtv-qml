import QtQuick 2.0
import Ubuntu.Components 0.1
import QtQuick.LocalStorage 2.0
import MythTv 1.0

Rectangle {
    id: rootTheme
    width: parent.height
    height: parent.width
    color: "#88000000"
    Text {
        id: header
        text: qsTr("Theme Chooser")
        font.pixelSize: parent.height / 15
    }
    Component{
        id: mythInstallButton
    Rectangle{
        id: installRec2
        radius: 8
        width: rootTheme.width / 2.6
        height: rootTheme.height / 8
        gradient: Gradient{
            GradientStop{position: 1; color: "#22FFFFFF"}
            GradientStop{position: .5; color: "#22000000"}
            GradientStop{position: 0.0; color: "#22FFFFFF"}
        }

        MouseArea{
            id: installRecMouseAreaa
            anchors.fill: installRec2
            hoverEnabled: true
            onClicked: {
                function getname() {
                    return  themeText1.text.toString()
                }
                function truncateThemeTable(){
                    var db = DataBase.themeDatabase();
                    db.transaction(
                                function(tx){
                                    tx.executeSql('DELETE FROM mythbuntu_theming_table WHERE WD_1=1')
                                }
                                )
                }
                function insertIntoThemingTable() {
                    var db = DataBase.themeDatabase();
                    db.transaction(
                                function(tx) {
                                    tx.executeSql('INSERT INTO mythbuntu_theming_table VALUES(?, ?)', ['1', getname()]);
                                }
                                )
                }
                DataBase.createInitIThemingTable()
                truncateThemeTable()
                insertIntoThemingTable()
                //                    console.log("Theme   is  " + DataBase.theme())


            }
        }
        Text {
            id: themeText1
            text: qsTr("MythUbuntu")
            anchors.centerIn: installRecMouseAreaa
        }
    }
}



    Component{
        id: installButton
        Rectangle{
            id: installRec
            radius: 8
            width: rootTheme.width / 2.6
            height: rootTheme.height / 8
            gradient: Gradient{
                GradientStop{position: 1; color: "#22FFFFFF"}
                GradientStop{position: .5; color: "#22000000"}
                GradientStop{position: 0.0; color: "#22FFFFFF"}
            }

            MouseArea{
                id: installRecMouseArea
                anchors.fill: installRec
                hoverEnabled: true
                onClicked: {
                    function getname1() {
                        return  themeText.text.toString()
                    }
                    function truncateThemeTable(){
                        var db = DataBase.themeDatabase();
                        db.transaction(
                                    function(tx){
                                        tx.executeSql('DELETE FROM mythbuntu_theming_table WHERE WD_1=1')
                                    }
                                    )
                    }
                    function insertIntoThemingTable() {
                        var db = DataBase.themeDatabase();
                        db.transaction(
                                    function(tx) {
                                        tx.executeSql('INSERT INTO mythbuntu_theming_table VALUES(?, ?)', ['1', getname1()]);
                                    }
                                    )
                    }
                    DataBase.createInitIThemingTable()
                    truncateThemeTable()
                    insertIntoThemingTable()
                    //                    console.log("Theme   is  " + DataBase.theme())
                }
            }
            Text {
                id: themeText
                text: qsTr("Ubuntu")
                anchors.centerIn: installRecMouseArea
            }
        }
    }

    Component{
        id:sampleArt
        Image {
            id: smappleArtImage
            source: "artwork/alphascreenarea.png"
            width: rootTheme.width / 2.3
            height: rootTheme.height / 1.9
        }

    }

    Component{
        id:themeExtraText
        Column{
            id:columnText
            width: rootTheme.width / 2.3
            height: rootTheme.height / 1.9
            Text {
                id: themeNameExtra
                text: qsTr("Ubuntu")

            }
            Text {
                id: authorText
                text: qsTr("Joseph Mills")
            }
            Text{
                id:aboutThemeTxt
                width: columnText.width
                text: "Simple Ubuntu Theme. Not that many fancy effects 1st templeate that was made "
                wrapMode: Text.WordWrap
            }
        }
    }
    Column{
        anchors{
         right: parent.right
        }
    Loader{sourceComponent: sampleArt   }
    Loader{sourceComponent: themeExtraText    }

    }
    Column{
        anchors.left: parent.left
        spacing: 20
    Loader{sourceComponent: installButton}
    Loader{sourceComponent: mythInstallButton }
}
}
