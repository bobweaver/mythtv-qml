import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 0.1
import QtQuick.XmlListModel 2.0
import MythTv 1.0
Rectangle {
    id:scheduleRoot
    width: parent.width
    height: parent.height    


    Rectangle{
        id: homeChannelRec
        color: "grey"
        width: scheduleRoot.width
        height: scheduleRoot.height
        GridView {
            focus: true
            contentHeight: scheduleRoot.height
            contentWidth: scheduleRoot.width
            width: scheduleRoot.width
            height: scheduleRoot.height
            cacheBuffer: 1000
            cellHeight: scheduleRoot.height / 4
            cellWidth: scheduleRoot.width
            clip: true
            model: schedule
            delegate: Item {
                width: scheduleRoot.width /4.2
                height: scheduleRoot.height / 4.2
                Rectangle{
                    id:chanInfo
                    width: scheduleRoot.width
                    height: scheduleRoot.height / 4.2
                    color: "#66000000"
                    ScheduleCat{
                        width: chanInfo.width * 12
                        height: chanInfo.height
                        anchors.left: channelHomeButton.right
                    }
                    UbuntuShape{
                        id:channelHomeButton
                        width: scheduleRoot.width / 4.2
                        height: scheduleRoot.height / 4.2
                        color: "grey"
                        image: Image{
                            id: channelHomeButtonImg
                            anchors.centerIn: parent
                            source:{
                                DataBase.ipAddress()+":"+DataBase.port()+IconURL
                        }
                            MouseArea{
                                id : channelHomeButtonImgMouseArea
                               anchors.fill: channelHomeButtonImg
onClicked: {
internalPlayer.videoSource = DataBase.ipAddress()+":"+DataBase.port()+ "/Content/GetRecording?ChanId="+ChanID+"&StartTime="+StartTime
}
                            }
                    }
                    Text {
                        id:nameQW
                        color: "white"
                        visible:  channelHomeButtonImg.status === Image.Error ? true : false
                        font.pixelSize: 12
                        text: CallSign
                        anchors.centerIn: channelHomeButtonImgMouseArea
                    }
                    Text {
                        id: chanID
                        text: ChanId
                        color: "transparent"
                    }
                }
            }
        }
    }
        Player{
            y: scheduleRoot.height * 2
            id: internalPlayer
            width:  scheduleRoot.width
            height: scheduleRoot.height
            opacity: 0
            videoAutoLoad: "false"
            videoAutoPlay: "true"
            videoSource: ""
        }



    XmlListModel {
        id: schedule
        source: DataBase.ipAddress()+":"+DataBase.port()+"/Guide/GetProgramGuide?StartTime="+Util.now.toISOString()+"&EndTime="+Util.time2.toISOString()
        query: "//  ProgramGuide/Channels/ChannelInfo"
        XmlRole {name: "ChanId"; query: "ChanId/string()"}
        XmlRole { name: "ChanNum"; query: "ChanNum/string()" }
        XmlRole { name: "CallSign"; query: "CallSign/string()" }
        XmlRole{name: "IconURL"; query: "IconURL/string()" }
        XmlRole{name: "ChannelName"; query: "ChannelName/string()" }
        //debug
        onStatusChanged: {
            if (status == XmlListModel.Ready){console.log("Loaded" + source)
            }
            if (status === XmlListModel.Loading) console.log("Loading");
            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + schedule.source.toString());
        }
        onCountChanged: {
            console.log("Count changed to: " + count)
        }
    }
}
}
