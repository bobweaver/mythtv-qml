import QtQuick 2.0
Item {
    id: progresDialog
    width: parent.width
    height: parent.height
    property alias text: progresText.text
    Rectangle {
        id: background
        anchors.fill: parent
        border.color: "#55FFFFFF"
        radius: 4
        border.width: 0
        gradient: Gradient {
            GradientStop { position: 0; color: "#77000000"}
            GradientStop { position: 0.9; color: "#66808080"}
            GradientStop { position: 1; color: "#77000000"}
        }
    }
    Text {
        id: progresText
        text: ""
        width: parent.width - 40
        color: "white"
        font.pixelSize: 20
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 20
        }
    }

    Image {
        id: indicatorImg
        width: 128
        height: 128
        smooth: true
        //FIX ME
        sourceSize.height:  height
        sourceSize.width: width
        source: "/usr/share/unity/5/launcher_bfb.png"
        anchors{
            verticalCenter:  parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        RotationAnimation {
            target: indicatorImg;
            running: true
            loops: Animation.Infinite
            duration: 1200
            direction: RotationAnimation.Clockwise
//            from: 0
//            to: 360
        }
    }
}
