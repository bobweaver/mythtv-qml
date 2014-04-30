import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.Particles 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Window 2.0
import Qt.labs.folderlistmodel 2.0
import ZeroConf 1.0
import MythSystemTools 1.0
import  MythTv 1.0
//import MythDB 1.0

Rectangle{
    id: root
    width: Screen.width - 10
    height: Screen.height - 10
    color: "black"
    Rectangle{
        id: superCol
        width: root.width
        height: root.height
        gradient: Gradient{
            GradientStop{position: 1; color:"#88FFFFFF" }
            GradientStop{position: .7; color: "#66000000" }
            GradientStop{position: .4; color: "#66000000"}
            GradientStop{position: 0; color: "#88FFFFFF"}
        }
        anchors.fill: root
        opacity: 1
        Column{
            width: root.width
            height: root.height
            spacing: root.height / 3
            MythIpAdresss{
                id: ipAdd
                width:  parent.width / 1.4
                height:  parent.height / 8
                //                KeyNavigation.up:portAdd
                //                KeyNavigation.down: portAdd
            }
            MythPortBackend{
                id: portAdd
                width:  parent.width / 1.4
                height:  parent.height / 8
                //                KeyNavigation.up: ipAdd
                //                KeyNavigation.down: sdkTheme
            }
        }
    }
    Rectangle{
        id:themeRec
        width: parent.width
        height:     parent.height / 3
        color: "transparent"
        anchors.bottom: parent.bottom
        Text{
            id: tname
            width: Screen.width / 20
            height:    Screen.height / 20
            color: Qt.darker("orange", 1.5)
            text: ""

            anchors{
                left:  themeRec.left
                top: themeRec.top
            }
        }

        Row{
            width: themeRec.width
            height: themeRec.height
            anchors{
                top: tname.bottom
            }
            spacing:1// sdkTheme.width / 6
            ThemeButton{
                id: sdkTheme
                buttonWidth:  parent.width / 3
                buttonHeight:  parent.height / 3
                name: "UbuntuSDK"
                focus: true
                scale: activeFocus ? 1.1 : 1
                textColor: activeFocus ? "blue":"white"
                KeyNavigation.right: mythubuntuTheme
                KeyNavigation.up: portAdd
                KeyNavigation.left: mythMediaStreamTheme
                KeyNavigation.down: openFrontend
                iconShown: 1
                iconSource:{
                    if  (iconStatus === Image.Error )
                        return  "themes/UbuntuSDK/images/preview.png"
                    else
                        "themes/UbuntuSDK/images/preview.png"
                }

                buttonBaseBackground:{
                    if (mouseState === "selected-hovered" )
                        "themes/Mythbuntu/music/button_selected_background.png"
                    if (mouseState === "pressed" )
                        "themes/Mythbuntu/music/button_pushed_background.png"
                    if (mouseState === "selected" )
                        "themes/Mythbuntu/music/button_selected_background.png"
                    if (mouseState === "hovered" )
                        "themes/Mythbuntu/music/button_selected_background.png"
                    else
                        "themes/Mythbuntu/music/button_background.png"
                }
            }
            ThemeButton{
                id: mythubuntuTheme
                buttonWidth:  parent.width / 3
                buttonHeight:  parent.height / 3
                name: "MythUbuntu"
                scale: activeFocus ? 1.1 : 1
                textColor: activeFocus ? "blue":"white"
                KeyNavigation.right: mythMediaStreamTheme
                KeyNavigation.up: portAdd
                KeyNavigation.left: sdkTheme
                KeyNavigation.down: openFrontend

                iconShown: 1
                iconSource:{
                    if  (iconStatus === Image.Error )
                        return  "themes/Mythbuntu/preview.png"
                    else
                        return "themes/Mythbuntu/preview.jpg"
                }
                buttonBaseBackground:{
                    if (mouseState === "selected-hovered" )
                        "themes/Mythbuntu/music/button_selected_background.png"
                    if (mouseState === "pressed" )
                        "themes/Mythbuntu/music/button_pushed_background.png"
                    if (mouseState === "selected" )
                        "themes/Mythbuntu/music/button_selected_background.png"
                    if (mouseState === "hovered" || activeFocus === true)
                        "themes/Mythbuntu/music/button_selected_background.png"
                    else
                        "themes/Mythbuntu/music/button_background.png"
                }
            }
            ThemeButton{
                id: mythMediaStreamTheme
                buttonWidth:  parent.width / 3
                buttonHeight:  parent.height / 3
                name: "MythMediaStream"
                textColor: activeFocus ? "blue":"white"
                scale: activeFocus ? 1.1 : 1
                KeyNavigation.right: sdkTheme
                KeyNavigation.up: portAdd
                KeyNavigation.left: mythubuntuTheme
                KeyNavigation.down: openFrontend
                buttonBaseBackground:{
                    if (mouseState === "selected-hovered" )
                        "themes/Mythbuntu/music/button_selected_background.png"
                    if (mouseState === "pressed" )
                        "themes/Mythbuntu/music/button_pushed_background.png"
                    if (mouseState === "selected" )
                        "themes/Mythbuntu/music/button_selected_background.png"
                    if (mouseState === "hovered"|| activeFocus === true )
                        "themes/Mythbuntu/music/button_selected_background.png"
                    else
                        "themes/Mythbuntu/music/button_background.png"
                }
            }
        }
    }
    MythButton{
        id: openFrontend
        width: root.width
        height: activeFocus ? root.height / 9:root.height / 10
        radius: 8
        name: "Open Frontend"
        namepxSize: height/ 1.7
        nameColor:  "white"
        buttonColor: "#33000000"
        Keys.onPressed: {
            if(Qt.Key_Enter){
                superTheme.opacity = 1
                superTheme.y = 0
            }
        }
        onButtonClick: {
            superTheme.opacity = 1
            superTheme.y = 0
            ipAdd.focus = false
        }
        anchors.bottom:  parent.bottom
    }
    Image {
        id: mythImage
        source: "artwork/mythbuntu.png"
        width: parent.width / 5
        height:    parent.width / 5
        x: {
            if (status === Image.Ready)
                root.width - (width)
            else
                ((-root.width) *2)
        }
        Behavior on x {NumberAnimation{duration: 2200; easing.type: Easing.OutElastic}}
        state: {
            if (status === Image.Error)
                "ER"
            if (status === Image.Loading)
                "L"
            if(status === Image.Ready)
                "Loaded"
            else
                "SpinDamIT"
        }
        Behavior on state  {
            NumberAnimation{
                target: mythImage;
                property: "rotation";
                from:0;
                to:360;
                duration: 1200;
                easing.type: Easing.OutCirc
            }
        }
        anchors{
            top:parent.top
        }
        MouseArea{
            anchors.fill: mythImage
            onClicked: {
                connect.createConnection();
                channels.getChannels("1081");
//                sqlModel.data(1,1);
            }
        }
    }
    Rectangle{
        id: superTheme
        width: root.width
        height: root.height
        color: "purple"
        y: root.height * 2
        opacity: 0
        Behavior on y {NumberAnimation{duration: 1200 ; easing.type: Easing.InBounce }}
        Behavior on opacity {NumberAnimation{duration: 900 }}
        MythThemeLoader{
            focus: true
            anchors.fill: superTheme
            themeFile:  appThemePath + "UbuntuSDK.qml"
        }
    }
    //    PreRecordedModel{}
    BonjourBackend{ id: backEnd }
    BonjourFrontend{id:frontEnd}
    ScriptLauncher{id:launcher}
//    MythSql{
//        id:connect

//    }
//    SqlQueryModel{
//        id: sqlModel
//        queryString: "SELECT * FROM program"

//    }
    DeviceInfo{id: foo}
//    MythChannels{id:channels}

}
