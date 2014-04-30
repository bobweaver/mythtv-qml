import QtQuick 2.0
//import "qmlvideofx"
Rectangle {
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string content
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string parameterPanel
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias backgroundColor: rootSettingsTangle.color
    id: rootSettingsTangle
    width: parent.width
    height: parent.height
    color: parent.backgroundColor

}//roottangle
