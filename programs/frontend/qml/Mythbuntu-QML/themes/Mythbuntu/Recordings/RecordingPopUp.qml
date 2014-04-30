import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Window 2.0
import  MythTv 1.0
Image{
    id: rootT
    width: scheduleRoot.width
    height:  scheduleRoot.height
    source:  "../background.png"
    MythFadeAnimation{
        width: scheduleRoot.width
        height:  scheduleRoot.height
        image: Qt.resolvedUrl("../../../artwork/mythbuntu.png")
        imageColor: "orange"
        imageCliped: false
        imageAlpha: 0
        visible: popupquick.opacity === 1 ? true : false
        emiterRate: 40
        emiterLife: 2200
        emiterSize: 14
        emiterSizeVariation: 50
        emiterAngleVariation: 90
        emiterMaxEmitted: 100
        emiterStartTime: 200
    }
    Rectangle{
        id:popupquick
        width: scheduleRoot.width /2
        height:  scheduleRoot.height /2
        opacity: 1
        x: 0
        Behavior on x {NumberAnimation { duration: 1200; easing.type: Easing.OutBack }}
        Behavior  on opacity {NumberAnimation { duration: 2200; easing.type: Easing.OutQuad }}
        color: "black"
        anchors{
            verticalCenter: rootT.verticalCenter
            horizontalCenter: rootT.horizontalCenter
        }


        Column{
            width: scheduleRoot.width /2
            height:  scheduleRoot.height /2
            spacing: Math.round(parent.height / 28)
            MythButton{
                width: parent.width
                height:     parent.height / 5
                buttonColor: "#33C7C7C7"
                name:  "Basic"
                nameColor: "white"
                namepxSize: Math.round(height / 1.3)
                onButtonClick: {
                    var doc = new XMLHttpRequest();
                    doc.open("POST",DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/AddRecordSchedule?StartTime="+StartTime+ "&ChanId="+ChanId+"&Type=single&AutoExpire=1&AutoCommflag=1&AutoMetaLookup=1", true);
                    doc.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
                    doc.onreadystatechange = function() {
                        if (doc.readyState == doc.DONE) {
                            console.log(Title +" is Recording");
                        }
                        if (doc.status == 200, doc.readyState == 4) {
                            var resp = doc.responseXML
                            console.log("Doc XML response ready")
                        }
                        else console.log("hmmm?")
                    }
                    doc.send();
                    saved.opacity = 1
                    backaroo.opacity = 1
                }
            }

            MythButton{
                width: parent.width
                height:     parent.height / 5
                name:  "Advanced"
                buttonColor: "#33C7C7C7"
                nameColor: "white"
                namepxSize: Math.round(height / 1.3)
                onButtonClick: {
                    popup.opacity = 1
                    popup.x = 0
                    popupquick.x = Math.round( scheduleRoot.width * 2)
                    popupquick.opacity = 0
                }
            }

            MythButton{
                id:backaroo
                width: parent.width
                height:     parent.height / 5
                name:  "Back"
                buttonColor: "#33C7C7C7"
                nameColor: "white"
                opacity: 0
                namepxSize: Math.round(height / 1.3)
                onButtonClick: {
                    popup.opacity = 0
                    popup.x = 0
                    popupquick.opacity = 0
                    backingPageLoader.source = "Guide.qml"
                    backingPageLoader.opacity = 1
                }
            }

        }

    }
    //////////////////////////////////////////////////////
    /////////////////////ADVANCED/////////////////////////////////

    Rectangle{
        id:popup
        width: Screen.width
        height:  Screen.height
        opacity: 0
        x: scheduleRoot.height * 2
        Behavior on x {NumberAnimation { duration: 1200; easing.type: Easing.OutBack }}
        Behavior  on opacity {NumberAnimation { duration: 2200; easing.type: Easing.OutQuad }}
        gradient: Gradient{
            GradientStop{position: 1;color: "#33FFFFFF"}
            GradientStop{position: .7;color: "#33000000"}
            GradientStop{position: .3;color: "#55000000"}
            GradientStop{position: 0;color: "#33FFFFFF"}
        }
        Text {
            id: wer
            text: qsTr("Recording Type")
            color: "white"
            font.pixelSize: 48
            height: 52
        }
        MythButton{
            id: recTypeDrop
            width: Screen.width
            height:  Screen.height / 16
            onButtonClick: {
                settingsColoumn.opacity === 0 ? settingsColoumn.opacity = 1 : settingsColoumn.opacity =  0
            }
            name: "Recording Type"
            namepxSize: height / 2
            nameColor: "white"
            anchors.top: wer.bottom

        }
        MythButton{
            id: storageOptions
            width: Screen.width
            height:  Screen.height / 16
            onButtonClick: {
                settingsColoumn.opacity === 0 ? settingsColoumn.opacity = 1 : settingsColoumn.opacity =  0
                console.log(startTimeTXT.text)

            }
            name: "Recording Type"
            namepxSize: height / 2
            nameColor: "white"
            anchors.top: wer.bottom
        }
        ListView{
            id: settingsColoumn
            width: Screen.width
            height:  Screen.height / 2
            opacity: 0
            Behavior on opacity {
                NumberAnimation{
                    duration: 1000
                    easing.type: Easing.OutSine
                }
            }
            anchors{
                left: popup.left
                top: recTypeDrop.bottom
            }
            model: TypeOfRecordingModel{}
            delegate: Item{
                width: Screen.width
                height:  Screen.height / 16
                RecordingOptionsBool{
                    id:button
                    name: text
                    checked: false
                    nameColor: "white"
                    onOptionClicked: {
                        if (type === "not"){
                            var doc = new XMLHttpRequest();
                            doc.open("POST",DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/AddRecordSchedule?StartTime="+StartTime+ "&ChanId="+ChanId+"&Type="+type+"&AutoExpire=1&AutoCommflag=1&AutoMetaLookup=1", true);
                            doc.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
                            doc.onreadystatechange = function() {
                                if (doc.readyState == doc.DONE) {
                                    console.log(Title +" is Recording");
                                }
                                if (doc.status == 200, doc.readyState == 4) {
                                    var resp = doc.responseXML
                                    console.log("Doc XML response ready")
                                }
                                else console.log("hmmm?")
                            }
                            doc.send();
//                            console.log(DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/AddRecordSchedule?StartTime="+StartTime+ "&ChanId="+ChanId+"&Type="+type+"&AutoExpire=1&AutoCommflag=1&AutoMetaLookup=1")
                            rootT.opacity = 0
                            saved.opacity = 1
                            backaroo.opacity = 1
                        }
                        if (type === "daily"){
                            var doc = new XMLHttpRequest();
                            doc.open("POST",DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/AddRecordSchedule?StartTime="+StartTime+ "&ChanId="+ChanId+"&Type="+type+"&AutoExpire=1&AutoCommflag=1&AutoMetaLookup=1", true);
                            doc.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
                            doc.onreadystatechange = function() {
                                if (doc.readyState == doc.DONE) {
                                    console.log(Title +" is Recording");
                                }
                                if (doc.status == 200, doc.readyState == 4) {
                                    var resp = doc.responseXML
                                    console.log("Doc XML response ready")
                                }
                                else console.log("hmmm?")
                            }
                            doc.send();
//                            console.log( DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/AddRecordSchedule?StartTime="+StartTime+ "&ChanId="+ChanId+"&Type="+type+"&AutoExpire=1&AutoCommflag=1&AutoMetaLookup=1")
                            rootT.opacity = 0
                            saved.opacity = 1
                            backaroo.opacity = 1
                        }
                        if (type === "single"){
                            var doc = new XMLHttpRequest();
                            doc.open("POST",DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/AddRecordSchedule?StartTime="+StartTime+ "&ChanId="+ChanId+"&Type="+type+"&AutoExpire=1&AutoCommflag=1&AutoMetaLookup=1", true);
                            doc.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
                            doc.onreadystatechange = function() {
                                if (doc.readyState == doc.DONE) {
                                    console.log(Title +" is Recording");
                                }
                                if (doc.status == 200, doc.readyState == 4) {
                                    var resp = doc.responseXML
                                    console.log("Doc XML response ready")
                                }
                                else console.log("hmmm?")
                            }
                            doc.send();
//                            console.log( DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/AddRecordSchedule?StartTime="+StartTime+ "&ChanId="+ChanId+"&Type="+type+"&AutoExpire=1&AutoCommflag=1&AutoMetaLookup=1")
                            rootT.opacity = 0
                            saved.opacity = 1
                            backaroo.opacity = 1
                        }
                        if (type === "weekly"){
                            var doc = new XMLHttpRequest();
                            doc.open("POST",DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/AddRecordSchedule?StartTime="+StartTime+ "&ChanId="+ChanId+"&Type="+type+"&AutoExpire=1&AutoCommflag=1&AutoMetaLookup=1", true);
                            doc.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
                            doc.onreadystatechange = function() {
                                if (doc.readyState == doc.DONE) {
                                    console.log(Title +" is Recording");
                                }
                                if (doc.status == 200, doc.readyState == 4) {
                                    var resp = doc.responseXML
                                    console.log("Doc XML response ready")
                                }
                                else console.log("hmmm?")
                            }
                            doc.send();

//                            console.log( DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/AddRecordSchedule?StartTime="+StartTime+ "&ChanId="+ChanId+"&Type="+type+"&AutoExpire=1&AutoCommflag=1&AutoMetaLookup=1")
                            rootT.opacity = 0
                            saved.opacity = 1
                            backaroo.opacity = 1
                        }
                        if (type === "all"){
                            var doc = new XMLHttpRequest();
                            doc.open("POST",DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/AddRecordSchedule?StartTime="+StartTime+ "&ChanId="+ChanId+"&Type="+type+"&AutoExpire=1&AutoCommflag=1&AutoMetaLookup=1", true);
                            doc.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
                            doc.onreadystatechange = function() {
                                if (doc.readyState == doc.DONE) {
                                    console.log(Title +" is Recording");
                                }
                                if (doc.status == 200, doc.readyState == 4) {
                                    var resp = doc.responseXML
                                    console.log("Doc XML response ready")
                                }
                                else console.log("hmmm?")
                            }
                            doc.send();
                            rootT.opacity = 0
                            saved.opacity = 1
                            backaroo.opacity = 1
//                            console.log( DataBase.ipAddress()+":"+DataBase.port()+"/Dvr/AddRecordSchedule?StartTime="+StartTime+ "&ChanId="+ChanId+"&Type="+type+"&AutoExpire=1&AutoCommflag=1&AutoMetaLookup=1")
                        }
                    }
                    onCheckedChanged: {
                        checked === "true"  ?  settingsColoumn.opacity = 0 :  settingsColoumn.opacity = 1
                    }
                }
            }
        }



        //        ListView{
        //            id: storageColoumn
        //            width: Screen.width
        //            height:  Screen.height / 2
        //            opacity: 0
        //            Behavior on opacity {
        //             NumberAnimation{
        //              duration: 1600
        //              easing.type: Easing.OutQuad
        //             }
        //            }
        //            anchors{
        //                left: popup.left
        //                top: storageColoumn.bottom
        //            }
        //        model: TypeOfRecordingModel{}
        //        delegate: Item{
        //            width: Screen.width
        //            height:  Screen.height / 16
        //            RecordingOptionsBool{
        //             name: text
        //             checked: false
        //             nameColor: "white"
        //            }
        //        }
        //        }





    }


    Text {
        id: saved
        text: itemName.text +  qsTr(" Is Going to Record")
        font.pixelSize: 64
        color: "white"
        anchors.centerIn: parent
        opacity: 0
        Behavior   on opacity {
            ParallelAnimation{
                NumberAnimation{duration:  10200; easing.type: Easing.OutQuad}
                NumberAnimation { target: saved; property: "scale";from: 1 ; to: 0 ; duration: 10200; easing.type: Easing.OutQuad }
            }
        }
    }

    Loader{
        id: backingPageLoader
        anchors.fill: parent
        source: ""
        opacity:  0
        Behavior on opacity {
            NumberAnimation {
                target: settingsPageLoader
                property: "scale"
                from:0
                to:1
                duration: 1800
                easing.type: Easing.OutQuart
            }
        }
    }
}
