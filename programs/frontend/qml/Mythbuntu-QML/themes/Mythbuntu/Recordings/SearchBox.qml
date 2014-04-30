import QtQuick 2.0
import QtQuick.Controls 1.0
Item{
    width: 638
    height: 58
    property string searchText: textarea1.text
    TextArea {
        id: textarea1
        x: 177
        y: 189
        width: 638
        height: 58
        text: parent.searchText
        font.pointSize: 12

    }
}
