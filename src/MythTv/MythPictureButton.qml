import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import "dbUtil.js" as DataBase
import "Util.js" as Util
Item{
    width:  parent.width
    height:     parent.height
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias buttonImage: img.source
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias  name: themeName.text
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias buttonWidth: img.width
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias buttonHeight: img.height
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string nameColor: themeName.color
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string nameStyle: themeName.style
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string nameStyleColor: themeName.styleColor
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property  int namePxSize: themeName.font.pixelSize
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    signal buttonClicked

    BorderImage {
        id: img
        source:  buttonImage
        width: parent.width
        height: parent.height
        state: activeFocus  === true ? "selected" : ""
        border.left: 5; border.top: 5
        border.right: 5; border.bottom: 5
        MouseArea{
            id:themeMouseArea
            anchors.fill: img
            hoverEnabled: true
            enabled: true
            focus: parent.focus
            onEntered: themeRec.state = "hovered"
            onExited: themeRec.state = ""
            onClicked: {
                buttonClicked()
               img.state = "pushed"
            }
        }
        Text {
            id: themeName
            text:  [undefined]   ? "" : name
            style:  [undefined]  ? Text.Normal  : nameStyle
            styleColor:   [undefined]  ? "grey" :  nameStyleColor
            anchors.centerIn: themeMouseArea
            font.pixelSize:  [undefined]  ? buttonWidth / 13 : namePxSize
            color:  [undefined]  ? "white" : nameColor
        }
    }
}
