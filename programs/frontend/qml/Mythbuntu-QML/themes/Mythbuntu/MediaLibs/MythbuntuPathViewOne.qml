import QtQuick 2.0
import QtQuick.Window 2.0
import MythTv 1.0
PathViewOne{
    id: gridVideo
    rootBackgroundImg: "../background.png"
    previewsBackgroundImage: "../background.png"
    mainBackgroundImage: "../background.png"
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
