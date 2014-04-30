import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import MythTv 1.0
import QtQuick.XmlListModel 2.0
import QtQuick.Window 2.0
import "../../../examples"

Rectangle {
    id:scheduleRoot
    width: Screen.width
    height: Screen.height

    Image{
        id: homeChannelRec
        source: "../background.png"
        width: scheduleRoot.width
        height: scheduleRoot.height


        Rectangle{
            id:previewsRec
            width:  scheduleRoot.width
            height: scheduleRoot.height
            color: "transparent"
            y:  scheduleRoot.height + 10
            opacity: 0
            Behavior on y {NumberAnimation{duration: 900; easing.type: Easing.OutBack}}
            Behavior on opacity {NumberAnimation{duration: 1800; easing.type: Easing.OutQuad}}
            Image{
                source: ""
                width:  scheduleRoot.width
                height: scheduleRoot.height

                ListView{
                    id:previewsItemView
                    model: scheduleSingle
                    width:  scheduleRoot.width
                    height: scheduleRoot.height
                    delegate: Item {
                        id:  previewsItem
                        width:  scheduleRoot.width
                        height: scheduleRoot.height
                        Rectangle{
                            id:previewsMain
                            color: "#88000000"
                            anchors.fill: previewsItem
                            Image {
                                width: parent.width
                                height: parent.height
                                id: backgroundPreviewsImage
                                source: DataBase.ipAddress()+":"+DataBase.port()+IconURL
                            }
                            Rectangle{
                                id:previewShape
                                width: parent.width  / 5
                                height:    parent.height / 2
                                color:  "#88000000"
                                anchors{
                                    left: parent.left
                                    leftMargin: scheduleRoot.width / 15
                                    top: parent.top
                                    topMargin: scheduleRoot.height / 4.2
                                }
                                Image {
                                    id:mainPreviewImage
                                    smooth: false
                                    sourceSize.height: previewShape.height
                                    sourceSize.width: previewShape.width
                                    anchors.centerIn: previewShape
                                    source: {
                                        DataBase.ipAddress()+":"+DataBase.port()+"/Guide/GetChannelIcon?ChanId="+ChanId
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
                                    text:Title
                                    font.pixelSize: 24
                                    color: "black"
                                    anchors{
                                        left:  mainPreviewImage.left
                                        bottom:  parent.top
                                        bottomMargin: parent.height / 12
                                    }
                                }
                            }
                            Rectangle{
                                id:descriptionRec
                                width: scheduleRoot.width / 1.7
                                height: scheduleRoot.height / 1.7
                                gradient: Gradient{
                                    GradientStop { position: 0; color: "#88C7C7C7"}
                                    GradientStop { position: 0.5; color: "#44C7C7C7"}
                                    GradientStop { position: 1; color: "#88C7C7C7"}
                                }
                                anchors{
                                    right:parent.right
                                    rightMargin:   scheduleRoot.width / 20
                                    verticalCenter: parent.verticalCenter
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
                                        text: Category
                                        width: descriptionRec.width - (descriptionRec.width / 20 )
                                        wrapMode: Text.WordWrap
                                    }
                                    Text {
                                        id: startTimeTXT
                                        text: "StartTime:  \t " + Qt.formatDateTime(StartTime, "h:mm ap")
                                        width: descriptionRec.width - (descriptionRec.width / 20 )
                                        wrapMode: Text.WordWrap
                                    }
                                    Text {
                                        id: endTimeTXT
                                        text: "EndTime: \t "+ Qt.formatDateTime(EndTime, "h:mm ap")
                                        width: descriptionRec.width - (descriptionRec.width / 20 )
                                        wrapMode: Text.WordWrap
                                    }
                                    Text {
                                        id: subtitleTXT
                                        text:{
                                            if (SubTitle.toString() === "")
                                                return  "Has Subtitlt: \t No"
                                            else
                                                return  "Has Subtitle: \t" + SubTitle
                                        }
                                        width: descriptionRec.width - (descriptionRec.width / 20 )
                                        wrapMode: Text.WordWrap
                                    }
                                    Text {
                                        id: repeatTXT
                                        text: "Repeat: \t" +  Repeat + "   " + ArtworkInfos
                                        width: descriptionRec.width - (descriptionRec.width / 20 )
                                        wrapMode: Text.WordWrap
                                    }
                                }


                                Row {
                                    width:  scheduleRoot.width
                                    spacing: scheduleRoot.width / 20
                                    anchors{
                                        bottomMargin:  scheduleRoot.height / 40
                                        bottom: parent.bottom
                                    }



                                    Rectangle{
                                        id:previewshomepageButton
                                        color: "grey"
                                        width:    scheduleRoot.width / 5
                                        height: scheduleRoot.height / 10
                                        MouseArea{
                                            anchors.fill: previewshomepageButton
                                            onClicked: {
                                                previewsRec.opacity = 0
                                                previewsRec.y = scheduleRoot.height * 2
                                                scheduleMainPage.opacity = 1
                                                scheduleMainPage.x = 0

                                            }
                                        }

                                        Text {
                                            id: frontendPlay
                                            anchors.centerIn: previewshomepageButton
                                            text: qsTr("Done")
                                        }


                                    }
                                    Rectangle{
                                        id:previewsPlayButton
                                        color: "grey"
                                        width:    scheduleRoot.width / 4
                                        height: scheduleRoot.height / 10
                                        MouseArea{
                                            id: previewsPlayButtonMouseArea
                                            anchors.fill: previewsPlayButton
                                            onClicked: {
                                                recordingSettings.opacity = 1
                                                recordingSettings.scale = 1
                                                console.log("WTF")
                                            }
                                            Text {
                                                id: play
                                                text: qsTr("Record")
                                                anchors.centerIn: previewsPlayButtonMouseArea
                                            }
                                        }
                                    }

                                }
                            }
                        }
                        ///////////////////POPUP
                        RecordingPopUp{
                            id: recordingSettings
                            scale: 0
                            opacity: 0
                            y: 0
                            Behavior on scale {NumberAnimation{duration: 900; easing.type: Easing.OutBack}}
                            Behavior on opacity {NumberAnimation{duration: 1800; easing.type: Easing.OutQuad}}

                        }


                    }
                }
            }
        }//previews end



















        SearchGuide{
        id: searchGuide
        //width: parent.width / 1.7
        //height: parent.height / 1.7
        opacity:  0
            y: -parent.height * 2
            anchors.centerIn: parent
        }



        Image{
            id: scheduleMainPage
            width: scheduleRoot.width
            height: scheduleRoot.height
            source: ""
            Behavior on x {NumberAnimation{duration: 900; easing.type: Easing.OutBack}}
            Rectangle{
                id: header
                height: parent.height / 3
                width: parent.width
                color: "#881f066f"

            Text {
                id: descText
                text: ""
                color: "white"
                font.pixelSize: height / 8
                width: parent.width / 1.6
                height:    parent.height
                wrapMode: Text.WordWrap

                anchors{
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
            }
            }
            Image{
                id: guideImage
                height:    parent.height / 2
                width:  parent.height / 2
                source: ""
                anchors{
                 verticalCenter: parent.verticalCenter
                 left: parent.left
                 leftMargin: parent.width / 22
                }

            }
            Image {
                id: searchImg
                source: "../search_icon.png"
                height:    parent.height / 8
                width:     parent.width / 12
                anchors{
                    right:  parent.right
                }
            }MouseArea{
                anchors.fill: searchImg
            onClicked: {
                searchGuide.opacity = 1
                searchGuide.y = 0
            }
            }
}
            GridView {

                contentHeight: scheduleRoot.height
                contentWidth: scheduleRoot.width
                width: scheduleRoot.width
                height: scheduleRoot.height
                cacheBuffer: 1000
                cellHeight: scheduleRoot.height / 4
                cellWidth: scheduleRoot.width
                anchors.top: header.bottom
                clip: true
                model: schedule
                delegate: Item {
                    width: scheduleRoot.width /4.2
                    height: scheduleRoot.height / 4.2
                    Text {
                        id:nameQW
                        color: "white"
                        visible:  channelHomeButtonImg.status === Image.Error ||"Unsupported image format" ? true : false
                        font.pixelSize: parent.height / 5
                        text: CallSign
                        anchors.centerIn: channelHomeButton
                    }
                    Rectangle{
                        id:channelHomeButton
                        width: scheduleRoot.width / 4.2
                        height: scheduleRoot.height / 4.2
                        color: "#88000000"
                        radius: 4

                        Image{
                            id: channelHomeButtonImg
                            width: scheduleRoot.width / 4.8
                            height: scheduleRoot.height / 4.8
                            anchors.centerIn:    channelHomeButton
                            source:{
                                DataBase.ipAddress()+":"+DataBase.port()+IconURL
                            }
                        }





                        Rectangle{
                            id:chanInfo
                            width: scheduleRoot.width / 1.3
                            height: scheduleRoot.height / 4.2
                            color: "#66FFFFFF"
                            radius: 4
                            anchors.left: channelHomeButtonImg.right
                         NewGuide{
                                id:guideRow
                                width: chanInfo.width
                                height: chanInfo.height
                         chanId: ChanId
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
        }

        MythActivityVideo {
            id: buyfferIndicator

            anchors.centerIn: parent
            width: homeChannelRec.width
            height: homeChannelRec.height
        }
        XmlListModel {
            id: schedule
            source:DataBase.ipAddress()+":"+DataBase.port()+"/Guide/GetProgramGuide?StartTime="+Util.now.toISOString()+"&EndTime="+Util.time2.toISOString()
            query: "//ProgramGuide/Channels/ChannelInfo"
            XmlRole {name: "ChanId"; query: "ChanId/string()"}
            XmlRole { name: "ChanNum"; query: "ChanNum/string()" }
            XmlRole { name: "CallSign"; query: "CallSign/string()" }
            XmlRole{name: "IconURL"; query: "IconURL/string()" }
            XmlRole{name: "ChannelName"; query: "ChannelName/string()" }
            //debug
            onStatusChanged: {
                if (status == XmlListModel.Ready){
                    buyfferIndicator.opacity = 0
                    buyfferIndicator.running = false
                    console.log("Loaded Joseph this is what to do " + source)
                }
                if (status === XmlListModel.Loading){
                    buyfferIndicator.opacity = 1
                    buyfferIndicator.running = true
//                    console.log("Loading " + source);
                }
                if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + schedule.source.toString());
            }
        }


        XmlListModel {
            id: scheduleSingle
            source: ""
            query: "//Program"
            XmlRole {name: "StartTime"; query: "StartTime/string()"}
            XmlRole { name: "EndTime"; query: "EndTime/string()" }
            XmlRole { name: "Title"; query: "Title/string()" }
            XmlRole{name: "SubTitle"; query: "SubTitle/string()" }
            XmlRole{name: "Category"; query: "Category/string()" }
            XmlRole{name: "CatType"; query: "CatType/string()" }
            XmlRole{name: "Repeat"; query: "Repeat/string()" }
            XmlRole{name: "VideoProps"; query: "VideoProps/string()" }
            XmlRole{name: "AudioProps"; query: "AudioProps/string()" }
            XmlRole{name: "SubProps"; query: "SubProps/string()" }
            XmlRole{name: "Description"; query: "Description/string()" }

            XmlRole{name: "Status"; query: "Recording/Status/string()" }
            XmlRole{name: "Priority"; query: "Recording/Priority/string()" }
            XmlRole{name: "RecordId"; query: "Recording/RecordId/string()" }
            XmlRole{name: "RecGroup"; query: "RecGroup/RecGroup/string()" }
            XmlRole{name: "PlayGroup"; query: "Recording/PlayGroup/string()" }
            XmlRole{name: "StorageGroup"; query: "Recording/StorageGroup/string()" }
            XmlRole{name: "RecType"; query: "Recording/RecType/string()" }
            XmlRole{name: "DupInType"; query: "Recording/DupInType/string()" }
            XmlRole{name: "DupMethod"; query: "Recording/DupMethod/string()" }
            XmlRole{name: "EncoderId"; query: "Recording/EncoderId/string()" }
            XmlRole{name: "Profile"; query: "Recording/Profile/string()" }
            XmlRole{name: "ArtworkInfos"; query: "Artwork/ArtworkInfos/string()" }

            XmlRole {name: "ChanId"; query: "Channel/ChanId/string()"}
            XmlRole { name: "ChanNum"; query: "Channel/ChanNum/string()" }
            XmlRole { name: "CallSign"; query: "Channel/CallSign/string()" }
            XmlRole{name: "IconURL"; query: "Channel/IconURL/string()" }
            XmlRole{name: "ChannelName"; query: "Channel/ChannelName/string()" }
            onStatusChanged: {
                if (status == XmlListModel.Ready){
                    buyfferIndicator.opacity = 0
                    buyfferIndicator.running = false
                }
                if (status === XmlListModel.Loading){
                    buyfferIndicator.opacity = 1
                    buyfferIndicator.running = true
                }
                if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + schedule.source.toString());
            }
        }
    }
}
