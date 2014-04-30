import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 0.1
import MythTv 1.0
Rectangle {
    id: captureRoot
    width: parent.width
    height: parent.height
    color: "#92C7C7C7"


    /////////////////
    Rectangle{
        id: homeChannelRec
        color: "grey"
        width: captureRoot.width
        height: captureRoot.height
        GridView {
            focus: true
            contentHeight: captureRoot.height
            contentWidth: captureRoot.width
            width: captureRoot.width
            height: captureRoot.height
            cellHeight: captureRoot.height
            cellWidth: captureRoot.width
            clip: true
            model: captureFullService
            delegate: Item {
                width: captureRoot.width
                height: captureRoot.height
                Rectangle{
                    width: captureRoot.width
                    height: captureRoot.height
                    gradient: Gradient{
                        GradientStop { position: 0; color: "#88000000"}
                        GradientStop { position: 0.5; color: "#44C7C7C7"}
                        GradientStop { position: 1; color: "#88000000"}
                    }

                    Text {
                        id: captureName
                        color: Util.ubuntuGrey
                        font.pixelSize:  captureRoot.width / 20
                        text:{
                            function cutCaptureName(){
                                return   VideoDevice.toString()
                            }
                            cutCaptureName()
                            //                cutCaptureName().substring(cutCaptureName().lastIndexOf("/")+1)
                        }
                    }
Row{
    spacing: parent.width / 20
anchors{
    centerIn: parent
//horizontalCenter: parent.horizontalCenter
//verticalCenter: parent.verticalCenter
}
    Image {
        id: cardImg
        source: "../../artwork/capturecard.jpg"
        width: captureRoot.width / 2.2
        height: captureRoot.height /1.7
//        x: captureRoot.width / 10
//        y: (width / 4)
    }
                    Rectangle{
                        id:detailsRec
                        width: captureRoot.width / 2.2
                        height: captureRoot.height /1.7
//                        x: captureRoot.width -  captureRoot.width / 2
//                        y: (width / 4)
                        gradient: Gradient{
                            GradientStop { position: 0; color: "#88FFFFFF"}
                            GradientStop { position: 0.5; color: "#44C7C7C7"}
                            GradientStop { position: 1; color: "#88FFFFFF"}
                        }
                        Column{
                            anchors.fill: detailsRec
                            Text {
                                id: deviceType
                                text: "CardType: \t"+CardType
                            }
                            Text {
                                id: cardId
                                text: "CardId: \t"+CardId
                            }
                            Text {
                                id: dVBWaitForSeqStart
                                text: "DVBWaitForSeqStart: \t"+DVBWaitForSeqStart
                            }
                            Text {
                                id: skipBTAudio
                                text: "SkipBTAudio: \t"+SkipBTAudio
                            }
                            Text {
                                id: dVBOnDemand
                                text: "DVBOnDemand: \t" + DVBOnDemand
                            }
                            Text {
                                id: signalTimeout
                                text: "SignalTimeout: \t" + SignalTimeout
                            }
                            Text {
                                id: channelTimeout
                                text: "ChannelTimeout: \t" +ChannelTimeout
                            }
                            Text {
                                id: contrast
                                text: "Contrast: \t" + Contrast
                            }
                            Text {
                                id: brightness
                                text: "Brightness: \t" +Brightness
                            }
                            Text {
                                id: colour
                                text: "Colour: \t" +Colour
                            }
                            Text {
                                id: hue
                                text: "Hue: \t" + Hue
                            }
                            Text {
                                id: dVBEITScan
                                text: "DVBEITScan: \t" +DVBEITScan
                            }
                        }//Row
                    }


}



                }
            }
        }
    }

    //////////////////
    XmlListModel {
        id: captureFullService
        source: DataBase.ipAddress()+":"+DataBase.port()+"/Capture/GetCaptureCardList"
        query: "/CaptureCardList/CaptureCards/CaptureCard"
        XmlRole {name: "CardId"; query: "CardId/string()"}
        XmlRole { name: "VideoDevice"; query: "VideoDevice/string()" }
        XmlRole { name: "AudioDevice"; query: "AudioDevice/string()" }
        XmlRole{name: "VBIDevice"; query: "VBIDevice/string()" }
        XmlRole{name: "AudioRateLimit"; query: "AudioRateLimit/string()" }
        XmlRole{name: "CardType"; query: "CardType/string()" }
        XmlRole{name: "HostName"; query: "HostName/string()" }
        XmlRole{name: "DVBSWFilter"; query: "DVBSWFilter/string()" }
        XmlRole{name: "DVBSatType"; query: "DVBSatType/string()" }
        XmlRole{name: "DVBWaitForSeqStart"; query: "DVBWaitForSeqStart/string()" }
        XmlRole{name: "DVBOnDemand"; query: "DVBOnDemand/string()" }
        XmlRole{name: "SkipBTAudio"; query: "SkipBTAudio/string()" }
        XmlRole{name: "DVBDiSEqCType"; query: "DVBDiSEqCType/string()" }
        XmlRole{name: "FirewireSpeed"; query: "FirewireSpeed/string()" }
        XmlRole{name: "FirewireModel"; query: "FirewireModel/string()" }
        XmlRole{name: "FirewireConnection"; query: "FirewireConnection/string()" }
        XmlRole{name: "SignalTimeout"; query: "SignalTimeout/string()" }
        XmlRole{name: "ChannelTimeout"; query: "ChannelTimeout/string()" }
        XmlRole{name: "DVBTuningDelay"; query: "DVBTuningDelay/string()" }
        XmlRole{name: "Contrast"; query: "Contrast/string()" }
        XmlRole{name: "Brightness"; query: "Brightness/string()" }
        XmlRole{name: "Colour"; query: "Colour/string()" }
        XmlRole{name: "Hue"; query: "Hue/string()" }
        XmlRole{name: "DiSEqCId"; query: "DiSEqCId/string()" }
        XmlRole{name: "DVBEITScan"; query: "DVBEITScan/string()" }

        //debug
        onStatusChanged: {
            if (status == XmlListModel.Ready){console.log("Loaded" + source)}
            if (status === XmlListModel.Loading) console.log("Loading");
            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + source.toString());
        }
        onCountChanged: {
            console.log("Count changed to: " + count)
        }
    }
}
