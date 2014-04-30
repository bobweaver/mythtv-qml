import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Window 2.0
import  MythTv 1.0
import  MythDB 1.0
Image {
    id: rootImage
    source: "../background.png"
    width: parent.width
    height: parent.height
    Image {
        id: fanart
        source: "../background.png"
        width: parent.width
        height: parent.height
    }
    Text {
        id: mange
        text: qsTr("Manage Recording Rules")
        color: "white"
        font.pixelSize:  32
        height: 40
        width: parent.width
    }
    //List view of recordings
    Rectangle{
        id:topRec
        radius: 8
        color: "#88000000"
        width: parent.width / 1.01
        height:parent.height / 1.88
        anchors{
            top: mange.bottom
            horizontalCenter: mange.horizontalCenter
        }
        MythListRecordingRules{
            id: mythtf
            w: topRec.width
            h: topRec.height
            name: name
            onBannerClicked:{
            }
        }

    }

    /////////////
    ///////////////////////////////////////

    //Bottom Rectangle All the info and button to load metadata
    Rectangle{
        id: bottomRec
        color: "#94000000"
        radius:    8
        width: parent.width / 1.02
        height:parent.height / 2.4
        anchors.bottom:  parent.bottom
        anchors.horizontalCenter: mange.horizontalCenter

        Text{
            id: titles
            text: ""
            color: "white"
            font.pixelSize:  48
            height: 54
        }

        MythPictureButton{
            id: metadata
            height: 54
            width: 54
            buttonImage:"../../../artwork/mythbuntu.png"
            anchors.right: parent.right
            onButtonClicked:{
                mediascreen.x = 0
                mediascreen.opacity = 1
                metaData.source = encodeURI(DataBase.ipAddress()+":"
                                            +DataBase.port()+"/Video/LookupVideo?Title="+titles.text+"&Season="
                                            +seasonNumber.text+"&Episode="+epNumber.text )

            }
        }
        Image{
            id: coverart
            source: ""
            width: parent.width / 4.8
            height:parent.height /  1.3
            anchors.top: titles.bottom
        }
        Rectangle{
            id: backupRec
            anchors.fill:  coverart
            color:  coverart.status === Image.Error ? "#88FFFFFF": "transparent"
        }

        Text {
            id: desc
            text: ""
            color: "white"
            font.pixelSize: 26
            width: bottomRec.width / 1.5
            wrapMode: Text.WordWrap
            anchors{
                left: backupRec.right
                leftMargin: bottomRec.width / 26
                top: backupRec.top
            }
            Text{
                 id: seasonNumber
                 text: ""
                 color: "white"
                 font.pixelSize:  48
                 height: 54
             }
            Text{
                id: epNumber
                text: ""
                color: "white"
                font.pixelSize:  48
                height: 54
            }
        }

    }///RecRules


    //MetadataScreen

    Rectangle{
        id: mediascreen
        opacity: 0
        width: rootImage.width
        height: rootImage.height
        color: "#000000"
        x: rootImage.width * 2
        Behavior on x {
            NumberAnimation{
                duration: 1200
                easing.type: Easing.InBounce
            }
        }
        Behavior on opacity {
            NumberAnimation{
                duration: 2200
                easing.type: Easing.OutQuint
            }
        }
        ListView{
            width: rootImage.width
            height: rootImage.height
            model:metaData
            delegate: Item{
                width: rootImage.width
                height: rootImage.height /4.2
                Column{
                    width: rootImage.width
                    height: rootImage.height
                    spacing: 10
                    Rectangle{
                        id: bannerRec
                        width: rootImage.width
                        height: rootImage.height / 4
                        color: "#92000000"
                        radius:    20
                        Image {
                            id: bannerSelector
                            width: rootImage.width / 1.02
                            height: rootImage.height / 4.2
                            source:{
                                if ( Banner === "" )
                                    CoverArt
                                if (Fanart === "")
                                    Banner
                                else
                                    Fanart
                            }
                            onStatusChanged: {
                                if (status === Image.Ready){
                                    titleOfMetaData.opacity = 0
                                }
                            }
                            anchors.centerIn:  bannerRec
                            MouseArea{
                                id: bannerSelectorMouseArea
                                anchors.fill: bannerSelector
                                onClicked: {
                                    //                                    con.createConnection("192.168.1.21","mythconverg","mythtv", "kweQI1U9")
                                    //                                        initref, season, host,coverart,fanart, banner)
                                    function grabberType(uri){
                                        var ds = uri
                                        var sd = ds.substring(ds.indexOf("http://")+7)
                                        var sdd = sd.substring(0,sd.indexOf(".") )
                                        if (sdd === "www")
                                            return DataBase.ipAddress()+":"+DataBase.port()+"/Video/LookupVideo?Season="+Season+"&Episode="+Episode+"&Inetref="+Inetref
                                        else
                                            return DataBase.ipAddress()+":"+DataBase.port()+"/Video/LookupVideo?Inetref="+Inetref
                                    }
                                    var a =  Inetref
                                    var b =  Season
                                    var c =  "ubuntu"
                                    var d = CoverArt
                                    var e =  Fanart
                                    var f =  Banner
                                    //                                    con.insertRecordedArtwork(a,b,c,d,e,f)
                                    console.log(a +"\n"
                                                +b +"\n"
                                                +c +"\n"
                                                +d +"\n"
                                                +e +"\n"
                                                +f +"\n"
                                                + grabberType(bannerSelector.source.toString())
                                                )
                                    //FIX me this is where metadata page is loaded by a loader.
                                    metachoices.opacity = 1
                                    metachoices.x = 0

                                    metaDatasingle.source = grabberType(bannerSelector.source.toString())
                                }
                            }
                            Text {
                                id: titleOfMetaData
                                text: Title
                                opacity: 1 //bannerSelector.status === Image.Error || Image.Loading ?  1 : bannerSelector.status === Image.Ready ? 0 : 0
                                color: "white"
                                anchors.centerIn: bannerSelectorMouseArea
                            }
                            Text {
                                id: initRef
                                text: Inetref
                                //                                opacity: 1 //bannerSelector.status === Image.Error || Image.Loading ?  1 : bannerSelector.status === Image.Ready ? 0 : 0
                                color: "transparent"
                                anchors.centerIn:  parent
                            }
                            Image {
                                id: sourceImage
                                width: rootImage.height / 6.2
                                height: rootImage.height / 6.2
                                opacity: .80
                                anchors{
                                    verticalCenter: parent.verticalCenter
                                    right: parent.right
                                    rightMargin: parent.width / 20
                                }
                                source: {
                                    var ds = bannerSelector.source.toString()
                                    var sd = ds.substring(ds.indexOf("http://")+7)
                                    var sdd = sd.substring(0,sd.indexOf(".") )
                                    if (sdd === "www")

                                        return "../../../artwork/tvdb.jpg"
                                    else
                                        return "../../../artwork/tmdb.jpg"


                                }
                            }

                        }
                    }
                }
            }
        }
    }

    Rectangle{
        id: metachoices
        opacity: 0
        width: Screen.width
        height: Screen.height
        color: "#000000"
        x: rootImage.width * 2
        Behavior on x {
            NumberAnimation{
                duration: 1200
                easing.type: Easing.InBounce
            }
        }
        Behavior on opacity {
            NumberAnimation{
                duration: 2200
                easing.type: Easing.OutQuint
            }
        }
        ListView{
            width:    parent.width
            height: parent.height
            model: metaDatasingle
            delegate: Item{
                width:    parent.width
                height: parent.height
                Image {
                    id: fanartPic
                    source: Fanart
                    width: Screen.width
                    height: Screen.height
                }
                Image{
                    id:banner
                    source: Banner
                    width: Screen.width
                    height: Screen.height / 5
                    opacity:  .77
                    //               color:"white"
                    //               font.pixelSize:  64
                }
                Rectangle{
                    id:editArea
                    color: "#88000000"
                    width: Screen.width / 2
                    height: Screen.height / 2
                    radius: 20
                    anchors.top: banner.bottom
                    Column{
                        Rectangle{
                            id: intref
                            color: "#88000000"
                            width: Screen.width / 10
                            height: Screen.height / 14
                            radius: 20
                            TextInput{
                                id: intNum
                                anchors.fill: intref
                                text:  Inetref
                                color: "white"
                                cursorVisible: activeFocus === true ? true : false
                                font.pixelSize: 22
                            }
                        }
                        Rectangle{
                            id: seasonNumber
                            color: "#88000000"
                            width: Screen.width / 10
                            height: Screen.height / 14
                            radius: 20
                            TextInput{
                                id:seaNum
                                anchors.fill: seasonNumber
                                text: Season
                                color: "white"
                                cursorVisible: activeFocus === true ? true : false
                                font.pixelSize: 22
                            }
                        }



                        Rectangle{
                            id: epNumber
                            color: "#88000000"
                            width: Screen.width / 10
                            height: Screen.height / 14
                            radius: 20
                            TextInput{
                                id:epNum
                                anchors.fill: epNumber
                                text: Episode
                                color: "white"
                                cursorVisible: activeFocus === true ? true : false
                                font.pixelSize: 22
                            }
                        }
                        MythButton{
                            width: Screen.width / 10
                            height: Screen.height / 14
                            name: "refresh"
                            nameColor: "white"
                            namepxSize: 22
                            onButtonClick: {
                                metaDatasingle.source =
                                        DataBase.ipAddress()
                                        +":"+DataBase.port()+"/Video/LookupVideo?Season="
                                        +seaNum.text
                                +"&Episode="
                                +epNum.text
                                +"&Title="+ titles.text
                            }

                        }
                    }

                }



                Image {
                    id: coverArt
                    source: CoverArt
                    width: Screen.height / 4.7
                    height: Screen.height / 4.7
                    //                anchors{
                    //                 right: parent.right
                    //                 bottom: parent.bottom
                    //                }
                }

            }
        }
    }//metachoices


    MythSql{id: con}

    XmlListModel{
        id: metaData
        source: ""
        query: "/VideoLookupList/VideoLookups/VideoLookup"
        XmlRole{name: "Title";query: "Title/string()"}
        XmlRole{name: "SubTitle";query: "SubTitle/string()"}
        XmlRole{name: "Season";query: "Season/string()"}
        XmlRole{name: "Episode";query: "Episode/string()"}
        XmlRole{name: "Description";query: "Description/string()"}
        XmlRole{name: "Year";query: "Year/string()"}
        XmlRole{name: "Inetref";query: "Inetref/string()"}
        XmlRole{name: "ReleaseDate";query: "ReleaseDate/string()"}
        XmlRole{name: "UserRating";query: "UserRating/string()"}
        XmlRole{name: "Length";query: "Length/string()"}
        XmlRole{name: "Language";query: "Language/string()"}
        XmlRole{name: "Popularity";query: "Popularity/string()"}
        XmlRole{name: "Budget";query: "Budget/string()"}
        XmlRole{name: "Revenue";query: "Revenue/string()"}
        XmlRole{name: "IMDB";query: "IMDB/string()"}

        XmlRole{name: "CoverArt" ; query: "Artwork/ArtworkItem[Type='coverart'][1]/Url/string()"}
        XmlRole{name: "CoverArtThumb";query: "Artwork/ArtworkItem[Type='coverart'][1]/Thumbnail/string()"}

        XmlRole{name: "Fanart";query: "Artwork/ArtworkItem[Type='fanart'][1]/Url/string()"}
        XmlRole{name: "FanartThumb";query: "Artwork/ArtworkItem[Type='fanart'][1]/Thumbnail/string()"}

        XmlRole{name: "Banner";query: "Artwork/ArtworkItem[Type='banner'][1]/Url/string()"}
        XmlRole{name: "BannerThumb";query: "Artwork/ArtworkItem[Type='banner'][1]/Thumbnail/string()"}
    }



    XmlListModel{
        id: metaDatasingle
        source: ""      //DataBase.ipAddress()+":"+DataBase.port()+"/Video/LookupVideo?Title="
        query: "/VideoLookupList/VideoLookups/VideoLookup"
        XmlRole{name: "Title";query: "Title/string()"}
        XmlRole{name: "SubTitle";query: "SubTitle/string()"}
        XmlRole{name: "Season";query: "Season/string()"}
        XmlRole{name: "Episode";query: "Episode/string()"}
        XmlRole{name: "Description";query: "Description/string()"}
        XmlRole{name: "Year";query: "Year/string()"}
        XmlRole{name: "Inetref";query: "Inetref/string()"}
        XmlRole{name: "ReleaseDate";query: "ReleaseDate/string()"}
        XmlRole{name: "UserRating";query: "UserRating/string()"}
        XmlRole{name: "Length";query: "Length/string()"}
        XmlRole{name: "Language";query: "Language/string()"}
        XmlRole{name: "Popularity";query: "Popularity/string()"}
        XmlRole{name: "Budget";query: "Budget/string()"}
        XmlRole{name: "Revenue";query: "Revenue/string()"}
        XmlRole{name: "IMDB";query: "IMDB/string()"}

        XmlRole{name: "CoverArt" ; query: "Artwork/ArtworkItem[Type='coverart'][1]/Url/string()"}
        XmlRole{name: "CoverArtThumb";query: "Artwork/ArtworkItem[Type='coverart'][1]/Thumbnail/string()"}

        XmlRole{name: "Fanart";query: "Artwork/ArtworkItem[Type='fanart'][1]/Url/string()"}
        XmlRole{name: "FanartThumb";query: "Artwork/ArtworkItem[Type='fanart'][1]/Thumbnail/string()"}

        XmlRole{name: "Banner";query: "Artwork/ArtworkItem[Type='banner'][1]/Url/string()"}
        XmlRole{name: "BannerThumb";query: "Artwork/ArtworkItem[Type='banner'][1]/Thumbnail/string()"}
    onSourceChanged: {
        metaDatasingle.reload();
    console.log(source)
    }
    }


}
