import QtQuick 2.0
import QtWebKit 3.0
Rectangle{
    property string number: buttonCirTxt.text
    property string sizeWidth: buttonCir.width
    property string sizeHeight: buttonCir.height
    property string cirClicked: buttonCirMouseArea.onClicked
    property url engineCirUrl: engineCir.url
//    property color  numberColor: buttonCirTxt.color
//    property int  numberFontSize: buttonCirTxt.font.pixelSize
    color: "transparent"
Rectangle{
    id: buttonCir
     radius: 180
     width:  parent.sizeWidth
     height:   parent.sizeHeight
     color: "grey"
     border.color: "#55FFFFFF"
     border.width: 1
     MouseArea{
      id :buttonCirMouseArea
      anchors.fill: buttonCir
//      onClicked:""
     }
     Text {
         id: buttonCirTxt
         text: parent.number
        color: "white" //parent.numberColor
        font.pixelSize: parent.width //numberFontSize
        anchors.centerIn: buttonCirMouseArea
 }
     Rectangle {
         width: 1
         height: 1
         anchors.centerIn: buttonCirTxt
         color: "transparent"
         WebView{
             id: engineCir
             url: parent.engineUrl
         }





























     }
}
}
