import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Window 2.0
import QtQuick.XmlListModel 2.0
import MythTv 1.0
Image {
    id: rootTheme
    width: maxWidth.text
    height: maxHeight.text
    source: "../background.png"
    Text {
        id: header
        text: qsTr("Theme Chooser")
        font.pixelSize: parent.height / 18
        color: "white"
    }
    ListView{
        height: rootTheme.height
        anchors.top: header.bottom
        width:  rootTheme.width
        spacing: parent.height /30
        model: themeModel
        delegate: Item{
            height: rootTheme.height / 8
            width:  rootTheme.width
            ThemeButton{
                id: themeOne
                buttonWidth:  rootTheme.width / 2
                buttonHeight:  rootTheme.height / 8
                iconShown: 1
                iconSource:{
                    if  (iconStatus !== Image.Error )
                       return  Qt.resolvedUrl("../../"+nameId.replace("\ ","-") +"/images/preview.png")
                    else
                        return "../../"+nameId.replace("\ ","-") +"/preview.png"

                }
                name: nameId
                enabled: true

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
                textColor: "white"
                textEffectColor: "grey"
                textEffect: Text.Raised
                textpxSize: parent.height / 2
                iconX: buttonWidth / 22
            }
            MouseArea{
                anchors.fill:     themeOne
                hoverEnabled: true
                onEntered: {
                    smappleArtImage.source = themeOne.iconSource
                    aboutThemeTxt.text = description1
                    themeNameExtra.text = nameId  //+ "\n t" + description1
                }
                onExited: {
                    smappleArtImage.source = ""
                    aboutThemeTxt.text = ""
                    themeNameExtra.text = ""

                }

            }
        }
            Image {
                id: smappleArtImage
                source:""
                width: rootTheme.width / 2.3
                height: rootTheme.height / 1.9
                anchors.right: parent.right
            }
            Column{
                id:columnText
                width: rootTheme.width / 2.3
                height: rootTheme.height / 1.9
                anchors.top: smappleArtImage.bottom
                anchors.left:  smappleArtImage.left
                Text {
                    id: themeNameExtra
                    color: "white"
                    font.pixelSize:  rootTheme.width / 30
                    font.italic:  true
                    text: ""
                }
                //                Text {
                //                id: authorText
                //                color:"white"
                //                text: aName + " <" + email + ">"
                //            }
                Text{
                    id:aboutThemeTxt
                    width: columnText.width
                    text: ""
                    font.pixelSize:  rootTheme.width / 40
                    color: "white"
                    wrapMode: Text.WordWrap
                }

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
    Image {
        id: name
           }
    XmlListModel{
        id: themeModel
        source: "../../../examples/themes.xml"
        query: "/themes/themeinfo"
        XmlRole{name: "nameId" ; query: "name/string()"}
        XmlRole{name: "description1" ; query: "detail/description/string()"}
    }
    XmlListModel{
        id: themeModelOne
        source: "../../../examples/themes.xml"
        query: "/themes/themeinfo/author"
        XmlRole{name: "aName" ; query: "name/string()"}
        XmlRole{name: "email"; query: "email/string()"}
    }
}
