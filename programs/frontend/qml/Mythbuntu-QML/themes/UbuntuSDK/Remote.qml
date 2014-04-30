import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 0.1
import MythTv 1.0
Rectangle {
    id: remoteRoot
    width: parent.width
    height: parent.height
    color: "#88C7C7C7"
    Rectangle{
        id: remoteBackground
        width: parent.width
        height: parent.height
        color: Util.coolGrey
        anchors{
            horizontalCenter: parent.horizontalCenter
        }
        Rectangle{
            id: remoteLed
            radius: 180
            width: remoteRoot.width / 30
            height:    remoteRoot.width / 30
            color: "#44000000"
            Behavior on color{ColorAnimation { from: "red"; to: "#44000000"; duration: 1200; easing.type: Easing.InOutQuad}}
            border.color: "#55000000"
            border.width: 1
            anchors{
                horizontalCenter: parent.horizontalCenter
            }
        }
        WebEngine{
            id: engineI
            engineUrl: ""
        }
        Grid{
            width: remoteRoot.width
            height: parent.height
            spacing: 1
            columns: 6
            rows: 3
            anchors{
                left: parent.left
                top: parent.top
                topMargin: parent.height / 20
            }
            Button{
                text: "Menu"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.mENU
                    engineI.engineUrl = ""
                }
            }
            Button{
                text: "Exit"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.eXITPROMPT
                    engineI.engineUrl = ""
                }
            }
            Button{
                text: "Up"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.uP
                    engineI.engineUrl = ""
                }
            }
            Button{
                text: "Down"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.dOWN
                    engineI.engineUrl = ""
                }
            }
            Button{
                text: "Left"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.lEFT
                    engineI.engineUrl = ""
                }
            }
            Button{
                text: "right"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.rIGHT
                    engineI.engineUrl = ""
                }
            }
            Button{
                text: "select"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.sELECT
                    engineI.engineUrl = ""
                }
            }
            Button{
                text: "1"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.one
                    engineI.engineUrl = ""
                }
            }
            Button{
                text: "2"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.two
                    engineI.engineUrl = ""
                }
            }



            Button{
                text: "3"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.three
                    engineI.engineUrl = ""
                }
            }
            Button{
                text: "4"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.four
                    engineI.engineUrl = ""
                }
            }
            Button{
                text: "5"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.five
                    engineI.engineUrl = ""
                }
            }
            Button{
                text: "6"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.six
                    engineI.engineUrl = ""
                }
            }
            Button{
                text: "7"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.seven
                    engineI.engineUrl = ""
                }
            }

            Button{
                text: "8"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.eight
                    engineI.engineUrl = ""
                }
            }
            Button{
                text: "9"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.nine
                    engineI.engineUrl = ""
                }
            }
            Button{
                text: "0"
                onClicked:{
                    remoteLed.color = "red"
                    engineI.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+Remote.zero
                    engineI.engineUrl = ""
                }
            }


        }





    }
}
