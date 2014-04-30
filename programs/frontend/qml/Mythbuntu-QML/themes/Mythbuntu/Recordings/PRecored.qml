import QtQuick 2.0
//import QtWebKit 3.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import MythTv 1.0

import "../../../examples"
Image{
    id: videosRoot
    width: parent.width
    height: parent.height
    source: "../background.png"
//    //Previews
//    Image{
//        id:previewsRec
//        y:  videosRoot.height + 10
//        scale:  .9
//        source: ""
//        width:  videosRoot.width
//        height: videosRoot.height
//        Behavior on y {NumberAnimation{duration: 900; easing.type: Easing.OutBack}}
//        Behavior on opacity {NumberAnimation{duration: 1800; easing.type: Easing.OutQuad}}
//        ListView{
//            id:previewsItemView
//            model: videoSingleNfo
//            width:  videosRoot.width
//            height: videosRoot.height
//            delegate: Item {
//                id:  previewsItem
//                width:  videosRoot.width
//                height: videosRoot.height
//                Rectangle{
//                    id:previewsMain
//                    color: "#88000000"
//                    anchors.fill: previewsItem
//                    Image {
//                        width: parent.width
//                        height: parent.height
//                        id: backgroundPreviewsImage
//                        source: DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?Fanart=Coverart&FileName="+Fanart
//                    }
//                    Rectangle{
//                        id:previewShape
//                        width: parent.width  / 5
//                        height:    parent.height / 2
//                        color: previewsShapeColor
//                        anchors{
//                            left: parent.left
//                            leftMargin: videosRoot.width / 15
//                            top: parent.top
//                            topMargin: videosRoot.height / 4.2
//                        }
//                        Image {
//                            id:mainPreviewImage
//                            smooth: false
//                            sourceSize.height: previewShape.height
//                            sourceSize.width: previewShape.width
//                            anchors.centerIn: previewShape
//                            source: {
//                                if (DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?StorageGroup=Coverart&FileName="+Coverart === Image.Error)
//                                    DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?Fanart=Coverart&FileName="+Fanart
//                                else
//                                    DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?StorageGroup=Coverart&FileName="+Coverart
//                            }
//                            scale:{
//                                if (status === Image.Ready)
//                                    1
//                                else
//                                    0
//                            }
//                            Behavior on scale{
//                           NumberAnimation{
//                           duration: 1200
//                           easing.type: Easing.OutBack
//                           }
//                            }
//                        }
//                        Text {
//                            id: itemName
//                            text:{ContentType === "MOVIE" ? title : title +"\n"+ SubTitle}
//                            font.pixelSize: previewsMainTextpxSize
//                            color: previewsMainTextColor
//                            anchors{
//                                left:  mainPreviewImage.left
//                            bottom:  parent.top
//                        bottomMargin: parent.height / 12
//                            }
//                            }
//                    }
//                    Rectangle{
//                        id:descriptionRec
//                        width: videosRoot.width / 1.7
//                        height: videosRoot.height / 1.7
//                        gradient: Gradient{
//                            GradientStop { position: 0; color: "#88C7C7C7"}
//                            GradientStop { position: 0.5; color: "#44C7C7C7"}
//                            GradientStop { position: 1; color: "#88C7C7C7"}
//                        }
//                        anchors{
//                            right:parent.right
//                            rightMargin:   videosRoot.width / 20
//                            verticalCenter: parent.verticalCenter
//                        }
//                    }
////                    Column{
////                        width: descriptionRec.width - (descriptionRec.width / 20 )
////                        height:  descriptionRec.height
////                        anchors{
////                            top: descriptionRec.top
////                            topMargin: descriptionRec.height / 40
////                            left:    descriptionRec.left
////                            leftMargin: descriptionRec.width / 40
////                        }
////                        Text {
////                            id: descriptionTXT
////                            text: Description
////                            width: descriptionRec.width - (descriptionRec.width / 20 )
////                            wrapMode: Text.WordWrap
////                        }
////                        Text {
////                            id: directorTXT
////                            text: "Directed By:  \t " + Director
////                            width: descriptionRec.width - (descriptionRec.width / 20 )
////                            wrapMode: Text.WordWrap
////                        }
////                        Text {
////                            id: releaseDateTXT
////                            text: "ReleaseDate: \t "+ Qt.formatDateTime(ReleaseDate, "ddd MMMM d yyyy")
////                            width: descriptionRec.width - (descriptionRec.width / 20 )
////                            wrapMode: Text.WordWrap
////                        }
////                        Text {
////                            id: watchedTXT
////                            text: "wathched: \t" + Watched
////                            width: descriptionRec.width - (descriptionRec.width / 20 )
////                            wrapMode: Text.WordWrap
////                        }
////                        Text {
////                            id: lengthTXT
////                            text: "Length: \t" + Length + " Min"
////                            width: descriptionRec.width - (descriptionRec.width / 20 )
////                            wrapMode: Text.WordWrap
////                        }
////                        Text {
////                            id: certificationTXT
////                            text: "Rated: \t" + Certification
////                            width: descriptionRec.width - (descriptionRec.width / 20 )
////                            wrapMode: Text.WordWrap
////                        }
////                        Text {
////                            id: studioTXT
////                            text: "Studio: \t" + Studio
////                            width: descriptionRec.width - (descriptionRec.width / 20 )
////                            wrapMode: Text.WordWrap
////                        }

////                    }
//                    Row {
//                        width:  videosRoot.width
//                        spacing: videosRoot.width / 20
//                        anchors{
//                            bottomMargin:  videosRoot.height / 40
//                            bottom: parent.bottom
//                        }

//                        Rectangle{
//                            id:previewsBackButton
//                            color: "grey"
//                            width:    videosRoot.width / 4
//                            height: videosRoot.height / 10
//                            MouseArea{
//                                id: previewsBackButtonMouseArea
//                                anchors.fill: previewsBackButton
//                                onClicked: {
//                                    gridRec.x = 0
//                                    gridRec.opacity = 1
//                                    previewsRec.y = videosRoot.height * 2
//                                    console.log("back clicked")
//                                }
//                                Text {
//                                    id: name
//                                    text: qsTr("Done")
//                                    anchors.centerIn: previewsBackButtonMouseArea
//                                }
//                            }
//                        }
//                        Rectangle{
//                            id:previewshomepageButton
//                            color: "grey"
//                            width:    videosRoot.width / 5
//                            height: videosRoot.height / 10
//                            MouseArea{
//                                anchors.fill: previewshomepageButton
//                                onClicked: {
//                                    Qt.openUrlExternally(DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetRecording?ChanId="+chanID+"&StartTime="+rStartTs)
//                                }
//                            }

//                            Text {
//                                id: frontendPlay
//                                anchors.centerIn: previewshomepageButton
//                                text: qsTr("Open External")
//                            }


//                        }
//                        Rectangle{
//                            id:previewsPlayButton
//                            color: "grey"
//                            width:    videosRoot.width / 4
//                            height: videosRoot.height / 10
//                            MouseArea{
//                                id: previewsPlayButtonMouseArea
//                                anchors.fill: previewsPlayButton
//                                onClicked: {
////                                    Qt.openUrlExternally(DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetVideo?Id="+id)
//                                    console.log( DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetRecording?ChanId="+chanID+"&StartTime="+rStartTs)
//                                    internalPlayer.opacity = 1
//                                    internalPlayer.y = 0
//                                    internalPlayer.videoSource =  DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetRecording?ChanId="+chanID+"&StartTime="+rStartTs
//                                    internalPlayer.videoAutoPlay = true
//                                    gridRec.opacity = 0
//                                }
//                                Text {
//                                    id: play
//                                    text: qsTr("Play")
//                                    anchors.centerIn: previewsPlayButtonMouseArea
//                                }
//                            }
//                        }

//                    }
//                }
//            }
//        }
//    }//previews end
















    //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

    Image{
        id: gridRec
        width:  videosRoot.width
        height: videosRoot.height
        source: "../background.png"
        Behavior on x {NumberAnimation{duration: 900; easing.type: Easing.OutBack}}
        Behavior on opacity {NumberAnimation{  duration: 900 }  }
        GridView{
            id:gridView
            focus: true
            contentHeight: videosRoot.height
            contentWidth: videosRoot.width
            width: videosRoot.width
            height: videosRoot.height
            cellHeight: videosRoot.height / 3
            cellWidth: videosRoot.width / 4

            clip: true
            anchors{
                left: parent.left
                top: parent.top
            }
            model: videoNfo
            delegate: Item {
                id:stateOneItem
                focus: true
                width: videosRoot.width / 4.5
                height: videosRoot.height / 3.5
                //background to the Image
                Rectangle{
                    id:backey
                    width: parent.width / 1.3
                    height:    parent.height
                    color: "#88000000"
                    Image {
                        id:mainImage
                        smooth: false
                        sourceSize.height: backey.height
                        sourceSize.width: backey.width
                        anchors.centerIn: backey
                        fillMode: Image.PreserveAspectFit
                        source: {
                            var u = DataBase.ipAddress()+":"+DataBase.port()+aURL1
//                            if (u === Image.Error || "Unable to assign [undefined] to QUrl")
//                                return "../mv_browse_nocover.png"
//                            else
                                return   u
                        }
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                    }
                    onDoubleClicked: {
//                        Qt.openUrlExternally(DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetRecording?ChanId="+chanID+"&StartTime="+rStartTs)
                    }
                    onClicked: {
//                        console.log( DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetRecording?ChanId="+chanID+"&StartTime="+rStartTs)
//                        internalPlayer.opacity = 1
//                        internalPlayer.y = 0
//                        internalPlayer.videoSource =  DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetRecording?ChanId="+chanID+"&StartTime="+rStartTs
//                        internalPlayer.videoAutoPlay = true
                        gridRec.source = DataBase.ipAddress()+":"+DataBase.port()+aURL2

                    }
                }
                Text {
                    id: textID
                    text: title
                    color: "white"
                    width: backey.width
                    wrapMode: Text.WordWrap
                    anchors{
                        top: backey.bottom
                        topMargin: 1
                    }
                }
            }
        }//GridView
    }
    XmlListModel{
        id: videoNfo
        source: DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/GetRecordedList?StartIndex=0&Descending=true&Details=true"
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
            //debug
//            if (status == XmlListModel.Ready){console.log(videoNfo.source.toString())}
//            if (status === XmlListModel.Loading) console.log("Loading");
            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + videoNfo.source.toString());
        }
    }

    XmlListModel{
        id: videoSingleNfo
        source: "" // DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/GetRecordedList?StartIndex=0&Descending=true&Details=true"
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
        XmlRole{name: "aURL" ; query: "Artwork/ArtworkInfos/ArtworkInfo/URL/string()"}
        XmlRole{name: "aFileName" ; query: "Artwork/ArtworkInfos/ArtworkInfo/FileName/string()"}
        XmlRole{name: "aStorageGroup" ; query: "Artwork/ArtworkInfos/ArtworkInfo/StorageGroup/string()"}
        XmlRole{name: "aType" ; query: "Artwork/ArtworkInfos/ArtworkInfo/Type/string()"}
        onStatusChanged: {
            //debug
//            if (status == XmlListModel.Ready){console.log(videoNfo.source.toString())}
//            if (status === XmlListModel.Loading) console.log("Loading");
            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + videoNfo.source.toString());
        }
    }
    Player{
        y: videosRoot.height * 2
        id: internalPlayer
        mainBackgroundColor: "#88000000"
        width:  videosRoot.width
        height: videosRoot.height
        opacity: 0
        videoAutoLoad: "false"
        videoAutoPlay: "true"
        videoSource: ""
        onVideoStatusChanged: {
            if (videoStatus === "7"){
                gridRec.opacity = 1
                y = videosRoot.height * 2
//                internalPlayer.videoAutoPlay = "false"
                videoAutoPlay = "false"
                opacity = 0
                videoSource: ""

            }else{
//                console.log(videoStatus +"\n" + state)
            }
        }
    }

}//videosRoot
