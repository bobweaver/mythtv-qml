import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import MythTv 1.0
Image {
    id: bkbutton
    source: "../music/button_background.png"
    width: parent.buttonWidth
    height: parent.buttonHeight
    Image{
        id: themeRec
        state: ""
        source:  {
            if (state === "selected")
                "../music/button_selected_background.png"
            else
                "../music/button_pushed_background.png"
        }

        MouseArea{
            id:themeMouseArea
            anchors.fill: themeRec
            hoverEnabled: true
            onEntered: themeRec.state = "hovered"
            onClicked: {
                clicked()
            }
        }
        Text {
            id: themeName
            text: ""
            anchors.centerIn: themeMouseArea
            font.pixelSize: themeRec.state === "selected" ? 17 : 13
            color: "white"
        }
        property alias  name: themeName.text
        property alias buttonWidth: bkbutton.width
        property alias buttonHeight: bkbutton.height
        signal clicked
    }
}
