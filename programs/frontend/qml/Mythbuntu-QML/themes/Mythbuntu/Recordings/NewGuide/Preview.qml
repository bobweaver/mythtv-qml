import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import MythTv 1.0
import QtQuick.XmlListModel 2.0
import QtQuick.Window 2.0
import "../"

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
                            Behavior on scale {NumberAnimation{duration: 900; easing.type: Easing.OutBack}}
                            Behavior on opacity {NumberAnimation{duration: 1800; easing.type: Easing.OutQuad}}

                        }


                    }
                }
            }
        }//previews end










