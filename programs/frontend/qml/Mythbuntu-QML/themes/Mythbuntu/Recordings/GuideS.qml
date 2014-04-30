import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import MythTv 1.0
import "../common/qtlook.js" as Theming
Flickable {
    property int hourSize

//    property variant startOfTimeline
//    property variant endOfTimeline
//    property variant referenceTime
//    property variant currentTime
//    property real scrollPosition
//    property real viewportWidth
//    property variant selectionTracker: null
//    property bool isAlternateRow
//    property bool isSelected
//    property alias items: broadcasts
//    property int selectedBroadcast: -1

    width: parent.width
    height: parent.height
    clip: true
    flickableDirection: Flickable.HorizontalFlick

    ListView {
        width: parent.width
        height: parent.height
        keyNavigationWraps: true
        spacing: 5
//        currentIndex: 0
        orientation: ListView.Horizontal
//        model: scheduleChannel
        LayoutMirroring.enabled: true
        LayoutMirroring.childrenInherit: true
        model:ListModel{
            id: broadcastModel
        }
        delegate: GuideBroadCast{
         id: broadcastDel
//         x:  xTime
        }
//    Component.onCompleted: positionViewAtBeginning()
    }
    XmlListModel {
        id: scheduleChannel
        source: DataBase.ipAddress()+":"+DataBase.port()+"/Guide/GetProgramGuide?StartTime="+Util.now.toISOString()+"&EndTime="+Util.time2.toISOString()+"&StartChanId="+ChanId+"&NumChannels=1"+"&Details=true&Ascending=true"
        query: "/ProgramGuide/Channels/ChannelInfo/Programs/Program"
        XmlRole {name: "StartTime"; query: "StartTime/string()"}
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
            if (status === XmlListModel.Ready){
//                            console.log(DataBase.ipAddress()+":"+DataBase.port()+"/Guide/GetProgramGuide?StartTime="+Util.now.toISOString()+"&EndTime="+Util.time2.toISOString()+"&StartChanId="+ChanId+"&NumChannels=1"+"&Details=true&Ascending=true")
                for (var i = 0 ;i < scheduleChannel.count; i++){
                    broadcastModel.append({
                                              'StartTime':scheduleChannel.get(i).StartTime,
                                              'EndTime':  scheduleChannel.get(i).EndTime,
                                              'Title': scheduleChannel.get(i).Title,
                                              'Category': scheduleChannel.get(i).Category,
                                              'SubTitle': scheduleChannel.get(i).SubTitle,
                                              'CatType': scheduleChannel.get(i).CatType,
                                              'Repeat': scheduleChannel.get(i).Repeat,
                                              'VideoProps': scheduleChannel.get(i).VideoProps,
                                              'AudioProps': scheduleChannel.get(i).AudioProps,
                                              'Description': scheduleChannel.get(i).Description,
                                              'Status': scheduleChannel.get(i).Status,
                                              'Priority': scheduleChannel.get(i).Priority,
                                              'RecordId': scheduleChannel.get(i).RecordId,
                                              'PlayGroup': scheduleChannel.get(i).PlayGroup,
                                              'StorageGroup': scheduleChannel.get(i).StorageGroup,
                                              'RecType': scheduleChannel.get(i).RecType,
                                              'DupInType': scheduleChannel.get(i).DupInType,
                                              'DupMethod': scheduleChannel.get(i).DupMethod,
                                              'EncoderId': scheduleChannel.get(i).EncoderId,
                                              'Profile': scheduleChannel.get(i).Profile,
                                              'ArtworkInfos': scheduleChannel.get(i).ArtworkInfos,
                                          })
                }
            }
            if (status === XmlListModel.Loading) console.log("Loading");
            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + source.toString());
        }
    }
}



//import QtQuick 2.0
//import QtQuick.XmlListModel 2.0
//import QtQuick.LocalStorage 2.0
//import MythTv 1.0
//import "../common/qtlook.js" as Theming

//ListView {
//    width: parent.width
//    height: parent.height
//    keyNavigationWraps: true
//    spacing: 5
//    currentIndex: 0
//    orientation: ListView.Horizontal
//    model: scheduleChannel
//    LayoutMirroring.enabled: true
//    LayoutMirroring.childrenInherit: true
//    delegate: Item {
//        width: slipp.width
//        height: scheduleRoot.height / 4.2
//        MouseArea{
//         id: slippMouse
//            anchors.fill: slipp
//            onClicked: {
//                var newerq = new Date(showTimeAdder.text)
//                var newerd = new Date(endTimeAdder.text)
//                var done = Math.abs(newerq - newerd)
//                function milliSecondsToString(milliseconds) {
//                    milliseconds = milliseconds > 0 ? milliseconds : 0
//                    var timeInSeconds = Math.floor(milliseconds / 1000)
//                    var minutes = Math.floor(timeInSeconds / 60)
//                    var minutesString = minutes < 10 ? "0" + minutes : minutes
//                    var seconds = Math.floor(timeInSeconds % 60)
//                    var secondsString = seconds < 10 ? "0" + seconds : seconds
//                    return minutesString
//                }
//                console.log(DataBase.ipAddress()+":"+DataBase.port()+ "/Guide/GetProgramDetails?ChanId="+ChanId+"&StartTime="+StartTime+"&Ascending=false"                            )

//                scheduleSingle.source   =  DataBase.ipAddress()+":"+DataBase.port()+ "/Guide/GetProgramDetails?ChanId="+ChanId+"&StartTime="+StartTime+"&Ascending=false"
//                previewsRec.y = 0
//                previewsRec.opacity = 1
//                scheduleMainPage.opacity = 0
//                scheduleMainPage.x =  scheduleRoot.width + 10
//            }
//        }

//        Rectangle{
//            id:slipp
//            width: {
//                var newerq = new Date(showTimeAdder.text)
//                var newerd = new Date(endTimeAdder.text)
//                var done = Math.abs(newerq - newerd)
//                function milliSecondsToString(milliseconds) {
//                    milliseconds = milliseconds > 0 ? milliseconds : 0
//                    var timeInSeconds = Math.floor(milliseconds / 1000)
//                    var minutes = Math.floor(timeInSeconds / 60)
//                    var minutesString = minutes < 10 ? "0" + minutes : minutes
//                    var seconds = Math.floor(timeInSeconds % 60)
//                    var secondsString = seconds < 10 ? "0" + seconds : seconds
//                    return minutesString
//                }
//                milliSecondsToString(done) * 9
//            }
//            height: scheduleRoot.height / 4.2
//            color: {
//                var cat = Category
//                var Cat = cat.toString()
//                Theming.guideColor(Cat)
//            }
//            radius: 8
//            border.width: 3
//            border.color: "#44FFFFFF"

//        }
//        Text {
//            id: show
//            text: titleX.text
//            color: "white"
//            opacity:  slipp.width < 50 ? 0  : 1
//            height: slipp.height
//            width:  slipp.width
//            wrapMode: Text.WordWrap
//            x: parent.width / 20
//            y: parent.height / 2
//            font.pixelSize: parent.height / 18
//        }
//        Text {
//            id: showTime
//            x: parent.width / 20
//            y: parent.height / 20
//            text:{
//                var sd = new Date(StartTime)
//                var ds = Util.fromUTC(sd).toString()
//                var newtime = new Date(ds)
//                var s = Qt.formatDateTime(newtime,"h:mm ap")
//                return s
//            }
//            color: "white"
//        }

//        Text {
//            id: endTime
//            text: {
//                var sd = new Date(EndTime)
//                var ds = Util.fromUTC(sd).toString()
//                var newtime = new Date(ds)
//                var s = Qt.formatDateTime(newtime,"h:mm ap")
//                return s
//            }
//            color:"white"
//            y: Math.round(parent.height / 1.27)
//            x: parent.width / 20
//        }

//        //#FIXME   remove this later
//        //workaround for some reason I could not get wrapmode to work when it is comming
//        //from the xml so placing it here
//        Text {
//            id: titleX
//            text: Title
//            color: "transparent"
//        }
//        Text {
//            id: showTimeAdder
//            text: StartTime
//            color: "transparent"
//        }
//        Text {
//            id: endTimeAdder
//            text: EndTime
//            color: "transparent"
//        }
//    }
//    XmlListModel {
//        id: scheduleChannel
//        source: DataBase.ipAddress()+":"+DataBase.port()+"/Guide/GetProgramGuide?StartTime="+Util.now.toISOString()+"&EndTime="+Util.time2.toISOString()+"&StartChanId="+ChanId+"&NumChannels=1"+"&Details=true&Ascending=true"
//        query: "/ProgramGuide/Channels/ChannelInfo/Programs/Program"
//        XmlRole {name: "StartTime"; query: "StartTime/string()"}
//        XmlRole { name: "EndTime"; query: "EndTime/string()" }
//        XmlRole { name: "Title"; query: "Title/string()" }
//        XmlRole{name: "SubTitle"; query: "SubTitle/string()" }
//        XmlRole{name: "Category"; query: "Category/string()" }
//        XmlRole{name: "CatType"; query: "CatType/string()" }
//        XmlRole{name: "Repeat"; query: "Repeat/string()" }
//        XmlRole{name: "VideoProps"; query: "VideoProps/string()" }
//        XmlRole{name: "AudioProps"; query: "AudioProps/string()" }
//        XmlRole{name: "SubProps"; query: "SubProps/string()" }
//        XmlRole{name: "Description"; query: "Description/string()" }

//        XmlRole{name: "Status"; query: "Recording/Status/string()" }
//        XmlRole{name: "Priority"; query: "Recording/Priority/string()" }
//        XmlRole{name: "RecordId"; query: "Recording/RecordId/string()" }
//        XmlRole{name: "RecGroup"; query: "RecGroup/RecGroup/string()" }
//        XmlRole{name: "PlayGroup"; query: "Recording/PlayGroup/string()" }
//        XmlRole{name: "StorageGroup"; query: "Recording/StorageGroup/string()" }
//        XmlRole{name: "RecType"; query: "Recording/RecType/string()" }
//        XmlRole{name: "DupInType"; query: "Recording/DupInType/string()" }
//        XmlRole{name: "DupMethod"; query: "Recording/DupMethod/string()" }
//        XmlRole{name: "EncoderId"; query: "Recording/EncoderId/string()" }
//        XmlRole{name: "Profile"; query: "Recording/Profile/string()" }
//        XmlRole{name: "ArtworkInfos"; query: "Artwork/ArtworkInfos/string()" }
//        //debug
//        onStatusChanged: {
//            if (status === XmlListModel.Ready){
//            console.log(DataBase.ipAddress()+":"+DataBase.port()+"/Guide/GetProgramGuide?StartTime="+Util.now.toISOString()+"&EndTime="+Util.time2.toISOString()+"&StartChanId="+ChanId+"&NumChannels=1"+"&Details=true&Ascending=true")
//            }
//            if (status === XmlListModel.Loading) console.log("Loading");
//            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + source.toString());
//        }
//    }
//}
