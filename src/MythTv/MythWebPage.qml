import QtQuick 2.0
import  QtWebKit 3.0
Rectangle {
    width: parent.width
    height: parent.height
WebView{
    id:webView
 anchors.fill: parent
 url: parent.source
}
/*!
  \preliminary
  The background Image that one wants to use for there Coverflow page
  */
property string  source: webView.url
}
