import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.Window 2.0
Item{
    property string delText: name.text
    Text {
        id: name
        text: parent.delText
        color: "white"
        font.pixelSize: 18
    }
}
