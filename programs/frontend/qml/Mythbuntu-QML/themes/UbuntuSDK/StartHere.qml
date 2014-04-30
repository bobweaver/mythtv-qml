import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 0.1
import MythTv 1.0
Rectangle{
    id: startHereRoot
    width:parent.width
    height: parent.height
    color: "#88C7C7C7"
        Rectangle {
        id: pageOne
        width:parent.width
        height: parent.height
        x: 0
        Behavior on x {NumberAnimation{duration: 900 ; easing.type: Easing.OutQuad}}
        gradient: Gradient {
            GradientStop { position: 0; color: "#88C7C7C7"}
            GradientStop { position: 0.5; color: "#44C7C7C7"}
            GradientStop { position: 1; color: "#88C7C7C7"}
        }
        Text{
            id: welcomeText
            text: "Wecome to Myth Mobile "
            color:  Util.ubuntuGrey
            width: startHereRoot.width - 3
            wrapMode: Text.WordWrap
            font.pixelSize:  parent.height / 12
        }
        Text {
            id: setUpTXT
            width: startHereRoot.width - 3
            text: "Please take the time to fill in the correct info below"
            color:  Util.ubuntuGrey
            wrapMode: Text.WordWrap
            font.pixelSize: parent.width / 28
            anchors{
                top:welcomeText.bottom
            }
        }
        //Ip Button
        Text{
            text: "Backend Ip Address"
            color: "#88000000"
            font.pixelSize:  parent.height / 12
            anchors.centerIn: ipBox
        }

        Rectangle{
            id:ipBox
            anchors.top:setUpTXT.bottom
            width:  parent.width
            height: parent.height / 4
            border.color: "#55FFFFFF"
            border.width: 1
            gradient: Gradient{
                GradientStop { position: 0; color: "#42000000"}
                GradientStop { position: 0.5; color: "#66808080"}
                GradientStop { position: 1; color: "#42000000"}
            }
        }
        MouseArea{
            anchors.fill: ipBox
            onClicked: {
                ipOptionsPage.y = 0
                ipOptionsPage.opacity = 1
                pageOne.x = startHereRoot.width + 10
            }
        }
        //port button
        Text{
            text: "Backend Port Number"
            color: "#88000000"
            font.pixelSize:  parent.height / 12
            anchors.centerIn: portBox
        }
        Rectangle{
            id:portBox
            anchors.top:ipBox.bottom
            width:  parent.width
            height: parent.height / 4
            border.color: "#55FFFFFF"
            border.width: 1
            gradient: Gradient{
                GradientStop { position: 0; color: "#42000000"}
                GradientStop { position: 0.5; color: "#66808080"}
                GradientStop { position: 1; color: "#42000000"}
            }
        }
        MouseArea{
            anchors.fill: portBox
            onClicked: {
                portOptionsPage.y = 0
                portOptionsPage.opacity = 1
                pageOne.x = -startHereRoot.width - 10
            }
        }

        //Frontend Configuration button
        Text{
            text: "FrontEnd Info"
            color: "#88000000"
            font.pixelSize:  parent.height / 12
            anchors.centerIn: frontendPortBox
        }
        Rectangle{
            id:frontendPortBox
            anchors.top:portBox.bottom
            width:  parent.width
            height: parent.height / 4
            border.color: "#55FFFFFF"
            border.width: 1
            gradient: Gradient{
                GradientStop { position: 0; color: "#42000000"}
                GradientStop { position: 0.5; color: "#66808080"}
                GradientStop { position: 1; color: "#42000000"}
            }
        }
        MouseArea{
            anchors.fill: frontendPortBox
            onClicked: {
                frontendportOptionsPage.y = 0
               frontendportOptionsPage.opacity = 1
                pageOne.x = -startHereRoot.width - 10
                DataBase.createInitMainFrontEndDatabase()
//                DataBase.createInitMainDatabase()
            }
        }
    }//Page One(main page)
    //This is page two aka the backend ip address options page,
    Rectangle{
        id: ipOptionsPage
        width: startHereRoot.width
        height: startHereRoot.height
        color: "#99000000"
        y: startHereRoot.height
        Behavior on opacity {NumberAnimation{duration: 1800; easing.type: Easing.OutQuart}}
        Behavior on y {NumberAnimation{duration: 900 ; easing.type: Easing.OutBack}}
        MythIpAdresss{}
    }//ipoptions
    //THis is the 3rd options page aka the Myth tv backend port number(in the future there it will set on its own or when user changes it from the settings page)
    Rectangle{
        id: portOptionsPage
        width: startHereRoot.width
        height: startHereRoot.height
        color: "#99000000"
        y: startHereRoot.height
        Behavior on opacity {NumberAnimation{duration: 1800; easing.type: Easing.OutQuart}}
        Behavior on y {NumberAnimation{duration: 900 ; easing.type: Easing.OutBack}}
        MythPortBackend{}
    }// Port options page
  ///FrontEnd
    Rectangle{
        id: frontendportOptionsPage
        width: startHereRoot.width
        height: startHereRoot.height
        color: "#99000000"
        y: startHereRoot.height
        Behavior on opacity {NumberAnimation{duration: 1800; easing.type: Easing.OutQuart}}
        Behavior on y {NumberAnimation{duration: 900 ; easing.type: Easing.OutBack}}
//        FrontEndOptions{}
    }// FrontEnd options page
}//Root
