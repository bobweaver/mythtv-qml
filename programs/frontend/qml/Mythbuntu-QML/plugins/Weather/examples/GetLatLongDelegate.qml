import QtQuick 2.0
import QtQuick.XmlListModel 2.0
//import Ubuntu.Components 0.1
Item {
    id: series
    signal clicked()
    x: 15
    width: listView.width - 3
    height: listView.width / 3.33
    Rectangle {
        color: bannerImg.status === Image.Error ? "#66000000" : "transparent"
        anchors.fill: parent
        border.color: "#00000000"
        border.width: 3
        smooth: true
    }
    Rectangle {
        id: bannerImg
        anchors.fill: parent
        color: "#22000000"
    }
    MouseArea {
        anchors.fill: parent
        onClicked:{series.clicked()}
    }
    Item {
        id: topLayout
        x: 20;
        width: parent.width;
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        Text {
            height: 20
            id: titleLabel
            text: "Name" +name+"\n"
                  +  adminName1+"\n"
                  + adminName2+"\n"
                  +"population:  "   +population+"\n"
                  +countryName +"\n"
                  +countryCode+"\n"
                  +elevation +"\n"
            color: "white"
            font.pixelSize: 12
            font.bold: true;
            wrapMode: Text.WordWrap

        }
    }
}
