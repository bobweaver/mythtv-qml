import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.Particles 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Window 2.0
import MythTv 1.0
//import "../../../common/dbUtil.js" as DataBase
//import "../../../common/Util.js" as Util
Rectangle{
    id: root
    width: maxWidth.text - 10
    height: maxHeight.text - 10
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
            }
            MythPortBackend{
                id: portAdd
                width:  parent.width / 1.4
                height:  parent.height / 8

            }
        }
    }
    Rectangle{
        id:themeRec
        width: parent.width
        height:     parent.height / 3
        color: "transparent"
        anchors.bottom: parent.bottom
        Text {
            id: tname
            text: qsTr("Themes")
            color: "white"
            font.pixelSize: root.height / 20
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
            spacing:1
            ThemeButton{
                id: sdkTheme
                buttonWidth:  parent.width / 3
                buttonHeight:  parent.height / 3
                name: "UbuntuSDK"
                textColor: "white"
                iconShown: 1
                iconSource:{
                    if  (iconStatus === Image.Error )
                       return  "themes/"+name.replace("\ ","-") +"/images/preview.png"
                    else
                        return "themes/"+name.replace("\ ","-") +"/preview.png"
                }
                buttonBaseBackground:{
                    if (mouseState === "selected-hovered" )
                        "../music/button_selected_background.png"
                    if (mouseState === "pressed" )
                        "../themes/Mythbuntu/music/button_pushed_background.png"
                    if (mouseState === "selected" )
                        "../themes/Mythbuntu/music/button_selected_background.png"
                    if (mouseState === "hovered" )
                        "../themes/Mythbuntu/music/button_selected_background.png"
                    else
                        "../themes/Mythbuntu/music/button_background.png"
                }
            }


            ThemeButton{
                id: mythubuntuTheme
                buttonWidth:  parent.width / 3
                buttonHeight:  parent.height / 3
                name: "MythUbuntu"
                textColor: "white"
                iconShown: 1
                iconSource:{
                    if  (iconStatus === Image.Error )
                       return  "../preview.png"
                    else
                        return "../preview.jpg"
                }
                buttonBaseBackground:{
                    if (mouseState === "selected-hovered" )
                        "../music/button_selected_background.png"
                    if (mouseState === "pressed" )
                        "../music/button_pushed_background.png"
                    if (mouseState === "selected" )
                        "../music/button_selected_background.png"
                    if (mouseState === "hovered" )
                        "../music/button_selected_background.png"
                    else
                        "../music/button_background.png"
                }
            }
            ThemeButton{
                id: mythMediaStreamTheme
                buttonWidth:  parent.width / 3
                buttonHeight:  parent.height / 3
                name: "MythMediaStream"
                textColor: "white"
                buttonBaseBackground:{
                    if (mouseState === "selected-hovered" )
                        "../music/button_selected_background.png"
                    if (mouseState === "pressed" )
                        "../music/button_pushed_background.png"
                    if (mouseState === "selected" )
                        "../music/button_selected_background.png"
                    if (mouseState === "hovered" )
                        "../music/button_selected_background.png"
                    else
                        "../music/button_background.png"
                }
            }
        }
    }
    MythButton{
        width: root.width
        height: root.height / 10
        name: "Open Frontend"
        nameColor:  "white"
        buttonColor: "#33000000"
        onButtonClick: {
            superTheme.opacity = 1
            superTheme.y = 0
        }
        anchors.bottom:  parent.bottom
    }
    Image {
        id: mythImage
        source: "../../../artwork/mythbuntu.png"
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
                mythImage.state = ""
                mythImage.state = "Loaded"
                console.log(mythImage.state)
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
            anchors.fill: superTheme
        }
    }
    Text {
        id:maxWidth
        text: Screen.width
        color:"transparent"
    }
    Text {
        id: maxHeight
        text: Screen.height
        color: "transparent"
    }
}
