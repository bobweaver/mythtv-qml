import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import "dbUtil.js" as DataBase
Item{
    id: rootItem
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int w: rootItem.width
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int h: rootItem.height
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string name: nameId.text
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    signal bannerClicked()

    width: w
    height: h
    //    color:"transparent"
    GridView{
        width: rootItem.width
        height:  rootItem.height * 2
        flow: GridView.TopToBottom
        cacheBuffer: 1000
        contentWidth: rootItem.width
        contentHeight: rootItem.height
        cellWidth: rootItem.width
        cellHeight: rootItem.height / 5
        model: recordingRulesModel
        delegate: Item {
            width: parent.width
            height:    parent.height
            Image{
                id: banner
                source:  DataBase.ipAddress()+":6544/Content/GetRecordingArtwork?Inetref="+init.text+"&Type=banner"
                anchors.fill:  baseRec
            }
            Rectangle{
                id: baseRec
                height:  rootItem.h   / 5
                width: parent.width
                radius: 8
                color: "transparent" //banner.status === Image.Error ? "" : "transparent"
                border.width:  5
                border.color: "#88FFFFFF"
            }
            MouseArea{
                id: bannerMouse
                anchors.fill: baseRec
                onClicked: {
                    bannerClicked()
                    titles.text = nameId.text   //nameId.text
                    coverart.source = DataBase.ipAddress()+":6544/Content/GetRecordingArtwork?Inetref="+Inetref+"&Type=coverart"
                    desc.text = des.text
                    fanart.source = DataBase.ipAddress()+":6544/Content/GetRecordingArtwork?Inetref="+Inetref+"&Type=fanart"
                    seasonNumber.text = sea.text
                    epNumber.text = ep.text
                }
                Component.onCompleted: {
                    bannerMouse.clicked
                }
            }
            Row{
                height:  rootItem.h   / 5
                spacing: parent.height / 3
                width: parent.width
                anchors.verticalCenter: baseRec.verticalCenter
                Text {
                    id:  nameId
                    text: title
                    color: banner.status === Image.Error ? "green" : "transparent"
                }
                Text {
                 id:init
                    text: Inetref
                    color: "white"
                font.pixelSize: 128
                }
                Text {
                    id:  channelID
                    text: CallSign
                    color: banner.status === Image.Error ? "green" : "transparent"
                }

                Text {
                    id:  rp
                    text: rPriority
                    color: banner.status === Image.Error ? "green" : "transparent"
                }
                Text {
                    id: des
                    text: Description
                    color:"transparent"
                }
                Text {
                    id: sea
                    text: Season
                    color:"transparent"
                }
                Text {
                    id: ep
                    text: Episode
                    color:"transparent"
                }

            }
        }
    }

    XmlListModel{
        id: recordingRulesModel
        source:  DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/GetUpcomingList"  //StartIndex= id & Count= 1
        query: "//ProgramList/Programs/Program"
        XmlRole{name: "startTime" ; query: "StartTime/string()"}
        XmlRole{name: "endTime" ; query: "EndTime/string()"}
        XmlRole{name: "title" ; query: "Title/string()"}
        XmlRole{name: "subs" ; query: "SubTitle/string()"}
        XmlRole{name: "category" ; query: "Category/string()"}
        XmlRole{name: "catType" ; query: "CatType/string()"}
        XmlRole{name: "repeat" ; query: "Repeat/string()"}
        XmlRole{name: "vidProps" ; query: "VideosProps/string()"}
        XmlRole{name: "fileName" ; query: "FileName/string()"}
        XmlRole{name: "Description" ; query: "Description/string()"}
        XmlRole{name: "Inetref" ; query: "Inetref/string()"}
        XmlRole{name: "Season" ; query: "Season/string()"}
        XmlRole{name: "Episode" ; query: "Episode/string()"}
        //        channel Info
        XmlRole{name: "chanID" ; query: "Channel/ChanId/string()"}
        XmlRole{name: "CallSign" ; query: "Channel/CallSign/string()"}
        XmlRole{name: "SourceId" ; query: "Channel/SourceId/string()"}
        XmlRole{name: "rStatus" ; query: "Recording/Status/string()"}
        XmlRole{name: "rPriority" ; query: "Recording/Priority/string()"}
        XmlRole{name: "rStartTs" ; query: "Recording/StartTs/string()"}
        XmlRole{name: "rEndTs" ; query: "Recording/EndTs/string()"}
        XmlRole{name: "rRecordId" ; query: "Recording/RecordId /string()"}
        XmlRole{name: "rRecGroup" ; query: "Recording/RecGroup/string()"}
        XmlRole{name: "rPlayGroup" ; query: "Recording/PlayGroup/string()"}
        XmlRole{name: "rStorageGroup" ; query: "Recording/StorageGroup/string()"}
        XmlRole{name: " rRecType" ; query: "Recording/RecType/string()"}
        XmlRole{name: "rProfile" ; query: "Recording/Profile/string()"}
        //coverart
        XmlRole{name: "aURL1" ; query: "Artwork/ArtworkInfos/ArtworkInfo[1]/URL/string()"}
        XmlRole{name: "aFileName1" ; query: "Artwork/ArtworkInfos/ArtworkInfo[1]/FileName/string()"}
        XmlRole{name: "aStorageGroup1" ; query: "Artwork/ArtworkInfos/ArtworkInfo[1]/StorageGroup/string()"}
        XmlRole{name: "aType1" ; query: "Artwork/ArtworkInfos/ArtworkInfo[1]/Type/string()"}
        //fanart
        XmlRole{name: "aURL2" ; query: "Artwork/ArtworkInfos/ArtworkInfo[2]/URL/string()"}
        XmlRole{name: "aFileName2" ; query: "Artwork/ArtworkInfos/ArtworkInfo[2]/FileName/string()"}
        XmlRole{name: "aStorageGroup2" ; query: "Artwork/ArtworkInfos/ArtworkInfo[2]/StorageGroup/string()"}
        XmlRole{name: "aType2" ; query: "Artwork/ArtworkInfos/ArtworkInfo[2]/Type/string()"}
        onStatusChanged: {
            //debug
            //         if (status == XmlListModel.Ready){console.log(videoNfo.source.toString())}
            //            if (status === XmlListModel.Loading) console.log("Loading");
            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + videoNfo.source.toString());
        }
    }
}
