import QtQuick 2.0
import QtWebKit 3.0
Rectangle {
    property string engineUrl: engine.url
    width: 1
    height: 1
    color: "transparent"
    WebView{
        id: engine
        url: parent.engineUrl
    }
}
