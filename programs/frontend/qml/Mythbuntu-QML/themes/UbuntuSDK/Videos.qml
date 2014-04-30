import QtQuick 2.0
import QtQuick.Window 2.0
import MythTv 1.0
GridVideo{
    id: gridVideo
//    rootBackgroundImg: "../background.png"
//    previewsBackgroundImage: "../background.png"
//    mainBackgroundImage: "../background.png"
   loading: false
    fanartBackgroundColor:  "#80000000"
    mainTextColor: "white"
    width: parent.width
    height: parent.height
    mainTextUnderLined: false
    mainTextBold: false
    mainTextItalic: false
    mainTextWraping: Text.WordWrap
    mainTextEffect: Text.Sunken
    mainTextEffectColor: "grey"
    mainTextpxSize: parent.width / 50
    previewsShapeColor: "#33FFFFFF"
    previewsMainTextColor: "white"
    previewsMainTextpxSize: parent.width / 17
    Player{
        y: gridVideo.height * 2
        id: internalPlayer
        width:  gridVideo.width
        height: gridVideo.height
        opacity: 0
        videoAutoLoad: "false"
        videoAutoPlay: "true"
        videoSource: ""
        mainBackgroundColor: "99000000"
        topBarColor: "88FFFFFF"
        bottomBarColor: "#44DDf3d5"
        onVideoStatusChanged: {
            if (videoStatus === "7"){
                gridRec.opacity = 1
                y = videosRoot.height * 2
                videoAutoPlay = "false"
                opacity = 0
                videoSource: ""
            }else{
                console.log(videoStatus)
            }
        }
    }
//    MediaLoaders{visible: false}
}






















//import QtQuick 2.0
//import QtWebKit 3.0
//import QtQuick.XmlListModel 2.0
//import QtQuick.LocalStorage 2.0
//import Ubuntu.Components 0.1
//import MythTv 1.0


//Rectangle {
//    id: videosRoot
//    width: parent.width
//    height: parent.height
//    color: "#88C7C7C7"
//    ////Previews
//    Rectangle{
//        id:previewsRec
//        y:  videosRoot.height + 10
//        width:  videosRoot.width
//        height: videosRoot.height
//        color: "#88000000"
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
//                    UbuntuShape{
//                        id:previewShape
//                        width: parent.width  / 5
//                        height:    parent.height / 2
//                        anchors{
//                            left: parent.left
//                            leftMargin: videosRoot.width / 15
//                            top: parent.top
//                            topMargin: videosRoot.height / 4.2
//                        }
//                        image: Image {
//                            id:mainPreviewImage
//                            smooth: false
//                            sourceSize.height: previewShape.height
//                            sourceSize.width: previewShape.width
//                            source: {
//                                if (DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?StorageGroup=Coverart&FileName="+Coverart === Image.Error)
//                                    DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?Fanart=Coverart&FileName="+Fanart
//                                else
//                                    DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?StorageGroup=Coverart&FileName="+Coverart
//                            }
//                        }
//                    }
//                    Text {
//                        id: itemName
//                        text:{ContentType === "MOVIE" ? title : title +"\n"+ SubTitle}
//                        font.pixelSize: parent.width / 18
//                        color: "white"
//                        anchors.left:  mainPreviewImage.right
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
//                    Column{
//                        width: descriptionRec.width - (descriptionRec.width / 20 )
//                        height:  descriptionRec.height
//                        anchors{
//                            top: descriptionRec.top
//                            topMargin: descriptionRec.height / 40
//                            left:    descriptionRec.left
//                            leftMargin: descriptionRec.width / 40
//                        }
//                        Text {
//                            id: descriptionTXT
//                            text: Description
//                            width: descriptionRec.width - (descriptionRec.width / 20 )
//                            wrapMode: Text.WordWrap
//                        }
//                        Text {
//                            id: directorTXT
//                            text: "Directed By:  \t " + Director
//                            width: descriptionRec.width - (descriptionRec.width / 20 )
//                            wrapMode: Text.WordWrap
//                        }
//                        Text {
//                            id: releaseDateTXT
//                            text: "ReleaseDate: \t "+ Qt.formatDateTime(ReleaseDate, "ddd MMMM d yyyy")
//                            width: descriptionRec.width - (descriptionRec.width / 20 )
//                            wrapMode: Text.WordWrap
//                        }
//                        Text {
//                            id: watchedTXT
//                            text: "wathched: \t" + Watched
//                            width: descriptionRec.width - (descriptionRec.width / 20 )
//                            wrapMode: Text.WordWrap
//                        }
//                        Text {
//                            id: lengthTXT
//                            text: "Length: \t" + Length + " Min"
//                            width: descriptionRec.width - (descriptionRec.width / 20 )
//                            wrapMode: Text.WordWrap
//                        }
//                        Text {
//                            id: certificationTXT
//                            text: "Rated: \t" + Certification
//                            width: descriptionRec.width - (descriptionRec.width / 20 )
//                            wrapMode: Text.WordWrap
//                        }
//                        Text {
//                            id: studioTXT
//                            text: "Studio: \t" + Studio
//                            width: descriptionRec.width - (descriptionRec.width / 20 )
//                            wrapMode: Text.WordWrap
//                        }

//                    }
//                    Row {
//                        width:  videosRoot.width
//                        spacing: videosRoot.width / 20
//                        anchors{
//                            bottomMargin:  videosRoot.height / 40
//                            bottom: parent.bottom
//                        }

//                        UbuntuShape{
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
//                                    text: qsTr("Back")
//                                    anchors.centerIn: previewsBackButtonMouseArea
//                                }
//                            }
//                        }
//                        UbuntuShape{
//                            id:previewshomepageButton
//                            color: "grey"
//                            width:    videosRoot.width / 5
//                            height: videosRoot.height / 10
//                            MouseArea{
//                                anchors.fill: previewshomepageButton
//                                onClicked: {
//                                    //FixMe Make so it is the "selected" front end Ip ishere and not the first one
//                                    frontendPlayWeb.engineUrl =  DataBase.frontendIp1()+":"+DataBase.frontendPort1()+"/Frontend/SendAction?Action=ESCAPE"
//                                    frontendPlayWeb.engineUrl = DataBase.frontendIp1()+":"+DataBase.frontendPort1()+"/Frontend/PlayVideo?Id="+id
//                                }
//                            }

//                            Text {
//                                id: frontendPlay
//                                anchors.centerIn: previewshomepageButton
//                                text: qsTr("Frontend")
//                            }

////                            WebEngine{
////                                id: frontendPlayWeb
////                                engineUrl: ""
////                            }
//                        }
//                        UbuntuShape{
//                            id:previewsPlayButton
//                            color: "grey"
//                            width:    videosRoot.width / 4
//                            height: videosRoot.height / 10
//                            MouseArea{
//                                id: previewsPlayButtonMouseArea
//                                anchors.fill: previewsPlayButton
//                                onClicked: {
//                                    //                                    Qt.openUrlExternally(DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetVideo?Id="+id)
//                                    console.log(DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetVideo?Id="+id)

//                                    internalPlayer.opacity = 1
//                                    internalPlayer.y = 0
//                                    internalPlayer.videoSource =  DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetVideo?Id="+id
//                                    internalPlayer.videoAutoPlay = true
//               // For Channels to Play  "http://ubuntu:6544/Content/GetRecording?ChanId=1101&StartTime=2013-05-06T01:00:00Z" //
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

//    Player{
//        y: videosRoot.height * 2
//        id: internalPlayer
//        width:  videosRoot.width
//        height: videosRoot.height
//        opacity: 0
//        videoAutoLoad: "false"
//        videoAutoPlay: "true"
//        videoSource: ""

//    }


//    //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

//    Rectangle{
//        id: gridRec
//        width:  videosRoot.width
//        height: videosRoot.height
//        color: "#88000000"
//        Behavior on x {NumberAnimation{duration: 900; easing.type: Easing.OutBack}}
//        GridView{
//            id:gridView
//            focus: true
//            contentHeight: videosRoot.height
//            contentWidth: videosRoot.width
//            width: videosRoot.width
//            height: videosRoot.height
//            cellHeight: videosRoot.height / 3
//            cellWidth: videosRoot.width / 4
//            clip: true
//            anchors{
//                left: parent.left
//                top: parent.top
//            }
//            model: videoNfo
//            delegate: Item {
//                id:stateOneItem
//                focus: true
//                width: videosRoot.width / 4.5
//                height: videosRoot.height / 3.5
//                Text{
//                    id:markerID
//                    color: "transparent"
//                    text: id
//                }
//                ActivityIndicator {
//                    id: indicator
//                    visible: mainImage.status !== Image.Ready ? true : false
//                    anchors.centerIn:   backey
//                    running: mainImage.status !== Image.Ready ? true : false

//                }
//                UbuntuShape{
//                    id:backey
//                    width: parent.width / 1.3
//                    height:    parent.height
//                    image: Image {
//                        id:mainImage
//                        smooth: false
//                        sourceSize.height: backey.height
//                        sourceSize.width: backey.width
//                        fillMode: Image.PreserveAspectFit
//                        source: {
//                            if (DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?StorageGroup=Coverart&FileName="+Coverart === Image.Error)
//                                DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?Fanart=Coverart&FileName="+Fanart
//                            else
//                                DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?StorageGroup=Coverart&FileName="+Coverart
//                        }
//                    }
//                }
//                MouseArea{
//                    anchors.fill: parent
//                    onClicked: {
//                        console.log(title)
//                        gridRec.opacity = 0
//                        gridRec.x = videosRoot.width + 10
//                        previewsRec.y = 0
//                        videoSingleNfo.source = DataBase.ipAddress()+":"+DataBase.port()+"/Video/GetVideo?Id="+(markerID.text)
//                    }
//                }
//                Text {
//                    id: textID
//                    text:{ContentType === "MOVIE" ? title : SubTitle}
//                    width: backey.width
//                    wrapMode: Text.WordWrap
//                    anchors{
//                        top: backey.bottom
//                        topMargin: 1
//                    }
//                }
//            }
//        }//GridView
//    }
//    XmlListModel{
//        id: videoNfo
//        source: DataBase.ipAddress()+":"+DataBase.port()+Util.getAllVideos
//        query: "/VideoMetadataInfoList/VideoMetadataInfos/VideoMetadataInfo"
//        XmlRole { name: "id"; query: "Id/string()" }
//        XmlRole { name: "title"; query: "Title/string()" }
//        XmlRole { name: "SubTitle"; query: "SubTitle/string()" }
//        XmlRole { name: "Tagline"; query: "Tagline/string()" }
//        XmlRole { name: "Director"; query: "Director/string()" }
//        XmlRole { name: "Studio"; query: "Studio/string()" }
//        XmlRole { name: "Description"; query: "Description/string()" }
//        XmlRole { name: "Collectionref"; query: "Collectionref/string()" }
//        XmlRole { name: "HomePage"; query: "HomePage/string()" }
//        XmlRole { name: "ReleaseDate"; query: "ReleaseDate/string()" }
//        XmlRole { name: "AddDate"; query: "AddDate/string()" }
//        XmlRole { name: "UserRating"; query: "UserRating/string()" }
//        XmlRole { name: "Length"; query: "Length/string()" }
//        XmlRole { name: "PlayCount"; query: "PlayCount/string()" }
//        XmlRole { name: "Season"; query: "Season/string()" }
//        XmlRole { name: "Episode"; query: "Episode/string()" }
//        XmlRole { name: "ParentalLevel"; query: "ParentalLevel/string()" }
//        XmlRole { name: "Visible"; query: "Visible/string()" }
//        XmlRole { name: "Watched"; query: "Watched/string()" }
//        XmlRole { name: "Processed"; query: "Processed/string()" }
//        XmlRole { name: "ContentType"; query: "ContentType/string()" }
//        XmlRole { name: "FileName"; query: "FileName/string()" }
//        XmlRole { name: "Hash"; query: "Hash/string()" }
//        XmlRole { name: "HostName"; query: "HostName/string()" }
//        XmlRole { name: "Coverart"; query: "Coverart/string()" }
//        XmlRole { name: "Fanart"; query: "Fanart/string()" }
//        XmlRole { name: "Banner"; query: "Banner/string()" }
//        XmlRole { name: "Screenshot"; query: "Screenshot/string()" }
//        XmlRole { name: "Trailer"; query: "Trailer/string()" }
//        onStatusChanged: {
//            //debug
//            //            if (status == XmlListModel.Ready){}
//            if (status === XmlListModel.Loading) console.log("Loading");
//            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + videoNfo.source.toString());
//        }
//    }

//    XmlListModel{
//        id: videoSingleNfo
//        source:""// DataBase.ipAddress()+":"+DataBase.port()+Util.getAllVideos+"?Id="+"137"
//        query: "/VideoMetadataInfo"
//        XmlRole { name: "id"; query: "Id/string()" }
//        XmlRole { name: "title"; query: "Title/string()" }
//        XmlRole { name: "SubTitle"; query: "SubTitle/string()" }
//        XmlRole { name: "Tagline"; query: "Tagline/string()" }
//        XmlRole { name: "Director"; query: "Director/string()" }
//        XmlRole { name: "Studio"; query: "Studio/string()" }
//        XmlRole { name: "Description"; query: "Description/string()" }
//        XmlRole { name: "Collectionref"; query: "Collectionref/string()" }
//        XmlRole { name: "HomePage"; query: "HomePage/string()" }
//        XmlRole { name: "ReleaseDate"; query: "ReleaseDate/string()" }
//        XmlRole { name: "AddDate"; query: "AddDate/string()" }
//        XmlRole { name: "UserRating"; query: "UserRating/string()" }
//        XmlRole { name: "Length"; query: "Length/string()" }
//        XmlRole { name: "PlayCount"; query: "PlayCount/string()" }
//        XmlRole { name: "Season"; query: "Season/string()" }
//        XmlRole { name: "Episode"; query: "Episode/string()" }
//        XmlRole { name: "ParentalLevel"; query: "ParentalLevel/string()" }
//        XmlRole { name: "Visible"; query: "Visible/string()" }
//        XmlRole { name: "Watched"; query: "Watched/string()" }
//        XmlRole { name: "Certification"; query: "Certification/string()" }
//        XmlRole { name: "ContentType"; query: "ContentType/string()" }
//        XmlRole { name: "FileName"; query: "FileName/string()" }
//        XmlRole { name: "Hash"; query: "Hash/string()" }
//        XmlRole { name: "HostName"; query: "HostName/string()" }
//        XmlRole { name: "Coverart"; query: "Coverart/string()" }
//        XmlRole { name: "Fanart"; query: "Fanart/string()" }
//        XmlRole { name: "Banner"; query: "Banner/string()" }
//        XmlRole { name: "Screenshot"; query: "Screenshot/string()" }
//        XmlRole { name: "Trailer"; query: "Trailer/string()" }
//        onStatusChanged: {
//            //debug
////                            if (status == XmlListModel.Ready){console.log("Loaded" + source)}
//            if (status === XmlListModel.Loading){
//                console.log("Loading");
//                DataBase.createInitMainPortDatabase()
////                DataBase.createInitPortTable()

//        //        DataBase.createInitThemeMainDatabase()
//        //        DataBase.createInitITHemingTable()
//               DataBase.createInitMainDatabase()
//                DataBase.frontendDatabase()

////                DataBase.createInitIpAddressTable()
////            DataBase.createInitFrontEndTable()
//                console.log("\n HELOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO \n")
//            }
//            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + videoNfo.source.toString());
//        }
//    }
//}//videosRoot
