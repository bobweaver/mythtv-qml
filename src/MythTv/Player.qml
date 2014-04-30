import QtQuick 2.0
import QtMultimedia 5.0
import "Util.js" as Util
//import "../common"
Rectangle {
    id: rootTangle
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string videoSource: videos.source
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string videoStatus: videos.status
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string videoAutoLoad: videos.autoLoad
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string videoAutoPlay: videos.autoPlay
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string videoMuted: videos.muted
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property double videoVol: videos.volume
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property bool videoMenuState: videoMenu.state
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string  mainBackgroundColor: rootTangle.color
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string bottomBarColor: videoMenu.color
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string topBarColor: videoMenuTop.color
    color: mainBackgroundColor
    width: parent.width
    height: parent.height
    Video{
        id:videos
        anchors.fill: rootTangle
        source: parent.videoSource
        autoLoad: parent.videoAutoLoad
        autoPlay: parent.videoAutoPlay
        muted : false
        volume: volSlider.value
    }
    MouseArea{
        id: videosMouse
        anchors.fill: videos
        onDoubleClicked: {
            if (videos.playbackState === 1){
                videos.pause()
            }else{
                videos.play()
            }
        }
        onClicked: {
            if (videoMenuTop.y !== 0){
                videoMenu.y = rootTangle.height - (videoMenu.height )
                videoMenuTop.y = 0
            }else{
                videoMenuTop.y = (-rootTangle.height / 10)
                videoMenu.y = rootTangle.height * 2
            }
        }
    }

    MythActivityVideo {
        id: buyfferIndicator
        opacity: videos.status !== 6 || videos.playbackState === 2 ? 1 : 0
        anchors.centerIn: videosMouse
        running : videos.status !== 6 || videos.playbackState === 2  ? true : false
        width: rootTangle.width
        height: rootTangle.height
    }
    Rectangle{
        id: volRec
        width:    parent.width / 4
        height: parent.height / 14
        rotation: 270
        opacity: 0
        x : 400
        y: 400
        color: "#00000000"
        MythSlider{
            id: volSlider
            anchors.fill: volRec
            volButtonBottomG: "blue"
            volButtonTopG: "green"
            bkBottomG: "purple"
            bkTopG: "#99C7C7C7"
            minimum:   0
            maximum:  1
            value: .8
            opacity: 0
        }
    }
    Rectangle{
        id: videoMenuTop
        width: rootTangle.width
        height: rootTangle.height / 10
        y:   (-height)
        color: bottomBarColor
        MythButton{
            id: backButton
            buttonColor:  "white"
            height: videoMenuTop.height - 1
            width: videoMenuTop.width / 12
            onButtonClick: {
                videos.stop()
                internalPlayer.y = rootTangle.height * 2
                internalPlayer.opacity = 0
            }
            name: "back"
        }

        MythButton{
            id: ffButton
            buttonColor:  "white"
            height: videoMenuTop.height - 1
            width: videoMenuTop.width / 12
            x: rootTangle.width - (width *2)
            onButtonClick: {
                videos.seek(videos.position +10000)
                console.log(videos.position)
            }
            name: "FF"
            //                anchors.right: parent.right
        }
        MythButton{
            id: rrButton
            buttonColor:  "white"
            height: videoMenuTop.height - 1
            width: videoMenuTop.width / 12
            onButtonClick: {
                videos.seek(videos.position - 10000)
                console.log(videos.position)
            }
            name: "RR"
            anchors{
                rightMargin: 1
                right: parent.right
            }
        }
    }
    Rectangle{
        id: videoMenu
        width: rootTangle.width
        height: rootTangle.height / 10
        y: rootTangle.height * 2
        color: topBarColor
        Row{
            spacing: 4
            width: rootTangle.width
            height: rootTangle.height / 10
            MythButton{
                buttonColor:  "white"
                height: videoMenu.height - 1
                width: videoMenu.width /12
                onButtonClick: {
                    if (videos.playbackState === 1){
                        videos.pause()
                        console.log(videos.playbackState)
                    }else{
                        videos.play()
                    }
                }
                name: {
                    if (videos.playbackState === 1 )
                        "pause"
                    else
                        "play"
                }
            }

            MythPictureButton{
                id: volButton
                buttonImage: "../themes/Mythbuntu/type/surround.png"
                height: videoMenu.height - 1
                width: videoMenu.width /12
                onButtonClicked:  {
                    if (volSlider.opacity === 0 ) {
                        volSlider.opacity = 1
                        volRec.opacity = 1
                    }else{
                        volSlider.opacity = 0
                        volRec.opacity = 0
                    }
                }
            }
            MythProgession {
                width: videoMenu.width / 1.4
                height:  videoMenu.height / 1.4
                minimum: 0000000
                maximum:  videos.duration
                value: videos.position
                color: "grey"
                margins: 4
                borderColor: "green"

            }

            Text {
                id: leftTime
//                anchors.horizontalCenter: parent.horizontalCenter
                text: Util.milliSecondsToString((videos.duration) - (videos.position) )
                color: "white"
            }
        }
    }
    MythPlayerSettings{
        id: settingsBlade
        width: parent.width / 3
        height: parent.height
        backgroundColor:   "#88000000"
        opacity: 0
        x: parent.width * 2
        Behavior on x {NumberAnimation{duration: 1200; easing.type: Easing.OutBack}}
    }
}
