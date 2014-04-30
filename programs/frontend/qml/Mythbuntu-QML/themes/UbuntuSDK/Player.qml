import QtQuick 2.0
import Ubuntu.Components 0.1
import QtMultimedia 5.0
import MythTv 1.0
Rectangle {
    id: rootTangle
    property string videoSource: videos.source
    property string videoAutoLoad: videos.autoLoad
    property string videoAutoPlay: videos.autoPlay
    property string videoMuted: videos.muted
    property double videoVol: videos.volume
    property bool videoMenuState: videoMenu.state
//    property string backClicked: backButton.onClicked
    color: "black"
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

    ActivityIndicator {
        id: buyfferIndicator
        visible: videos.status !== 6 ? true : false
        anchors.centerIn: videosMouse
        running: videos.status !== 6 ? true : false
        width: rootTangle.width /4
        height: rootTangle.height /4
    }
    UbuntuShape{
        id: volRec
        width:    volSlider.width
        height: volSlider.width
        rotation: 90
        opacity: 0
        anchors.bottom: videoMenu.top
        color: "#88000000"

        Slider{
            id: volSlider
            anchors.centerIn: volRec
            minimumValue:  1.0
            maximumValue: 0.0
            value: .8
            live: true
            opacity: 0
        }

    }


    Rectangle{
        id: videoMenuTop
        width: rootTangle.width
        height: rootTangle.height / 10
        y:   (-height)
        color: "#66000000"
        Row{
            width: rootTangle.width
            height: rootTangle.height / 10
        Button{
            id: backButton
//            color: "#66000000"
            height: videoMenuTop.height - 1
  onClicked:{
      videos.stop()
internalPlayer.y = rootTangle.height * 2
 internalPlayer.opacity = 0
  }
      text: "back"
    }
//        Text {
//            id: videoName
//            text: descriptionTXT.text
//            font.pixelSize: 18
//            color: "white"
//        }
}



    }







    Rectangle{
        id: videoMenu
        width: rootTangle.width
        height: rootTangle.height / 10
        y: rootTangle.height * 2
        color: "#66000000"

        Row{
            spacing: 4
            anchors.centerIn: parent
            Button{
//                color: "#66000000"
                height: videoMenu.height - 1
                onClicked: {
//                    console.log(Util.milliSecondsToString(videos.position))
                    if (videos.playbackState === 1)
                        videos.pause()
                    else
                        videos.play()
                }
                text: {
                    if (videos.playbackState === 1 )
                        "pause"
                    else
                        "play"
                }
            }

            Button{
                id: volButton
//                color: "#88000000"
                text: "V"
                onClicked: {

                    if (volSlider.opacity === 0 ) {
                        volSlider.opacity = 1
                        volRec.opacity = 1
                    }else{
                        volSlider.opacity = 0
                        volRec.opacity = 0
                    }
                }
            }
//            Button{
//                onClicked: {

//                   console.log( videos.seek(5000))
//                }
//                text: "FF"
//            }
            //Button{
            // onClicked: {

            //        videos.seek(5000)
            // }
            // text: "RR"
            //}
            //Button{
            // onClicked: {

            //        videos.stop()
            // }
            // text: "stop"
            //}
            //Text {
            //    id: name
            //    text: Util.milliSecondsToString(videos.position)
            //    color: "white"
            //}
            ProgressBar {
                width: videoMenu.width / 1.4
                height:  videoMenu.height / 1.4
                minimumValue: 0000000
                maximumValue:  videos.duration
                value: videos.position
            }
            Text {
                id: leftTime
                text: Util.milliSecondsToString((videos.duration) - (videos.position) )
                color: "white"
            }
        }
    }
}
