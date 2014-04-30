import QtQuick 2.0
import QtQuick.XmlListModel 2.0
//import Ubuntu.Components 0.1
import QtQuick.Particles 2.0
import "../common/dbUtils.js" as DataBase
import "../common/Utils.js" as Util
Item {
    id: fiveDayItem
    signal clicked()
    x: 15
    width: fiveDayView.width - 3
    height: fiveDayView.width / 3
    Accessible.name: fiveDayItem.toString()
Rectangle{
    anchors.fill: parent
    id: currentItem
    color: "transparent"
    Rectangle{
     id:header
     width: fiveDayItem.width
     height: fiveDayItem.height / 4.2
     color:"blue"
    }
    Rectangle{
        id: headerBottomSpacer
        width: header.width
        height: header.height + 5
        gradient: Gradient{
            GradientStop{position: 1;color: "#92FFFFFF"}
            GradientStop{position: 0.91;color: "#00FFFFFF"}
            GradientStop{position: 0.1;color: "#00FFFFFF"}
            GradientStop{position: 0.01;color: "#92FFFFFF"}
        }
        Text {
            id: headerText
            color:"white"
            anchors{
                left: parent.left
                leftMargin: 4
                verticalCenter:headerBottomSpacer.verticalCenter
            }
                text:{
                function headerTime(){return timeFrom}
                Qt.formatDateTime(timeFrom,"dddd"+","+" d MMMM")

        }
        }
    }

    Rectangle {
        id: background
        width: parent.width
        height: fiveDayItem.height - header.height
        color: "grey"
        anchors{
            topMargin: 4
            top: headerBottomSpacer.bottom
        }
    }
Rectangle{
    id:page
    width: background.width /3.33
    height:background.height
    y:header.height + 8
    color: "transparent"
    //This is only for MOON and Sun & fallback
    Image {
        id: mainImage
        width: sourceSize.width / 1.5
        height: sourceSize.height / 1.5
        smooth: true
        state: "Shown"
        x: page.width /2 - (width/2)
        y: if (state === "Shown")
               -page.height/1.32
        else if (state === "Hidden")
               -page.height/5.22
        else
               -page.height -20
        Behavior on y{NumberAnimation{duration: 1200;easing.type: Easing.OutBounce}}
        source: Util.dir+"sun.png"

    }
    //Start to add the clouds
    // Ok this is how this works if there condtions call for the cloud then they are shown pelse they are not.
    //each item has a string and the string is set to match the item that it is attached to. this makes it so
    //so that each time the moon or sun is pressed and held each one will move up with animations and also on different durations
    //It is imporant that we keep the states the same as "main Image" aka the sun or moon or cold sun

//////////////////////////cloudsImage1
    Image {
        id: cloudsImage3
        width:  sourceSize.width /2
        height: sourceSize.height /2
        opacity:{
            if (clouds === "Cloudy"||clouds ==="Snow"||clouds == "Partly cloudy")
                1
            else
                0
        }
        smooth: true
        state: mainImage.state
        x: -page.width /6
        y: if (state === "Shown")
              3 //page.height / 10.66
        else if (state === "Hidden")
               -page.height
        else
               page.height / 8.66
        Behavior on y{NumberAnimation{duration: 700;easing.type: Easing.OutBack}}
        source: Util.dir + "cloud_3.png"
        }
    // End cloudsImage3
    Image {
        id: cloudsImage2
        width:  sourceSize.width / 2.36
        height: sourceSize.height / 2.36
        opacity:{
            if (clouds === "Cloudy"||clouds ==="Snow"|| clouds == "Partly cloudy")
                1
            else
                0
        }

                    smooth: true
        state: mainImage.state
        x: page.width / 2
        y: if (state === "Shown")
             page.height / 2.4
        else if (state === "Hidden")
               -page.height
        else
               page.height / 2
        Behavior on y{NumberAnimation{duration: 1400;easing.type: Easing.OutBack}}
        source: Util.dir + "cloud_2.png"
        }
    // End cloudsImage2
    Image {
        id: cloudsImage1
        width:  sourceSize.width /2
        height: sourceSize.height /2
        opacity:{
            if (clouds === "Cloudy"||clouds ==="Snow")
                1
            else
                0
        }
                    smooth: true
        state: mainImage.state
        x: (-page.width / 2)
        y: if (state === "Shown")
               page.height / 2.5
        else if (state === "Hidden")
               -page.height
        else
               page.height / 2
        Behavior on y{NumberAnimation{duration: 1000;easing.type: Easing.OutBack}}
        source: Util.dir + "cloud_1.png"
        }
    //cloudsImage2


//////////////start rain clouds

    //cloudsImageRain1
    Image {
        id: cloudsRainImage1
        width:  sourceSize.width /2
        height: sourceSize.height /2
        opacity:{
            if (clouds === "Rain")
                1
            else
                0
        }

                    smooth: true
        state: mainImage.state
        x: page.width / 20
        y: if (state === "Shown")
               page.height / 2
        else if (state === "Hidden")
               -page.height
        else
               page.height / 2
        Behavior on y{NumberAnimation{duration: 1000;easing.type: Easing.OutBack}}
        source: Util.dir + "cloud_rain_1.png"
        }

    // End cloudsImageRain1


    //cloudsImageRain2
    Image {
        id: cloudsImageRain2
        width:  sourceSize.width / 1.88
        height: sourceSize.height / 1.88
        smooth: true
        state: mainImage.state
        x: page.width / 2
        opacity:{
            if (clouds === "Rain")
                1
            else
                0
        }

                    y: if (state === "Shown")
               page.height / 2
        else if (state === "Hidden")
               -page.height
        else
               page.height / 2
        Behavior on y{NumberAnimation{duration: 1400;easing.type: Easing.OutBack}}
        source: Util.dir + "cloud_rain_2.png"
        }

    // End cloudsImageRain2



    //cloudsImageRain3
    Image {
        id: cloudsImageRain3
        width:  sourceSize.width /2
        height: sourceSize.height /2
        smooth: true
        opacity:{
            if (clouds === "Rain")
                1
            else
                0
        }

                    state: mainImage.state
        x: page.width / 50
        y: if (state === "Shown")
               page.height / 2.66
        else if (state === "Hidden")
               -page.height
        else
               page.height / 2.66
        Behavior on y{NumberAnimation{duration: 700;easing.type: Easing.OutBack}}
        source: Util.dir + "cloud_rain_3.png"
        }

    // End cloudsImageRain3


////////////////////////start Storm Clouds

    //cloudsImageStrom1
    Image {
        id: cloudsStormImage1
        width:  sourceSize.width /2
        height: sourceSize.height /2
        opacity:{
            if (clouds === "Heavy rain")
                1
            else
                0
        }
        smooth: true
        state: mainImage.state
        x: page.width / 20
        y: if (state === "Shown")
               page.height / 2
        else if (state === "Hidden")
               -page.height
        else
               page.height / 2
        Behavior on y{NumberAnimation{duration: 1000;easing.type: Easing.OutBack}}
        source: Util.dir + "cloud_storm_1.png"
        }

    // End cloudsImageStrom1


    //cloudsImageStrom2
    Image {
        id: cloudsImageStrom2
        width:  sourceSize.width / 1.88
        height: sourceSize.height / 1.88
        opacity:{
            if (clouds === "Heavy rain")
                1
            else
                0
        }

        smooth: true
        state: mainImage.state
        x: page.width / 2
        y: if (state === "Shown")
               page.height / 2
        else if (state === "Hidden")
               -page.height
        else
               page.height / 2
        Behavior on y{NumberAnimation{duration: 1400;easing.type: Easing.OutBack}}
        source: Util.dir + "cloud_storm_2.png"
        }

    // End cloudsImageStrom2



    //cloudsImageStrom3
    Image {
        id: cloudsImageStrom3
        width:  sourceSize.width /2
        height: sourceSize.height /2
        smooth: true
        opacity:{
            if (clouds === "Heavy rain")
                1
            else
                0
        }

        state: mainImage.state
        x: page.width / 50
        y: if (state === "Shown")
               page.height / 2.66
        else if (state === "Hidden")
               -page.height
        else
               page.height / 2.66
        Behavior on y{NumberAnimation{duration: 700;easing.type: Easing.OutBack}}
        source: Util.dir + "cloud_storm_3.png"
        }

    // End cloudsImageStrom3


    //cloudsImageTStrom1
    Image {
        id: cloudsImageTStorm1
        width:  sourceSize.width /2
        height: sourceSize.height /2
        opacity:{
            if(clouds === "Rain showers")
                1
            else
                0
        }                smooth: true
        state: mainImage.state
        x: page.width / 20
        y: if (state === "Shown")
               page.height / 2
        else if (state === "Hidden")
               -page.height
        else
               page.height / 2
        Behavior on y{NumberAnimation{duration: 1000;easing.type: Easing.OutBack}}
        source: Util.dir + "cloud_tstorm_1.png"
        }

    // End cloudsImageTStorm1


    //cloudsImageTStorm2
    Image {
        id: cloudsImageTStorm2
        width:  sourceSize.width / 1.88
        height: sourceSize.height / 1.88
        smooth: true
        opacity:{
            if(clouds === "Rain showers")
                1
            else
                0
        }
        state: mainImage.state
        x: page.width / 2
        y: if (state === "Shown")
               page.height / 2
        else if (state === "Hidden")
               -page.height
        else
               page.height / 2
        Behavior on y{NumberAnimation{duration: 1400;easing.type: Easing.OutBack}}
        source: Util.dir + "cloud_tstorm_2.png"
        }

    // End cloudsImageTStorm2



    //cloudsImageTStorm3
    Image {
        id: cloudsImageTStorm3
        width:  sourceSize.width /2
        height: sourceSize.height /2
        opacity:{
            if(clouds === "Rain showers")
                1
            else
                0
        }
        smooth: true
        state: mainImage.state
        y: if (state === "Shown")
               page.height / 2.66
        else if (state === "Hidden")
               -page.height
        else
               page.height / 2.66
        Behavior on y{NumberAnimation{duration: 700;easing.type: Easing.OutBack}}
        source: Util.dir + "cloud_storm_3.png"
    }
    // End cloudsImageTStorm3






//////////////// Particals and ShaderEffects for snow and rain

    //Snow
    ImageParticle {
        id:snowImagePartical
        opacity: {
            if (clouds === "Snow" && mainImage.state === "Shown" )
                1
            else
                0
        }
        Behavior on opacity{NumberAnimation{duration:400}}
        width: page.width *2
        height: page.height
        x:1 // page.width / 2
//        y: 1//page.height / 11.58
        system: snowSystem
        source: Util.dir+"snow_flake_01.png"
        color: "#FFFAFA"
        clip: true
        alpha: 0.8
    }
    ParticleSystem {
        id: snowSystem
//                opacity: rainImagePartical.opacity
    }
    Emitter {
        system: snowSystem
        width: page.width
        height: page.height
        emitRate: 12
        lifeSpan: 9000
        size: page.width / 30
        sizeVariation:page.width / 9
        velocity: AngleDirection {
            angleVariation: 90;
            magnitude: 9
        }
        maximumEmitted: 80
        startTime: 4000
    }

    //////////////////////////Rain
    ImageParticle {
        id:rainImagePartical
        opacity: {
            if (clouds === "Rain" && mainImage.state === "Shown"
            || clouds === "Rain showers" && mainImage.state === "Shown"
            || clouds === "Heavy rain" && mainImage.state === "Shown")
                1
            else
                0
        }
        Behavior on opacity{NumberAnimation{duration:400}}
        width: page.width *2
        height: page.height
        x: 1
        system: rainSystem
        source: Util.dir+"rain_01.png"
        color: "grey"
        clip: false
        alpha: 0.8
    }
    ParticleSystem {
        id: rainSystem
    }
    Emitter {
        system: rainSystem
        width: page.width
        y: header.height

        height: page.height /1.22
        emitRate:{
            if(clouds === "Rain")
                120
            else if (clouds === "Rain showers")
                140
            else if (clouds === "Heavy rain")
                240
            else
                120
        }
        lifeSpan: 900
        size: page.height / 6
        sizeVariation:page.width
        velocity: AngleDirection {
            angleVariation: 90;
            magnitude: 9
        }
        maximumEmitted: 200
        startTime: 4000
    }
    /////////////////////////////////Thunder bolts
    ImageParticle {
        id:tunderImagePartical
        opacity: {
            if (clouds === "Rain showers" && mainImage.state === "Shown"
                    || clouds === "Heavy showers" && mainImage.state === "Shown"
                    )
                1
            else
                0
        }
        Behavior on opacity{NumberAnimation{duration:400}}
        width: parent.width
        height: parent.width
        x: parent.width / 20
        y: parent.width / 1.58
        system: thunderSystem
        source: "../artwork/thunder.png"
        color: "black"
        clip: false
        alpha: 0.8
    }
    ParticleSystem {
        id: thunderSystem
    }
    Emitter {
        system: thunderSystem
        width: parent.width
        height: parent.width
        emitRate: 22
        lifeSpan: 9000
        size: parent.width / 30
        sizeVariation:parent.width / 9
        velocity: AngleDirection {
            angleVariation: 90;
            magnitude: 9
        }
        maximumEmitted: 100
        startTime: 4000
    }

    Text {
        height: 20
        id: tempatureTxt
        text: temperature
        color: "white"
        font.pixelSize: fiveDayView.width / 10
        font.bold: true;
        wrapMode: Text.WordWrap
        x:background.width / 2 - width
        y: background.height / 2 - height
        state:"Celcius"
}
    MouseArea{
        anchors.fill: tempatureTxt
        onClicked: {
            var f = (temperature * 9 / 5 + 32)
            if (tempatureTxt.state === "Celcius"){
                tempatureTxt.text = (temperature * 9 / 5 + 32)
                tempatureTxt.state = "Fahrenheit"
            }else{
                tempatureTxt.text = temperature
                tempatureTxt.state = "Celcius"

            }
        }
    }

    Image {
        id: fahrenheitImg
        source: Util.dir+"fahrenheit.png"
        width: sourceSize.width / 3
        height: sourceSize.height / 3
        opacity: tempatureTxt.state === "Celcius" ? 0 : 1
        Behavior on opacity {NumberAnimation{duration: 200; easing.type: Easing.InQuad}}
        y: tempatureTxt.state === "Fahrenheit" ? tempatureTxt.height   : background.height
        Behavior on y {NumberAnimation{duration: 1200 ; easing.type: Easing.OutBack}}
        x: tempatureTxt.state === "Fahrenheit" ? background.width / 2 - (tempatureTxt.width/10.22) : background.width*2
    }
    Image {
        id: celciusImg
        source:Util.dir+"centigrades.png"
        height: sourceSize.height / 3
        width: sourceSize.width / 3
        opacity: tempatureTxt.state === "Celcius" ? 1 : 0
        Behavior on opacity {NumberAnimation{duration:200;  easing.type: Easing.OutQuad}}
        x: tempatureTxt.state === "Celcius" ? background.width / 2 - (tempatureTxt.width/10.22) : background.width*2
        y: tempatureTxt.state === "Celcius" ? tempatureTxt.height   : background.height
        Behavior on x{NumberAnimation{duration: 1200; easing.type: Easing.OutBack}}
    }

}//main Weather Left
}
Image {
    id: clickMe
    source: "../artwork/avatar@8.png"
    anchors{
    right: parent.right
   top:parent.top
   topMargin: parent.height/ 2
    }
}
MouseArea{
    anchors.fill: clickMe
    onClicked: {
        console.log(Qt.formatDate(timeFrom, "dd"))
     if (fiveDaySlider.state !== "Shown"){
          fiveDaySlider.state = "Shown"
           fiveDayView.opacity = 0
         console.log("I am clicked")
     }else{
         fiveDaySlider.state = "Hidden"
         console.log("else")
}
    }
}

}//Item
