import QtQuick 2.0

Rectangle{
    property string name: formFactorText.text
    property string nameColor: formFactorRec.color
    property string image: formFactorButton.source
    id:formFactorRec
    width: parent.width
    height: parent.height
    border.color: "#55FFFFFF"
    border.width: 1
    gradient: Gradient {
        GradientStop { position: 0; color: "#12000000"}
        GradientStop { position: 0.5; color: "#44808080"}
        GradientStop { position: 1; color: "#12000000"}
    }
    x: status === Rectangle.Ready ? 0 : 1
    Behavior on x {NumberAnimation{from: 1300; to: 0 ;duration:700 ;easing.type: Easing.OutQuint}}
    MouseArea{
        anchors.fill: formFactorRec
        onClicked:{
            console.log("formfactor-settings-clicked")
        }
    }
    Text {
        id: formFactorText
        color: nameColor
        font.pixelSize: formFactorRec.height / 4
        text: name
        anchors{
            left: formFactorRec.left
            leftMargin: formFactorRec.width / 20
            verticalCenter: formFactorRec.verticalCenter
        }
    }
    Rectangle{
        id: formFactorButtonRec
        height: formFactorRec.height - 3
        width: formFactorRec.height - 3
        radius: 0
        border.color: "#55FFFFFF"
        border.width: 1
        gradient: Gradient {
            GradientStop { position: 0; color: "#12000000"}
            GradientStop { position: 0.5; color: "#44808080"}
            GradientStop { position: 1; color: "#12000000"}
        }
        anchors{
            right: parent.right
            rightMargin: parent.width / 20
            verticalCenter: formFactorRec.verticalCenter
        }
        Image{
            id: formFactorButton
            source: image
            anchors{
                fill: formFactorButtonRec
                margins: 10
            }
        }
    }
}
