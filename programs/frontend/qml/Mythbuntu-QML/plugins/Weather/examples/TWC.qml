import QtQuick 2.0
import QtWebKit 3.0
WeatherDelegate{
    property string forTWC: forTWC
    id: weatherPasser
    width: parent.width
    height: parent.height
    anchors.fill: parent
Rectangle{
    id: rootangel
    color:"black"
    width: parent.width
    height: parent.height
    anchors.fill: parent

WebView {
    url: "http://www.weather.com/search/enhancedlocalsearch?where="+ forTWC
    height: rootangel.height
    scale: 1
    smooth: true
}    MouseArea{anchors.fill: parent; onClicked: console.log(forTWC)}
}

}
