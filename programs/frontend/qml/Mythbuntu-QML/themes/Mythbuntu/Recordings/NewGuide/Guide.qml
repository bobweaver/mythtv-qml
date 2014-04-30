import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import MythTv 1.0
import QtQuick.XmlListModel 2.0
import QtQuick.Window 2.0
import "../"

Image{
    id: homeChannelRec
    source: "../../background.png"
    width: Screen.width
    height: Screen.height
    //    Preview{
    //        width: Screen.width
    //        height: Screen.height
    //        opacity: 0
    //    }
    //    SearchGuide{
    //        id: searchGuide
    //        opacity:  0
    //        y: -parent.height * 2
    //        anchors.centerIn: parent
    //}
    //        GuideHeader{

    //        }

    TimeLine{
//        width: Screen.width
//        height: Screen.height


    }

    //DONE
    //    ChannelIcons{
    //        id:icons
    //        width: Screen.width / 8
    //        height: Screen.height
    //        chanHeight: 80
    //    }




    //        Channels{
//                width: Screen.width
//                height: Screen.height
    //        }
    MythActivityVideo {
        id: buyfferIndicator
        anchors.centerIn: parent
        width: Screen.width
        height: Screen.height
    }
    XmlListModel {
        id: schedule
        source:DataBase.ipAddress()+":"+DataBase.port()+"/Guide/GetProgramGuide?StartTime="+Util.now.toISOString()+"&EndTime="+Util.time2.toISOString()
        query: "//ProgramGuide/Channels/ChannelInfo"
        XmlRole {name: "ChanId"; query: "ChanId/string()"}
        XmlRole { name: "ChanNum"; query: "ChanNum/string()" }
        XmlRole { name: "CallSign"; query: "CallSign/string()" }
        XmlRole{name: "IconURL"; query: "IconURL/string()" }
        XmlRole{name: "ChannelName"; query: "ChannelName/string()" }
        //debug
        onStatusChanged: {
            if (status == XmlListModel.Ready){
                buyfferIndicator.opacity = 0
                buyfferIndicator.running = false
                console.log("Loaded Joseph this is what to do " + source)
            }
            if (status === XmlListModel.Loading){
                buyfferIndicator.opacity = 1
                buyfferIndicator.running = true
                //                    console.log("Loading " + source);
            }
            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + schedule.source.toString());
        }
    }


    XmlListModel {
        id: scheduleSingle
        source: ""
        query: "//Program"
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

        XmlRole {name: "ChanId"; query: "Channel/ChanId/string()"}
        XmlRole { name: "ChanNum"; query: "Channel/ChanNum/string()" }
        XmlRole { name: "CallSign"; query: "Channel/CallSign/string()" }
        XmlRole{name: "IconURL"; query: "Channel/IconURL/string()" }
        XmlRole{name: "ChannelName"; query: "Channel/ChannelName/string()" }
        onStatusChanged: {
            if (status == XmlListModel.Ready){
                buyfferIndicator.opacity = 0
                buyfferIndicator.running = false
            }
            if (status === XmlListModel.Loading){
                buyfferIndicator.opacity = 1
                buyfferIndicator.running = true
            }
            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + schedule.source.toString());
        }
    }
}
