import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import MythTv 1.0
BorderImage {
    id: bkbutton
    source: "../music/button_background.png"
    width: parent.buttonWidth
    height: parent.buttonHeight
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5
    BorderImage{
        id: themeRec
        anchors.fill: bkbutton
        state: activeFocus  === true ? "selected" : ""
        border.left: 5; border.top: 5
        border.right: 5; border.bottom: 5
        source:  {
//            if (activeFocus === true )
            if (state === "selected")
                "../music/button_selected_background.png"
            if (state === "pushed")
                "../music/button_pushed_background.png"
            if (state === "hovered")
                "../music/button_selected_background.png"
            else
                "../music/button_background.png"
        }
        MouseArea{
            id:themeMouseArea
            anchors.fill: themeRec
            hoverEnabled: true
            enabled: true
            focus: parent.focus
            onEntered: themeRec.state = "hovered"
            onExited: themeRec.state = ""
            onClicked: {
//                clicked()
                themeRec.state = "pushed"
            }

        }
        Text {
            id: themeName
            text: ""
            style: Text.Raised
            styleColor:  "grey"
            anchors.centerIn: themeMouseArea
            font.pixelSize: buttonWidth / 13
//            font.pixelSize: themeRec.state === "selected" ? parent.height / 1.5  : parent.height / 1.7
            color: "white"
        }
    }
        property alias  name: themeName.text
        property alias buttonWidth: bkbutton.width
        property alias buttonHeight: bkbutton.height
        property bool foCus: false
        signal clicked

}
