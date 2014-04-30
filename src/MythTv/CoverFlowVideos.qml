import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import "dbUtil.js" as DataBase
import "Util.js" as Util
/*!
    \qmltype CoverFlowVideos
    \inqmlmodule MythTv 1.0
    \ingroup mythtv
    \brief This Element uses the backend api to query the users recorded videos and displays them on the screen.
    there is previews for the video and also a main page.
    Example:
    \qml
import QtQuick 2.0
import MythTv 1.0
CoverFlowVideos{
    id: gridVideo
    rootBackgroundImg: "../background.png"
    previewsBackgroundImage: "../background.png"
    mainBackgroundImage: "../background.png"
    mainTextColor: "white"
    width: parent.width
    height: parent.height
    mainTextUnderLined: false
    mainTextBold: false
    mainTextItalic: false
    mainTextEffect: Text.Sunken
    mainTextEffectColor: "grey"
    mainTextpxSize: parent.width / 50
    previewsShapeColor: "#33FFFFFF"
    previewsMainTextColor: "white"
    previewsMainTextpxSize: parent.width / 17
    mv_browse_nocover: appThemePath + "Mythbuntu/mv_browse_nocover.png"
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
}
    \endqml
*/
Image {
    id:coverFlow
    width: parent.width
    height: parent.height
    source: ""
    //Previews
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias rootBackgroundImg: coverFlow.source
    /*!
      \preliminary
      The Preview background Image that one would like to use.
      */
    property string previewsBackgroundImage: previewsRec.source
    /*!
      \preliminary
      The Text color for the Previews
      */
    property string  previewsMainTextColor: itemName.color
    /*!
      \preliminary
      The font size of the text in Previews
      */
    property real  previewsMainTextpxSize: itemName.font.pixelSize
    /*!
      \preliminary
      The effects that can be use to the text that is in the Previews
      */
    property string previewsMainTextEffect: itemName.style
    /*!
      \preliminary
      The effects color that can be used in the Previews
      */
    property string previewsMainTextEffectColor: itemName.styleColor
    /*!
      \preliminary
      The wraping style that will be used in the Previews
      */
    property string previewsMainTextWraping: itemName.wrapMode
    /*!
      \preliminary
      The Maximum amount of lines that will be used in the previews
      */
    property double previewsMainTextMaxLineCount: itemName.maximumLineCount
    /*!
      \preliminary
      Setting the Previews Text to Bold
      */
    property bool previewsMainTextBold: itemName.font.bold
    /*!
      \preliminary
      The weight of the Text in the Previews
      */
    property  string previewsMainTextWeight: itemName.font.weight
    /*!
      \preliminary
      Set the Text in the Previews to be Italic
      */
    property bool previewsMainTextItalic: itemName.font.italic
    /*!
      \preliminary
      space between the letters in the Previews
      */
    property real previewsMainTextLetterSpacing: itemName.font.letterSpacing
    /*!
      \preliminary
      Set the Text in the Previews to be underlined
      */
    property bool  previewsMainTextUnderLined: itemName.font.underline
    /*!
      \preliminary
      The main shape color in the Previews
      */
    property string previewsShapeColor: previewShape.color


    Image{
        id:previewsRec
        y:  coverFlow.height + 10
        source: ""
        width:  coverFlow.width
        height: coverFlow.height
        Behavior on y {NumberAnimation{duration: 900; easing.type: Easing.OutBack}}
        Behavior on opacity {NumberAnimation{duration: 1800; easing.type: Easing.OutQuad}}
        ListView{
            id:previewsItemView
            model: videoSingleNfo
            width:  coverFlow.width
            height: coverFlow.height
            delegate: Item {
                id:  previewsItem
                width:  coverFlow.width
                height: coverFlow.height
                Rectangle{
                    id:previewsMain
                    color: "#88000000"
                    anchors.fill: previewsItem
                    Image {
                        width: parent.width
                        height: parent.height
                        id: backgroundPreviewsImage
                        source: DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?Fanart=Coverart&FileName="+Fanart
                    }
                    Rectangle{
                        id:previewShape
                        width: parent.width  / 5
                        height:    parent.height / 2
                        color: previewsShapeColor
                        anchors{
                            left: parent.left
                            leftMargin: coverFlow.width / 15
                            top: parent.top
                            topMargin: coverFlow.height / 4.2
                        }
                        Image {
                            id:mainPreviewImage
                            smooth: false
                            sourceSize.height: previewShape.height
                            sourceSize.width: previewShape.width
                            anchors.centerIn: previewShape
                            source: {
                                if (DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?StorageGroup=Coverart&FileName="+Coverart === Image.Error)
                                    DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?Fanart=Coverart&FileName="+Fanart
                                else
                                    DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?StorageGroup=Coverart&FileName="+Coverart
                            }
                            scale:{
                                if (status === Image.Ready)
                                    1
                                else
                                    0
                            }
                            Behavior on scale{
                           NumberAnimation{
                           duration: 1200
                           easing.type: Easing.OutBack
                           }
                            }
                        }
                        Text {
                            id: itemName
                            text:{ContentType === "MOVIE" ? title : title +"\n"+ SubTitle}
                            font.pixelSize: previewsMainTextpxSize
                            color: previewsMainTextColor
                            anchors{
                                left:  mainPreviewImage.left
                            bottom:  parent.top
                        bottomMargin: parent.height / 12
                            }
                            }
                    }
                    Rectangle{
                        id:descriptionRec
                        width: coverFlow.width / 1.7
                        height: coverFlow.height / 1.7
                        gradient: Gradient{
                            GradientStop { position: 0; color: "#88C7C7C7"}
                            GradientStop { position: 0.5; color: "#44C7C7C7"}
                            GradientStop { position: 1; color: "#88C7C7C7"}
                        }
                        anchors{
                            right:parent.right
                            rightMargin:   coverFlow.width / 20
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
                            id: directorTXT
                            text: "Directed By:  \t " + Director
                            width: descriptionRec.width - (descriptionRec.width / 20 )
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            id: releaseDateTXT
                            text: "ReleaseDate: \t "+ Qt.formatDateTime(ReleaseDate, "ddd MMMM d yyyy")
                            width: descriptionRec.width - (descriptionRec.width / 20 )
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            id: watchedTXT
                            text: "wathched: \t" + Watched
                            width: descriptionRec.width - (descriptionRec.width / 20 )
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            id: lengthTXT
                            text: "Length: \t" + Length + " Min"
                            width: descriptionRec.width - (descriptionRec.width / 20 )
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            id: certificationTXT
                            text: "Rated: \t" + Certification
                            width: descriptionRec.width - (descriptionRec.width / 20 )
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            id: studioTXT
                            text: "Studio: \t" + Studio
                            width: descriptionRec.width - (descriptionRec.width / 20 )
                            wrapMode: Text.WordWrap
                        }

                    }
                    Row {
                        width:  coverFlow.width
                        spacing: coverFlow.width / 20
                        anchors{
                            bottomMargin:  coverFlow.height / 40
                            bottom: parent.bottom
                        }

                        Rectangle{
                            id:previewsBackButton
                            color: "grey"
                            width:    coverFlow.width / 4
                            height: coverFlow.height / 10
                            MouseArea{
                                id: previewsBackButtonMouseArea
                                anchors.fill: previewsBackButton
                                onClicked: {
                                    gridRec.x = 0
                                    gridRec.opacity = 1
                                    previewsRec.y = coverFlow.height * 2
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
                            width:    coverFlow.width / 5
                            height: coverFlow.height / 10
                            MouseArea{
                                anchors.fill: previewshomepageButton
                                onClicked: {
                                    Qt.openUrlExternally(DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetVideo?Id="+id, video)
                                }
                            }

                            Text {
                                id: frontendPlay
                                anchors.centerIn: previewshomepageButton
                                text: qsTr("Open External")
                            }
//#FIXME This is not a option in qt5.1 still waiting on webengine upstream
                            //                            WebEngine{
                            //                                id: frontendPlayWeb
                            //                                engineUrl: ""
                            //                            }
                        }
                        Rectangle{
                            id:previewsPlayButton
                            color: "grey"
                            width:    coverFlow.width / 4
                            height: coverFlow.height / 10
                            MouseArea{
                                id: previewsPlayButtonMouseArea
                                anchors.fill: previewsPlayButton
                                onClicked: {
//                                    Qt.openUrlExternally(DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetVideo?Id="+id)
                                                                        internalPlayer.opacity = 1
                                                                        internalPlayer.y = 0
                                                                        internalPlayer.videoSource =  DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetVideo?Id="+id
                                                                        internalPlayer.videoAutoPlay = false
                                    console.log(DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetVideo?Id="+id)
                                    // For Channels to Play  "http://ubuntu:6544/Content/GetRecording?ChanId=1101&StartTime=2013-05-06T01:00:00Z" //
                                }
                                Text {
                                    id: play
                                    text: qsTr("Play")
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
    /*!
      \preliminary
      The Main Background Image
      */
    property alias mainBackgroundImage: gridRec.source
    /*!
      \preliminary
      The color of the Text that is under the Main Image
      */
    property string mainTextColor: textID.color
    /*!
      \preliminary
      The font size of the Text that is under the main Image
      */
    property real  mainTextpxSize: textID.font.pixelSize
    /*!
      \preliminary
      The effects that can be used for the Text that is under the main Image
      */
    property int mainTextEffect: textID.style
    /*!
      \preliminary
      The color of the Effect for the Text that is under the main Image
      */
    property string mainTextEffectColor: textID.styleColor
    /*!
      \preliminary
      wrapmode that will be used for the Text that is under the main image
      */
    property string mainTextWraping: textID.wrapMode
    /*!
      \preliminary
      The max line count for the Text that is under the main Image
      */
    property double mainTextMaxLineCount: textID.maximumLineCount
    /*!
      \preliminary
      Set the Text that is under the main Image to be bold
      */
    property bool mainTextBold: textID.font.bold
    property string mainTextFont: textID.font
    /*!
      \preliminary
      Set the weight of the Text that is under the main Image
      */
    property  string mainTextWeight: textID.font.weight
    /*!
      \preliminary
      Set the Text that is under the main Image to be italic
      */
    property bool mainTextItalic: textID.font.italic
    /*!
      \preliminary
      Spacing that is used for the Text that is under the main Image
      */
    property real mainTextLetterSpacing: textID.font.letterSpacing
    /*!
      \preliminary
      Set the Text that is under the main Image to be underlined
      */
    property bool  mainTextUnderLined: textID.font.underline
    /*!
      \preliminary
      Set the default main Image as a fall backe in case the users have no fan/cover art
      */
    property string mv_browse_nocover: delegateImage.source

    Image{
        id: gridRec
        width:  coverFlow.width
        height: coverFlow.height
        source: ""
        Behavior on x {NumberAnimation{duration: 900; easing.type: Easing.OutBack}}
    ListView{
        spacing: coverFlow.width / 3
        width:  parent.width * 100
        height: coverFlow.width / 1.6
        boundsBehavior: Flickable.DragAndOvershootBounds
        orientation: ListView.Horizontal
//       path:Path{
//           startX: 20
//                    startY: 50
//                    PathAttribute { name: "iconScale"; value: 0.5 }
//                    PathQuad { x: 200; y: 150; controlX: 50; controlY: 200 }
//                    PathAttribute { name: "iconScale"; value: 1.5 }
//                    PathQuad { x: 390; y: 50; controlX: 350; controlY: 200 }
//                    PathAttribute { name: "iconScale"; value: 0.5 }
//        }
                    anchors{
       top: parent.top
       topMargin:  Math.round((parent.width / 2) - (height / 1.4))
        }
        model: videoNfo
        delegate: Item {
            Text{
                id:markerID
                color: "transparent"
                text: id
            }
            Image {
                    id: delegateImage
                    width: coverFlow.width / 3.3
                    height: coverFlow.height / 1.6
                    source: mv_browse_nocover
                   opacity: dlgImg.status === Image.Ready  || Image.Loading ? 1 : 0
                   Behavior on  opacity {
                       SequentialAnimation{
                       NumberAnimation { target: dlgImg; property: "scale"; from: 0;to:1;duration: 900; easing.type: Easing.OutBack }
                       }
                   }

                    Image {
                        id: dlgImg
                        width: coverFlow.width / 3.3
                        height: coverFlow.height / 1.6
                        anchors.centerIn: delegateImage
                        source:   {
                            if (DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?StorageGroup=Coverart&FileName="+Coverart === Image.Error || Image.Loading)
                                         DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?Fanart=Coverart&FileName="+Fanart
                                     if (DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?Fanart=Coverart&FileName="+Fanart === Image.Error || Image.Loading)
                                         DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?StorageGroup=Coverart&FileName="+Coverart
                                     else if (source === Image.Error)
                                         "../artwork/mv_browse_nocover.png"
                        }

                    }

                    MouseArea{
                        id: dlgMouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            gridRec.source = DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?Fanart=Coverart&FileName="+Fanart
                        }
                        onClicked: {
                            gridRec.source = DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?Fanart=Coverart&FileName="+Fanart
                        }
                        onDoubleClicked: {
                            gridRec.opacity = 0
                            gridRec.x = coverFlow.width + 10
                            previewsRec.y = 0
                            videoSingleNfo.source = DataBase.ipAddress()+":"+DataBase.port()+"/Video/GetVideo?Id="+(markerID.text)
                        }
                    }


                    Text {
                        id: textID
                        text:{ContentType === "MOVIE" ? title : SubTitle}
                        width: dlgImg.width - 2
                        color: mainTextColor
                        font.pixelSize: coverFlow.width / 22
                        wrapMode: Text.WordWrap
//                        font.pixelSize:  mainTextpxSize
                        style: mainTextEffect
                        styleColor:  (mainTextEffectColor)
//                        wrapMode:  (mainTextWraping)
                        maximumLineCount:  mainTextMaxLineCount
                        font.bold:  mainTextBold
//                        font.weight:  mainTextWeight
                        font.italic:  mainTextItalic
//                        font.letterSpacing:  mainTextLetterSpacing
                        font.underline:  false //: mainTextUnderLined
                        anchors{
                            top: dlgImg.bottom
                            topMargin: 1
                        }
                    }




                }//del Item
}
            }//listview


            states: [
                State {
                    name: "scaled"
                    PropertyChanges {
                        target: delegateImage
                        // Scale up the icon
                        scale: 1.8
                    }
                }
            ]

            transitions: [
                Transition {
                    from: ""
                    to: "scaled"
                    reversible: true
                    ParallelAnimation {
                        PropertyAnimation {
                            target: delegateImage
                            properties: "scale"
                            duration: 300
                        }
                    }
                }
            ]
        }

    MythActivityVideo {
        id: buyfferIndicator
        //        visible: videos.status !== 6 || videos.playbackState === 2 ? true : false
        anchors.centerIn: parent
        //        running : videos.status !== 6 || videos.playbackState === 2  ? true : false
        width: coverFlow.width
        height: coverFlow.height
    }
    XmlListModel{
        id: videoNfo
        source: DataBase.ipAddress()+":"+DataBase.port()+Util.getAllVideos
        query: "/VideoMetadataInfoList/VideoMetadataInfos/VideoMetadataInfo"
        XmlRole { name: "id"; query: "Id/string()" }
        XmlRole { name: "title"; query: "Title/string()" }
        XmlRole { name: "SubTitle"; query: "SubTitle/string()" }
        XmlRole { name: "Tagline"; query: "Tagline/string()" }
        XmlRole { name: "Director"; query: "Director/string()" }
        XmlRole { name: "Studio"; query: "Studio/string()" }
        XmlRole { name: "Description"; query: "Description/string()" }
        XmlRole { name: "Collectionref"; query: "Collectionref/string()" }
        XmlRole { name: "HomePage"; query: "HomePage/string()" }
        XmlRole { name: "ReleaseDate"; query: "ReleaseDate/string()" }
        XmlRole { name: "AddDate"; query: "AddDate/string()" }
        XmlRole { name: "UserRating"; query: "UserRating/string()" }
        XmlRole { name: "Length"; query: "Length/string()" }
        XmlRole { name: "PlayCount"; query: "PlayCount/string()" }
        XmlRole { name: "Season"; query: "Season/string()" }
        XmlRole { name: "Episode"; query: "Episode/string()" }
        XmlRole { name: "ParentalLevel"; query: "ParentalLevel/string()" }
        XmlRole { name: "Visible"; query: "Visible/string()" }
        XmlRole { name: "Watched"; query: "Watched/string()" }
        XmlRole { name: "Processed"; query: "Processed/string()" }
        XmlRole { name: "ContentType"; query: "ContentType/string()" }
        XmlRole { name: "FileName"; query: "FileName/string()" }
        XmlRole { name: "Hash"; query: "Hash/string()" }
        XmlRole { name: "HostName"; query: "HostName/string()" }
        XmlRole { name: "Coverart"; query: "Coverart/string()" }
        XmlRole { name: "Fanart"; query: "Fanart/string()" }
        XmlRole { name: "Banner"; query: "Banner/string()" }
        XmlRole { name: "Screenshot"; query: "Screenshot/string()" }
        XmlRole { name: "Trailer"; query: "Trailer/string()" }
        onStatusChanged: {
            if (status == XmlListModel.Ready){
                buyfferIndicator.opacity = 0
                buyfferIndicator.running = false
            }
            if (status === XmlListModel.Loading) {
                buyfferIndicator.opacity = 1
                buyfferIndicator.running = true
                console.log("LOADING>>>>>>>")
            }
            if (status === XmlListModel.Error){
                console.log("Error: " + errorString + "\n \n \n " + videoNfo.source.toString());
        }
            }
    }

    XmlListModel{
        id: videoSingleNfo
        source:""// DataBase.ipAddress()+":"+DataBase.port()+Util.getAllVideos+"?Id="+"137"
        query: "/VideoMetadataInfo"
        XmlRole { name: "id"; query: "Id/string()" }
        XmlRole { name: "title"; query: "Title/string()" }
        XmlRole { name: "SubTitle"; query: "SubTitle/string()" }
        XmlRole { name: "Tagline"; query: "Tagline/string()" }
        XmlRole { name: "Director"; query: "Director/string()" }
        XmlRole { name: "Studio"; query: "Studio/string()" }
        XmlRole { name: "Description"; query: "Description/string()" }
        XmlRole { name: "Collectionref"; query: "Collectionref/string()" }
        XmlRole { name: "HomePage"; query: "HomePage/string()" }
        XmlRole { name: "ReleaseDate"; query: "ReleaseDate/string()" }
        XmlRole { name: "AddDate"; query: "AddDate/string()" }
        XmlRole { name: "UserRating"; query: "UserRating/string()" }
        XmlRole { name: "Length"; query: "Length/string()" }
        XmlRole { name: "PlayCount"; query: "PlayCount/string()" }
        XmlRole { name: "Season"; query: "Season/string()" }
        XmlRole { name: "Episode"; query: "Episode/string()" }
        XmlRole { name: "ParentalLevel"; query: "ParentalLevel/string()" }
        XmlRole { name: "Visible"; query: "Visible/string()" }
        XmlRole { name: "Watched"; query: "Watched/string()" }
        XmlRole { name: "Certification"; query: "Certification/string()" }
        XmlRole { name: "ContentType"; query: "ContentType/string()" }
        XmlRole { name: "FileName"; query: "FileName/string()" }
        XmlRole { name: "Hash"; query: "Hash/string()" }
        XmlRole { name: "HostName"; query: "HostName/string()" }
        XmlRole { name: "Coverart"; query: "Coverart/string()" }
        XmlRole { name: "Fanart"; query: "Fanart/string()" }
        XmlRole { name: "Banner"; query: "Banner/string()" }
        XmlRole { name: "Screenshot"; query: "Screenshot/string()" }
        XmlRole { name: "Trailer"; query: "Trailer/string()" }
        onStatusChanged: {
            if (status === XmlListModel.Loading){
//                console.log("Loading");
//                DataBase.createInitMainPortDatabase()
//                DataBase.createInitMainDatabase()
//                DataBase.frontendDatabase()
            }
            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + videoNfo.source.toString());
        }
    }

}


