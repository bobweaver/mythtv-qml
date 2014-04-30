import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.XmlListModel 2.0
import MythTv 1.0
import QtQuick.LocalStorage 2.0
Image {
    width: Screen.width / 1.3
    height: Screen.height / 1.3
    source:"../background.png"
    ListView{
        width: Screen.width / 1.3
        height: Screen.height / 1.3
        model: ListModel{
            id:searchModel
            function getSortedItems(searchTerm) {

                    // Clear the aux model
                    searchModel.clear();

                    // Add fitting items to the aux model
                    for (var i = 0; i < searchModel.count; i++) {
                        if (searchTerm === "" || namesModel.get(i).title.indexOf(searchTerm) === 0) {
                            filteredModel.append(namesModel.get(i));
                        }
                    }

                }
        }
        delegate: Text{
          id: searchDel
          text: Title
          color: "white"
          opacity:  1//searchMe.searchText === text ? 1 : 0
        font.pixelSize: 14
            }
    }
    SearchBox{
        id:searchMe
        searchText: "Search Guide"
        onSearchTextChanged: {
//            searchModel.clear()
//            scheduleChannelSearch.reload()
            console.log(searchMe.searchText)
        }
    }

    XmlListModel {
        id: scheduleChannelSearch
        source: DataBase.ipAddress()+":"+DataBase.port()+"/Guide/GetProgramGuide?StartTime="+Util.now.toISOString()+"&EndTime="+Util.time2.toISOString()+"&Details=true&Ascending=true"
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
        onStatusChanged: {
            if (status === XmlListModel.Ready){
                for (var i = 0 ;i < scheduleChannelSearch.count; i++){
                    searchModel.append({
                                           'StartTime':scheduleChannelSearch.get(i).StartTime,
                                           'EndTime':  scheduleChannelSearch.get(i).EndTime,
                                           'Title': scheduleChannelSearch.get(i).Title,
                                           'Category': scheduleChannelSearch.get(i).Category,
                                           'SubTitle': scheduleChannelSearch.get(i).SubTitle,
                                           'CatType': scheduleChannelSearch.get(i).CatType,
                                           'Repeat': scheduleChannelSearch.get(i).Repeat,
                                           'VideoProps': scheduleChannelSearch.get(i).VideoProps,
                                           'AudioProps': scheduleChannelSearch.get(i).AudioProps,
                                           'Description': scheduleChannelSearch.get(i).Description,
                                           'Status': scheduleChannelSearch.get(i).Status,
                                           'Priority': scheduleChannelSearch.get(i).Priority,
                                           'RecordId': scheduleChannelSearch.get(i).RecordId,
                                           'PlayGroup': scheduleChannelSearch.get(i).PlayGroup,
                                           'StorageGroup': scheduleChannelSearch.get(i).StorageGroup,
                                           'RecType': scheduleChannelSearch.get(i).RecType,
                                           'DupInType': scheduleChannelSearch.get(i).DupInType,
                                           'DupMethod': scheduleChannelSearch.get(i).DupMethod,
                                           'EncoderId': scheduleChannelSearch.get(i).EncoderId,
                                           'Profile': scheduleChannelSearch.get(i).Profile,
                                           'ArtworkInfos': scheduleChannelSearch.get(i).ArtworkInfos,
                                       })
                    if (scheduleChannelSearch.get(i).Title === searchMe.searchText)
                    {
                        console.log("Hit")
                    }
                    else
                    {
                        console.log("Miss")
//                        reload()
                    }
                }
            }
            if (status === XmlListModel.Loading)
                console.log("Loading + "+ searchMe.searchText);
            if (status === XmlListModel.Error)
                console.log("Error: " + errorString + "\n \n \n " + source.toString());
        }

    }
}
