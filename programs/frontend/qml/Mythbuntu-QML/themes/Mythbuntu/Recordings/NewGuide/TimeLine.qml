import QtQuick 2.0
Item{
    width: parent.width
    height: parent.height
    Flickable{
        width: parent.width
        height: parent.height / 4
        contentWidth: parent.width * 12
        Row{
            spacing: 12
            Repeater{
                model: 12
                    Rectangle{
                        width: parent.width /  4
                        height: parent.height  / 8
                        color: "green"
                    }
                }
            }
        }
    }

