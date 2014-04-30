import QtQuick 2.0
import QtQuick.Window 2.0
Item{
    property string maxheight: maxHeight.text
    property string maxwidth: maxWidth.text
    Text {
        id:maxWidth
        text: Screen.width
        color:"transparent"
    }
    Text {
        id: maxHeight
        text: Screen.height
        color: "transparent"
    }
}
