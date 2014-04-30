import QtQuick 2.0
//import MythDB 1.0
import ZeroConf 1.0
Rectangle
{
 width: 360
 height: 360
 color: "black"

 BonjourBackend{
     id: ser
//     service: "_mythbackend-master._tcp"
 }
 Text {
     id: name
     text: ""
     color: "white"
     font.pixelSize: 48

 }
 MouseArea
 {
  anchors.fill: parent
  onClicked: name.text = ser.getString();
}
}



//Rectangle {
//    width: 100
//    height: 62
//MouseArea{
//anchors.fill: parent
//onClicked: {

//    connect.createConnection()
////    sqlModel.makeModel("SELECT * FROM program")
//                    channels.getChannels("1081");
//}
//}
//ListView{
//    id: veiw
//    width: 100
//    height: 62
//    model: channels.getChannels("1081")
// delegate: Item{
//     width: 100
//     height: 62
//     Text {
//        text: model.starttime
//            color:"green"
//            font.pixelSize:  44
////            color: "black"
//    }
//}
//}
//    MythSql{
//        id:connect
//        hostName: "192.168.1.21"
//        databaseName: "mythconverg"
//        user: "mythtv"
//        password: "kweQI1U9"
//    }
//    MythChannels{id:channels}

//}
