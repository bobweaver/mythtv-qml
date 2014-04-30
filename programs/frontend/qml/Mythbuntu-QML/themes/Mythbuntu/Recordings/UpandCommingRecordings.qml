import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.XmlListModel 2.0
import  MythTv 1.0
Image{
    id:rootUpandComing
    width:     parent.width
    height:    parent.height
    source: "../background.png"
    Rectangle{
        id: tester
        anchors.fill:  parent
        color: "transparent"
        ListView{
            width:    rootUpandComing.width
            height:  rootUpandComing.height
            model: upandcomingModel
            delegate: Item {
                width: rootUpandComing.width
                height: rootUpandComing.height
                Text{
                    id: testingNumber
                    text: Count
                    font.pixelSize: 64
                    color:"transparent"
                }
                Text {
                    id: noRecordings
                    font.pixelSize:  Math.round(rootUpandComing.width / 30 )
                    color: "white"
                    text: {
                        var t1 = parseInt(testingNumber.text)
                        var t2 = parseInt(testingNumber.text)
                        if (t1+t2 > 1)
                            ""
                        else
                            "There are No Up and Coming Recording"
                    }
                    anchors.centerIn: parent
                }
                MythUpandComingRecording{
                    //    opacity: noRecordings.text = "" ? 1 : 0
                    width:    rootUpandComing.width
                    height:  rootUpandComing.height
                }
            }
        }
    }
    XmlListModel{
        id: upandcomingModel
        source: DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/GetUpcomingList"
        query: "//ProgramList"
        XmlRole{name:"Count" ; query: "Count/string()"}
    }
}
