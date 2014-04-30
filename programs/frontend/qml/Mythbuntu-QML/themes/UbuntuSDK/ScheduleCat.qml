import QtQuick 2.0
import Ubuntu.Components 0.1
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import MythTv 1.0
GridView {
        contentHeight: chanInfo.height
        contentWidth: chanInfo.width * 12
        cacheBuffer: 1000
        width: chanInfo.width * 12
        height: chanInfo.height // 4.2
        snapMode: GridView.SnapToRow
        flickableDirection: Flickable.HorizontalFlick
        cellHeight: scheduleRoot.height                  / 4.2
        cellWidth:/*{
            var n = showTime.text
            var startHere = n.substring(0, n.indexOf(" "))
            var i = endTime.text
            var endHere = i.substring(0, i.indexOf(" "))
            var d = endHere.replace(":","")
            var q = startHere.replace(":","")
            if(q - d  === "200")
            scheduleRoot.width / 2
            else if (q - d == 100)
                scheduleRoot.width / 4
            else if (q - d == 30 )
                scheduleRoot.width / 5
            else
                scheduleRoot / 6*/

//            }
         scheduleRoot.width / 4
        clip: true
        model: scheduleChannel
        delegate: Item {
            width: scheduleRoot.width / 4

            height: scheduleRoot.height / 4.2

            MouseArea{
             anchors.fill: slipp
             onClicked: {
                 var n = showTime.text
                 var startHere = n.substring(0, n.indexOf(" "))
                 var i = endTime.text
                 var endHere = i.substring(0, i.indexOf(" "))
                 var d = endHere.replace(":","")
                 var q = startHere.replace(":","")

                 //                 if (startHere - endHere !== 1 ){
//                     scheduleRoot.width / 4
                     console.log(d  - q  )
//                     }else {
//                     console.log(startHere - endHere )
//                     scheduleRoot.width
             }
            }
            UbuntuShape{
                id:slipp
                width: scheduleRoot.width / 4
                height: scheduleRoot.height / 4.2
                color: "grey"
            }
          Column{
            Text {
                id: show
                text: Title
                color: "white"
                font.pixelSize: parent.height / 5
            }
            Text {
                id: showTime
                text: Qt.formatDateTime(StartTime , "h:mm ap")
            } Text {
                id: endTime
                text: Qt.formatDateTime(EndTime , "h:mm ap")
            }
        }
        }
    XmlListModel {
        id: scheduleChannel
        source: DataBase.ipAddress()+":"+DataBase.port()+"/Guide/GetProgramGuide?StartTime="+Util.now.toISOString()+"&EndTime="+Util.time2.toISOString()+"&StartChanId="+ChanId+"&NumChannels=1"+"&Details=true&Ascending=true"
        query: "/ProgramGuide/Channels/ChannelInfo/Programs/Program"
        XmlRole {name: "StartTime"; query: "StartTime/string()"}
        //        XmlRole {name: "chanchan"; query: "..ChanId/string()"}
        XmlRole { name: "EndTime"; query: "EndTime/string()" }
        XmlRole { name: "Title"; query: "Title/string()" }
        XmlRole{name: "SubTitle"; query: "SubTitle/string()" }
        XmlRole{name: "Category"; query: "Category/string()" }
        XmlRole{name: "CatType"; query: "CatType/string()" }
        XmlRole{name: "Repeat"; query: "Repeat/string()" }
        XmlRole{name: "VideoProps"; query: "VideoProps/string()" }
        XmlRole{name: "AudioProps"; query: "AudioProps/string()" }
        XmlRole{name: "SubProps"; query: "SubProps/string()" }
        XmlRole{name: "Description"; query: "Description/string()" }

        XmlRole{name: "Status"; query: "Recording/Status/string()" }
        XmlRole{name: "Priority"; query: "Recording/Priority/string()" }
        XmlRole{name: "RecordId"; query: "Recording/RecordId/string()" }
        XmlRole{name: "RecGroup"; query: "RecGroup/RecGroup/string()" }
        XmlRole{name: "PlayGroup"; query: "Recording/PlayGroup/string()" }
        XmlRole{name: "StorageGroup"; query: "Recording/StorageGroup/string()" }
        XmlRole{name: "RecType"; query: "Recording/RecType/string()" }
        XmlRole{name: "DupInType"; query: "Recording/DupInType/string()" }
        XmlRole{name: "DupMethod"; query: "Recording/DupMethod/string()" }
        XmlRole{name: "EncoderId"; query: "Recording/EncoderId/string()" }
        XmlRole{name: "Profile"; query: "Recording/Profile/string()" }
        XmlRole{name: "ArtworkInfos"; query: "Artwork/ArtworkInfos/string()" }

        //debug
        onStatusChanged: {
            if (status === XmlListModel.Ready){console.log("Loaded .. .. ... .. " + source) }

            if (status === XmlListModel.Loading) console.log("Loading");

            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + source.toString());
        }
//        onCountChanged: {
//            console.log("Count changed to: " + count)
//        }
    }
}

