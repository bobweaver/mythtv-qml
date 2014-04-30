import QtQuick 2.0
//import QtWebKit 3.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
//import Ubuntu.Components 0.1
import "dbUtil.js" as DataBase
import "Util.js" as Util
Image{
    id: videosRoot
    width: parent.width
    height: parent.height
    source: "../themes/Mythbuntu/background.png"

    //Previews
    Image{
        id:previewsRec
                y:  videosRoot.height + 10
        opacity:  0
        source: "../themes/Mythbuntu/background.png"
        width:  videosRoot.width
        height: videosRoot.height
                Behavior on y {NumberAnimation{duration: 900; easing.type: Easing.OutBack}}
        Behavior on opacity {NumberAnimation{duration: 1200; easing.type: Easing.OutQuad}}

        ListView{
            id:previewsItemView
            model: videoSingleNfo
            width:  videosRoot.width
            height: videosRoot.height
//            anchors.top: header.bottom
            delegate: Item {
                id:  previewsItem
                width:  videosRoot.width
                height: videosRoot.height
                Rectangle{
                    id:previewsMain
                    color: "#88000000"
                    anchors.fill: previewsItem
                    Rectangle{
                        id:descriptionRec
                        width: previewsRec.width / 1.7
                        height: previewsRec.height / 1.7
                        gradient: Gradient{
                            GradientStop { position: 0; color: "#88C7C7C7"}
                            GradientStop { position: 0.5; color: "#44C7C7C7"}
                            GradientStop { position: 1; color: "#88C7C7C7"}
                        }
                        anchors{
                            right:parent.right
                            rightMargin:   previewsRec.width / 20
                            verticalCenter: parent.verticalCenter
                        }
                    }
                    Column{
                        width: descriptionRec.width - (descriptionRec.width / 20 )
                        height:  descriptionRec.height
                        anchors{
                            top: descriptionRec.top
                            topMargin: descriptionRec.height / 40
                            left:    descriptionRec.left
                            leftMargin: descriptionRec.width / 40
                        }
                        Text {
                            id: descriptionTXT
                            text: Description
                            width: descriptionRec.width - (descriptionRec.width / 20 )
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            id: releaseDateTXT
                            text: "Start Time Date: \t "+ Qt.formatDateTime(startTime, "ddd MMMM d hh:mm ap")
                            width: descriptionRec.width - (descriptionRec.width / 20 )
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            id: endTXT
                            text: "End Time: \t" + Qt.formatDateTime(endTime, "ddd MMMM d hh:mm ap")
                            width: descriptionRec.width - (descriptionRec.width / 20 )
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            id: inetrefTXT
                            text: "Inetref: \t" +  Inetref
                            width: descriptionRec.width - (descriptionRec.width / 20 )
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            id: markerId
                            text: "that is aj " + rStatus + "\t" + startTime + "\n" + chanID
                            color: "blue"

                            width: descriptionRec.width - (descriptionRec.width / 20 )
                            wrapMode: Text.WordWrap
                        }
                    }
                    Row {
                        width:  previewsRec.width
                        spacing: previewsRec.width / 20
                        anchors{
                            bottomMargin:  previewsRec.height / 40
                            bottom: parent.bottom
                        }

                        Rectangle{
                            id:previewsBackButton
                            color: "grey"
                            width:    previewsRec.width / 4
                            height: previewsRec.height / 10
                            MouseArea{
                                id: previewsBackButtonMouseArea
                                anchors.fill: previewsBackButton
                                onClicked: {
                                    gridRec.opacity = 1
                                    gridRec.x = 0
                        previewsRec.y = videosRoot.height * 2
                                    previewsRec.opacity = 0
                                    console.log("back clicked")
                                }
                                Text {
                                    id: name
                                    text: qsTr("Done")
                                    anchors.centerIn: previewsBackButtonMouseArea
                                }
                            }
                        }
                        Rectangle{
                            id:previewshomepageButton
                            color: "grey"
                            width:    previewsRec.width / 5
                            height: previewsRec.height / 10
                            MouseArea{
                                anchors.fill: previewshomepageButton
                                onClicked: {
                                    var doc = new XMLHttpRequest();
                                    doc.open("POST",DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/AddRecordSchedule?StartTime="+startTime+ "&ChanId="+chanID+"&Type=not", true);
                                    doc.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
                                    doc.onreadystatechange = function() {
                                        if (doc.readyState == doc.DONE) {
                                            console.log(title +" is Removed");
                                        }
                                        if (doc.status == 200, doc.readyState == 4) {
                                            var resp = doc.responseXML
                                            console.log("Doc XML response ready")
                                        }
                                        else console.log("hmmm?")
                                    }
                                    doc.send();;


                                }
                            }
                            Text {
                                id: frontendPlay
                                anchors.centerIn: previewshomepageButton
                                text: qsTr("Remove Recording")
                            }
                        }
                        Rectangle{
                            id:previewsPlayButton
                            color: "grey"
                            width:    previewsRec.width / 4
                            height: previewsRec.height / 10
                            MouseArea{
                                id: previewsPlayButtonMouseArea
                                anchors.fill: previewsPlayButton
                                onClicked: {
                                }
                                Text {
                                    id: play
                                    text: qsTr("Edit MetaData")
                                    anchors.centerIn: previewsPlayButtonMouseArea
                                }
                            }
                        }
                    }
                }
            }
        }
    }//previews end

    //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

    Image{
        id: gridRec
        width:  videosRoot.width
        height: videosRoot.height
        opacity: 1
        source: "../themes/Mythbuntu/background.png"
        Behavior on x {NumberAnimation{duration: 900; easing.type: Easing.OutBack}}
        Behavior on opacity {NumberAnimation{  duration: 900 }  }
        Text {
            id: header
            color: "white"
            font.pixelSize: 64
            height: 72
            width:  videosRoot.width
            text: qsTr("Up and Coming Recordings")
        }
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
                top: header.bottom
            }
            model: videoNfo
            delegate: Item {
                id:stateOneItem
                focus: true
                width: videosRoot.width / 4.5
                height: videosRoot.height / 3.5
                //background to the Image
                MouseArea{
                    id: backerMouseArea
                    anchors.fill: backer
                    onClicked: {
                        var markerMath =   parseInt(marker.text)
                        var u =  markerMath - 1
                                                console.log( DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/GetUpcomingList?StartIndex="+u+"&Count= 1")
                        videoSingleNfo.source = DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/GetUpcomingList?StartIndex="+u+"&Count= 1"
                        previewsRec.opacity = 1
                        previewsRec.y = 0
                        gridRec.opacity = 0
                        gridRec.x = videosRoot.width * 2
                    }
                }
                Rectangle{
                    id: backer
                    width: parent.width / 1.3
                    height:    parent.height
                    color: "#44000000"
                    border.width: 1
                    border.color:  "#33FFFFFF"
                    Image{
                        id:backey
                        width: backer.width / 2
                        height:    backer.height / 2
                        source: "../artwork/mythbuntu.png"
                        anchors.centerIn: backer

                        Image {
                            id:mainImage
                            smooth: false
                            sourceSize.height: backer.height
                            sourceSize.width: backer.width
                            anchors.centerIn: backey
                            fillMode: Image.PreserveAspectFit
                            source: {
//                                var u = DataBase.ipAddress()+":"+DataBase.port()+aURL1
//                                if   (u === Image.Error)
                                    backey.source
//                                else
//                                    u
                            }
                        }
                    }

                }

                Text {
                    id: textID
                    text: title
                    color: "white"
                    font.pixelSize: Math.round(parent.width / 12)
                    width: backey.width
                    wrapMode: Text.WordWrap
                    anchors{
                        top: parent.bottom
                        topMargin: 1
                        left:parent.left
                        leftMargin: parent.width / 12
                    }
                }
                Text {
                    id: marker
                    text: SourceId
                    color:"transparent"
                }

            }
        }//GridView
    }
    XmlListModel{
        id: videoNfo
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
            //            if (status == XmlListModel.Ready){console.log(videoNfo.source.toString())}
            //            if (status === XmlListModel.Loading) console.log("Loading");
            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + videoNfo.source.toString());
        }
    }

    XmlListModel{
        id: videoSingleNfo
        source: ""
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
        XmlRole{name: "rRecordId " ; query: "Recording/RecordId/string()"}
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


}//videosRoot

