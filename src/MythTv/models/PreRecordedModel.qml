import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import  QtQuick.LocalStorage 2.0
import  "../dbUtil.js" as DataBase

Item {
    id:preRecItem
    property variant pR: null
    XmlListModel{
        id: videoNfo
        source: DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/GetRecordedList?Details=true"
        query: "/ProgramList/Programs/Program"
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
        XmlRole{name: "chanID" ; query: "Channel/ChanId/string()"}
        XmlRole{name: "CallSign" ; query: "Channel/CallSign/string()"}
        XmlRole{name: "rStatus" ; query: "Recording/Status/string()"}
        XmlRole{name: "rPriority" ; query: "Recording/Priority/string()"}
        XmlRole{name: "rStartTs" ; query: "Recording/StartTs/string()"}
        XmlRole{name: "rEndTs" ; query: "Recording/EndTs/string()"}
        XmlRole{name: "rRecordId " ; query: "Recording/RecordId /string()"}
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
            if (status == XmlListModel.Ready){
                if (count > 0 )
                  preRecItem.pR =  videoNfo.get(0)
            DataBase.createPreRecTable()
                DataBase.truncatePreRecorded(count)
                function insertIntoPreRecTable() {
                    var db = DataBase.preRecordedDatabase()
for (var i=0; i<count; i++)
                    db.transaction(
                                function(tx) {
                                    tx.executeSql('INSERT INTO mythbuntu_prerec_table VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',
                                                  [i,
                                                   videoNfo.get(i).startTime,
                                                   videoNfo.get(i).endTime ,
                                                   videoNfo.get(i).title ,
                                                   videoNfo.get(i).subs ,
                                                   videoNfo.get(i).category,
                                                   videoNfo.get(i).catType,
                                                   videoNfo.get(i).repeat ,
                                                   videoNfo.get(i).vidProps ,
                                                   videoNfo.get(i).fileName ,
                                                   videoNfo.get(i).Description,
                                                   videoNfo.get(i).Inetref ,
                                                   videoNfo.get(i).Season ,
                                                   videoNfo.get(i).Episode,
                                                   videoNfo.get(i).chanID ,
                                                   videoNfo.get(i).CallSign ,
                                                   videoNfo.get(i).rStatus ,
                                                   videoNfo.get(i).rPriority ,
                                                   videoNfo.get(i).rStartTs,
                                                   videoNfo.get(i).rEndTs ,
                                                   videoNfo.get(i).rRecordId ,
                                                   videoNfo.get(i).rRecGroup ,
                                                   videoNfo.get(i).rPlayGroup ,
                                                   videoNfo.get(i).rStorageGroup,
                                                   videoNfo.get(i).rRecType,
                                                   videoNfo.get(i).rProfile ,
                                                   videoNfo.get(i).aURL1 ,
                                                   videoNfo.get(i).aFileName1,
                                                   videoNfo.get(i).aStorageGroup1 ,
                                                   videoNfo.get(i).aType1,
                                                   videoNfo.get(i).aURL2 ,
                                                   videoNfo.get(i).aFileName2 ,
                                                   videoNfo.get(i).aStorageGroup2,
                                                   videoNfo.get(i).aType2
                                                  ]);
}
                                )
                }
                insertIntoPreRecTable()
            }
        }
    }
}
