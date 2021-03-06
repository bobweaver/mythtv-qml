import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import MythTv 1.0
import Ubuntu.Components 0.1
Image{
    property bool loading
    property alias rootBackgroundImg: videosRoot.source
    property string previewsBackgroundImage: previewsRec.source
    property string  previewsMainTextColor: itemName.color
    property int  previewsMainTextpxSize: itemName.font.pixelSize
    property string previewsMainTextEffect: itemName.style
    property string previewsMainTextEffectColor: itemName.styleColor
    property string previewsMainTextWraping: itemName.wrapMode
    property double previewsMainTextMaxLineCount: itemName.maximumLineCount
    property bool previewsMainTextBold: itemName.font.bold
    property string previewsMainTextFont: itemName.font
    property  string previewsMainTextWeight: itemName.font.weight
    property bool previewsMainTextItalic: itemName.font.italic
    property real previewsMainTextLetterSpacing: itemName.font.letterSpacing
    property bool  previewsMainTextUnderLined: itemName.font.underline
    property string previewsShapeColor: previewShape.color
    id: videosRoot
    width: parent.width
    height: parent.height
    source: ""
    //Previews
    Image{
        id:previewsRec
        y:  videosRoot.height + 10
        scale:  .9
        source: ""

        width:  videosRoot.width
        height: videosRoot.height
        Behavior on y {NumberAnimation{duration: 900; easing.type: Easing.OutBack}}
        Behavior on opacity {NumberAnimation{duration: 1800; easing.type: Easing.OutQuad}}
        ListView{
            id:previewsItemView
            model: videoSingleNfo
            width:  videosRoot.width
            height: videosRoot.height

            delegate: Item {
                id:  previewsItem
                width:  videosRoot.width
                height: videosRoot.height
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
                            leftMargin: videosRoot.width / 15
                            top: parent.top
                            topMargin: videosRoot.height / 4.2
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
                        width: videosRoot.width / 1.7
                        height: videosRoot.height / 1.7
                        gradient: Gradient{
                            GradientStop { position: 0; color: "#88C7C7C7"}
                            GradientStop { position: 0.5; color: "#44C7C7C7"}
                            GradientStop { position: 1; color: "#88C7C7C7"}
                        }
                        anchors{
                            right:parent.right
                            rightMargin:   videosRoot.width / 20
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
                        width:  videosRoot.width
                        spacing: videosRoot.width / 20
                        anchors{
                            bottomMargin:  videosRoot.height / 40
                            bottom: parent.bottom
                        }

                        MythButton{
                            id:previewsBackButton
                            color: "green"
                            width:    videosRoot.width / 4
                        namepxSize: height/ 1.7
                            height: videosRoot.height / 10
                                onButtonClick: {
                                    gridRec.x = 0
                                    gridRec.opacity = 1
                                    previewsRec.y = videosRoot.height * 2
//                                    console.log("back clicked")
                                }
                                    name: qsTr("Done")
                        }
                        MythButton{
                            id:previewshomepageButton
                            color: "grey"
                          radius: 8

                            width:    videosRoot.width / 5
                            height: videosRoot.height / 10
                            namepxSize: Math.round(height - 2)
                                onButtonClick: {
                                    Qt.openUrlExternally(DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetVideo?Id="+id)
                                }
                                name: qsTr("Open External")
                        }
                        MythButton{
                            id:previewsPlayButton
                            color: "black"
                            width:    videosRoot.width / 4
                            name:  qsTr("Play")
                            namepxSize: height/ 1.7
                            height: videosRoot.height / 10
                                onButtonClick:  {
                                    internalPlayer.opacity = 1
                                    internalPlayer.y = 0
                                    internalPlayer.videoSource =  DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetVideo?Id="+id
                                    internalPlayer.videoAutoPlay = false
                                    console.log(DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetVideo?Id="+id)



                            }
                        }

                    }
                }
            }
        }
    }//previews end
    //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

    property alias mainBackgroundImage: gridRec.source

    property string fanartBackgroundColor: backey.color

    property string mainTextColor: textID.color

    property real  mainTextpxSize: textID.font.pixelSize

    property int mainTextEffect: textID.style

    property string mainTextEffectColor: textID.styleColor

    property int mainTextWraping: textID.wrapMode

    property double mainTextMaxLineCount: textID.maximumLineCount

    property bool mainTextBold: textID.font.bold

    property string mainTextFont: textID.font

    property  int mainTextWeight: textID.font.weight

    property bool mainTextItalic: textID.font.italic

    property real mainTextLetterSpacing: textID.font.letterSpacing
    property bool  mainTextUnderLined: textID.font.underline
    Image{
        id: gridRec
        width:  videosRoot.width
        height: videosRoot.height
        source: ""
        Behavior on x {NumberAnimation{duration: 900; easing.type: Easing.OutBack}}
        Text {
            id: header
            text: qsTr("Videos")
            font.pixelSize: 64
            height:    70// parent.height
            width: parent.width
            color :"white"
            opacity: 1
            Behavior on opacity{NumberAnimation { duration: 2200; easing.type: Easing.OutQuint }}
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
                leftMargin: parent.width / 20
                top: header.bottom
            }
            model: videoNfo
            delegate: Item {
                id:stateOneItem
                focus: true
                width: videosRoot.width / 4.5
                height: videosRoot.height / 3.5
                Text{
                    id:markerID
                    color: "transparent"
                    text: id
                }
                //background to the Image
                Rectangle{
                    id:backey
                    width: parent.width / 1.3
                    height:    parent.height
                    color: fanartBackgroundColor
                    Image {
                        id: fallback
                        source: "../artwork/mythbuntu.png"
                        anchors.centerIn: backey
                        width: backey.width / 2
                        height:     backey.height / 2
                    }
                    Image {
                        id:mainImage
                        smooth: false
                        sourceSize.height: backey.height
                        sourceSize.width: backey.width
                        anchors.centerIn: fallback
                        scale:{
                            if (status === Image.Ready)
                                1
                            else
                                0
                        }
                        Behavior on scale{
                            NumberAnimation{
                                duration: 200
                                easing.type: Easing.OutBack
                            }
                        }
                        fillMode: Image.PreserveAspectFit
                        source: {
                            if (DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?StorageGroup=Coverart&FileName="
                                    +Coverart === Image.Error || Image.Loading)
                                DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?Fanart=Coverart&FileName="+Fanart
                            if (DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?Fanart=Coverart&FileName="
                                    +Fanart === Image.Error || Image.Loading)

                                DataBase.ipAddress()+":"+DataBase.port()+"/Content/GetImageFile?StorageGroup=Coverart&FileName="+Coverart

                            else
                                opacity = 0
                        }
                    }
                }
                MouseArea{
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
                        gridRec.x = videosRoot.width + 10
                        previewsRec.y = 0
                        videoSingleNfo.source = DataBase.ipAddress()+":"+DataBase.port()+"/Video/GetVideo?Id="+(markerID.text)
                    }
                }
                Text {
                    id: textID
                    text:{ContentType === "MOVIE" ? title : SubTitle}
                    width: backey.width
                    color: mainTextColor
                    font.pixelSize:  mainTextpxSize
                    style: mainTextEffect
                    styleColor:  (mainTextEffectColor)
                    wrapMode:  mainTextWraping
                    maximumLineCount:  mainTextMaxLineCount
                    font.bold:  mainTextBold
                    font.weight:  mainTextWeight
                    font.italic:  mainTextItalic
                    font.letterSpacing:  mainTextLetterSpacing
                    font.underline:  false //: mainTextUnderLined
                    anchors{
                        top: backey.bottom
                        topMargin: 1
                    }
                }
            }
        }//GridView
    }

    ActivityIndicator {
        anchors.centerIn: parent
        id: buyfferIndicator
        visible: false
        running: false
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


        //        FixME Add option to see if the count has changed and if it has refill the data base if not ue the database. or if error make use Local Storage
        //        onCountChanged: {}
        onStatusChanged: {
            if (status == XmlListModel.Ready){
                buyfferIndicator.visible = false
                buyfferIndicator.running = false
                header.opacity = 1
            }
            if (status === XmlListModel.Loading) {
                buyfferIndicator.visible = true
                buyfferIndicator.running = true
                console.log("LOADING>>>>>>>")

            }
            if (status === XmlListModel.Error){

                console.log("Error: " + errorString + "\n \n \n " + videoNfo.source.toString());
source = DataBase.ipAddress()+":"+DataBase.port()+Util.getAllVideos
                                reload()
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
                console.log("Loading");
                DataBase.createInitMainPortDatabase()
                DataBase.createInitMainDatabase()
                DataBase.frontendDatabase()
            }
            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + videoNfo.source.toString());
        }
    }
}//videosRoot
