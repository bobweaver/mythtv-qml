import QtQuick 2.0
import  MythTv 1.0
Rectangle{
    property string name: boolOText.text
    property string nameColor: boolOText.color
    property bool checked :checkBox.clicked
    signal optionClicked
    id:boolORec
    width: parent.width
    height: parent.height
    radius: 0
    border.color: "#55FFFFFF"
    border.width: 1
    gradient: Gradient {
        GradientStop { position: 0; color: "#12000000"}
        GradientStop { position: 0.5; color: "#44808080"}
        GradientStop { position: 1; color: "#12000000"}
    }
    x: status === Rectangle.Ready ? 0 : 1
    Behavior on x {NumberAnimation{from: parent.width * 2; to: 0 ;duration:  1600 ;easing.type: Easing.OutQuint}}
    Text {
        id: boolOText
        color: nameColor
        font.pixelSize: boolORec.height / 4
        text: name
        anchors{
            left: boolORec.left
            leftMargin: boolORec.width / 20
            verticalCenter: boolORec.verticalCenter
        }
    }


    Image{
        id: boolOButtonRec
        width: parent.width / 20
        height:  parent.height / 2
        source: "../shared/checkbox_background_selected.png"
        anchors{
            right: parent.right
            rightMargin: parent.width / 12.5
            verticalCenter: boolORec.verticalCenter

        }
        MythButton {
        id: checkBox
        anchors.fill: boolOButtonRec
        property bool clicked : false
        onButtonClick: {
            clicked = !clicked
        optionClicked()
        }
    }
        Image{
            id:boolOButton
            source: "../shared/checkbox_fullcheck.png"
            visible: checkBox.clicked === true ? true : false
            anchors{
                fill: checkBox
            }
        }

}
}
