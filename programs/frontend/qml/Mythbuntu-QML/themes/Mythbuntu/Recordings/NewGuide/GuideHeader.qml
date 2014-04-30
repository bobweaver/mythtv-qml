import QtQuick 2.0
Rectangle{
    id: header
    height: parent.height / 3
    width: parent.width
    color: "#881f066f"

Text {
    id: descText
    text: ""
    color: "white"
    font.pixelSize: height / 8
    width: parent.width / 1.6
    height:    parent.height
    wrapMode: Text.WordWrap

    anchors{
        top: parent.top
        horizontalCenter: parent.horizontalCenter
}
}
Image{
    id: guideImage
    height:    parent.height / 2
    width:  parent.height / 2
    source: ""
    anchors{
     verticalCenter: parent.verticalCenter
     left: parent.left
     leftMargin: parent.width / 22
    }

}
Image {
    id: searchImg
    source: "../../search_icon.png"
    height:    parent.height / 8
    width:     parent.width / 12
    anchors{
        right:  parent.right
    }
}MouseArea{
    anchors.fill: searchImg
onClicked: {
    searchGuide.opacity = 1
    searchGuide.y = 0
}
}
}
