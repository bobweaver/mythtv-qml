import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.Particles 2.0
//import Ubuntu.Components 0.1
import QtQuick.LocalStorage 2.0
import QtWebKit 3.0
import "../common/dbUtils.js" as DataBase
import "../common/Utils.js" as Util
Item {
    id: serie
    width: parent.width
    height: parent.height
    property string timezone: timezone
    property string creditURL: creditURL
    property string creditTXT: creditTXT
    property string status: status
    property string sunSet: sunSet
    property string sunRise: sunRise
    property string weatherCondition: weatherCondition
    property string pressure: pressure
    property string windSpeedMPS: windSpeedMPS
    property string windSpeed: windSpeed
    property string windDirection: windDirection
    property string clouds: clouds
    property string precipitation: precipitation
    property string temperature: temperature
    property string observationTime: observationTime
    property string timeTo: timeTo
    property string timeFrom: timeFrom



    Text {
        id: cityName
        color: "white"
        height:22
        font.bold: true
        font.pixelSize: 28
        text: DataBase.homeCity()
        anchors{
            top: parent.top
        }
    }
    Rectangle{
        id: separator1
        color: "#00000000"
        height: 3
        width: parent.width
        anchors{
            top: cityName.bottom
            topMargin: 10
            left: parent.left
        }
    }
    Text {
        id: today
        text: Qt.formatDate(new Date(), "MMMM dddd"+","+" d yyyy ")
        color: "white"
        font.pixelSize: 22
        anchors{
            top:separator1.bottom
            topMargin: 2
        }
    }
    GridView{
        model: FiveDayModel{}
        width: parent.width
        height:     parent.height
        contentHeight:{  parent.height }
        contentWidth:{  parent.width }
        cellHeight:{  parent.height /6 }
        cellWidth:{  parent.width}
    delegate: Item{
            property string temp: tempatureTxt.text.toString()
            id: topLayout
            opacity:{
                var checkmeOut = (timeFrom.substring(0,timeFrom.lastIndexOf("T")))
                var today = (Qt.formatDate(new Date(), "dd"))
                var cut2 = (period.substring())
                if (checkmeOut.substring(checkmeOut.lastIndexOf("-")+1) === today)
                    0
                else if (cut2 === "1" || cut2 === "2" || cut2 === "3")
               0
//                else if (fiveDaySlider.state ===)
                else
               1
            }
            width: parent.width ;
            height: parent.height

            //////////////// Particals and ShaderEffects for snow and rain
            //Snow
            ImageParticle {
                id:snowImagePartical
                opacity: {
                    if (clouds === "Snow" && mainImage.state === "Shown" )
                        1
                    else if (clouds === "Snow showers" && mainImage.state === "Shown")
                        1
                    else
                        0
                }
                Behavior on opacity{NumberAnimation{duration:400}}
                width: parent.width
                height: parent.width
                y: parent.width / 1.58
                system: snowSystem
                source: "../artwork/"+"snow_flake_01.png"
                color: "#FFFAFA"
                clip: true
                alpha: 0.8
            }
            ParticleSystem {
                id: snowSystem
            }
            Emitter {
                system: snowSystem
                width: parent.width
                height: parent.width
                emitRate: {
                    if(clouds === "Snow")
                        22
                    else if (clouds === "Snow showers")
                        88
                    else
                        0
                }
                lifeSpan: 9000
                size: parent.width / 30
                sizeVariation:parent.width / 9
                velocity: AngleDirection {
                    angleVariation: 90;
                    magnitude: 9
                }
                maximumEmitted: {
                    if(clouds === "Snow")
                        100
                    else if (clouds === "Snow showers")
                        150
                    else
                        0
                }
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
                width: parent.width
                height: parent.width / 12
                x: parent.width / 20
                y: parent.width / 1.58
                system: rainSystem
                source: "../artwork/rain_01.png"
                color: "grey"
                clip: false
                alpha: 0.8
            }
            ParticleSystem {
                id: rainSystem
            }
            Emitter {
                system: rainSystem
                width: parent.width
                y:parent.width / 1.5
                height: parent.width / 4
                emitRate:{
                    if(clouds === "Rain")
                        120
                    else if (clouds === "Rain showers")
                        140
                    else if (clouds === "Heavy rain")
                        170
                    else
                        120
                }
                lifeSpan: 900
                size: tab.width
                sizeVariation:tab.width
                velocity: AngleDirection {
                    angleVariation: 90;
                    magnitude: 9
                }
                maximumEmitted: 100
                startTime: 4000
            }
            /////////////////////////////////Thunder bolts
            ImageParticle {
                id:tunderImagePartical
                opacity: {
                    if (clouds === "Rain showers" && mainImage.state === "Shown")
                        1
                    else
                        0
                }
                Behavior on opacity{NumberAnimation{duration:400}}
                width: parent.width
                height: parent.width
                x: parent.width / 20
                y: separator1.width / 1.58
                system: thunderSystem
                source: "../artwork/thunder.png"
                color: "yellow"
                clip: false
                alpha: 1
            }
            ParticleSystem {
                id: thunderSystem
            }
            Emitter {
                system: thunderSystem
                width: parent.width
                height: parent.width / 4
                y:parent.width / 1.5
                emitRate: 22
                lifeSpan: 400
                size: parent.width / 30
                sizeVariation:parent.width / 9
                velocity: AngleDirection {
                    angleVariation: 90;
                    magnitude: 9
                }
                maximumEmitted: 40
                startTime: 4000
            }
            Image {
                id: hangerSunMoon
                height:    sourceSize.height
                source: "../artwork/na_icon_line.png"
                y:mainImage.y - mainImage.sourceSize.height
                anchors{
                    horizontalCenter: mainImage.horizontalCenter
                }
            }

            //This is only for MOON and Sun & fallback
            Image {
                id: mainImage
                width: sourceSize.width / 1.04
                height:{
                    if (Qt.formatDateTime(timeFrom,"hh") < Qt.formatDateTime(sunSet,"hh")  && temperature > 5 && state === "Shown")
                        sourceSize.height / 1.04
                    else
                        sourceSize.height
                }
                smooth: true
                state: "Shown"
                x: parent.width /2 - (width/2)
                y: {
                    //warm Sun
                    if (Qt.formatDateTime(timeFrom,"hh") < Qt.formatDateTime(sunSet,"hh")  && temperature > 5 && state === "Shown"
                            || Qt.formatDateTime(timeFrom,"hh") < Qt.formatDateTime(sunSet,"hh")  && temperature < 5 && state === "Shown")
                        -30
                    else if (Qt.formatDateTime(timeFrom,"hh") > Qt.formatDateTime(sunSet,"hh") && state === "Shown")
                        parent.width / 4
                    else (state === "Hidden")
                         -parent.width
                }
                Behavior on y{NumberAnimation{duration: 1200;easing.type: Easing.OutBounce}}
                source: {
                    if (Qt.formatDateTime(timeFrom,"hh") > Qt.formatDateTime(sunSet,"hh") )
                        "../artwork/moon.png"
                    else if (Qt.formatDateTime(timeFrom,"hh") < Qt.formatDateTime(sunSet,"hh")  && temperature > 5)
                        "../artwork/sun.png"
                    else if (Qt.formatDateTime(timeFrom,"hh") < Qt.formatDateTime(sunSet,"hh") && temperature < 5 )
                        "../artwork/cold_sun.png"
                    else
                        "../artwork/na_icon.png"
                }
            }
            MouseArea  {
                id:mainImageMouseArea
                anchors.fill: mainImage
                onPressAndHold:{ mainImage.state = "Hidden" }
                onReleased:{mainImage.state = "Shown"}
            }

            Text {
                id: timeAroo
                text:Qt.formatDateTime(timeFrom, "hh"+":"+"mm")
                height:22
                state: "Milatary"
                x:state === "Milatary" ? separator1.width - 88 : separator1.width - 115
                Behavior on x{NumberAnimation{
                        duration:  1200; easing.type: Easing.OutBounce}
                }
                color: "white"
                font.bold: true
                font.pixelSize: 22
                anchors{
                    top: parent.top
                    topMargin: height/2
                }
            }
            MouseArea{
                anchors.fill: timeAroo
                onClicked: if (timeAroo.text === Qt.formatDateTime(timeFrom, "hh"+":"+"mm") ){
                               timeAroo.text = Qt.formatDateTime(timeFrom, "h:mm ap")
                               timeAroo.state = "12-Hour"
                           }else{
                               timeAroo.text = Qt.formatDateTime(timeFrom, "hh"+":"+"mm")
                               timeAroo.state = "Milatary"
                           }
            }
            //Start to add the clouds
            // Ok this is how this works if there condtions call for the cloud then they are shown they are not.
            //each item has a string and the string is set to match the item that it is attached to. this makes it so
            //so that each time the moon or sun is pressed and held each one will move up with animations and also on different durations
            //It is imporant that we keep the states the same as "main Image" aka the sun or moon or cold sun

            //////////////////////////cloudsImage1
            Image {
                id: cloudsImage1
                width:  sourceSize.width /2
                height: sourceSize.height /2
                opacity:{
                    if (clouds === "Cloudy"
                         || clouds ==="Snow")
                        1
                    else
                        0
                }
                smooth: true
                state: mainImage.state
                x: parent.width / 20
                y: if (state === "Shown")
                       parent.width / 2
                   else if (state === "Hidden")
                       -parent.width
                   else
                       parent.width / 2
                Behavior on y{NumberAnimation{duration: 1000;easing.type: Easing.OutBack}}
                source: "../artwork/" + "cloud_1.png"
            }
            Image {
                id: hangerCloud1
                height: sourceSize.height /2
                opacity: cloudsImage1.opacity
                source: "../artwork/"+"cloud_1_line.png"
                y: cloudsImage1.y - cloudsImage1.sourceSize.height -(cloudsImage1.sourceSize.height / 1.844)
                x:cloudsImage1.width / 1.844
            }
            // End cloudsImage1
            //cloudsImage2
            Image {
                id: cloudsImage2
                width:  sourceSize.width / 1.88
                height: sourceSize.height / 1.88
                opacity:{
                    if (clouds === "Cloudy"||clouds ==="Snow"|| clouds == "Partly cloudy")
                        1
                    else
                        0
                }
                smooth: true
                state: mainImage.state
                x: parent.width / 2
                y: if (state === "Shown")
                       parent.width / 2
                   else if (state === "Hidden")
                       -parent.width
                   else
                       parent.width / 2
                Behavior on y{NumberAnimation{duration: 1400;easing.type: Easing.OutBack}}
                source: "../artwork/" + "cloud_2.png"
            }
            Image {
                id: hangerCloud2
                opacity: cloudsImage2.opacity
                height: sourceSize.height /2
                source: "../artwork/"+"cloud_2_line.png"
                y: cloudsImage2.y - cloudsImage2.sourceSize.height -(cloudsImage2.sourceSize.height / 1.14)
                x:cloudsImage2.x + cloudsImage2.width / 2.25
            }
            // End cloudsImage2
            //cloudsImage3
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
                x: parent.width / 50
                y: if (state === "Shown")
                       parent.width / 2.66
                   else if (state === "Hidden")
                       -parent.width
                   else
                       parent.width / 2.66
                Behavior on y{NumberAnimation{duration: 700;easing.type: Easing.OutBack}}
                source: "../artwork/" + "cloud_3.png"
            }
            Image {
                id: hangerCloud3
                opacity: cloudsImage3.opacity
                height: sourceSize.height /2
                source: "../artwork/"+"cloud_3_line.png"
                y: cloudsImage3.y - cloudsImage3.sourceSize.height -(cloudsImage3.sourceSize.height + cloudsImage3.height /2)
                x:cloudsImage3.x + cloudsImage3.width / 2.25
            }
            // End cloudsImage3
            //////////////start rain clouds
            //cloudsImageRain1
            Image {
                id: cloudsRainImage1
                width:  sourceSize.width /2
                height: sourceSize.height /2
                opacity:{
                    if (clouds === "Rain"|| clouds === "Snow showers")
                        1
                    else
                        0
                }
                smooth: true
                state: mainImage.state
                x: parent.width / 20
                y: if (state === "Shown")
                       parent.width / 2
                   else if (state === "Hidden")
                       -parent.width
                   else
                       parent.width / 2
                Behavior on y{NumberAnimation{duration: 1000;easing.type: Easing.OutBack}}
                source: "../artwork/" + "cloud_rain_1.png"
            }
            Image {
                id: hangerCloudRain1
                opacity: cloudsRainImage1.opacity
                height: sourceSize.height /2
                source: "../artwork/"+"cloud_rain_1_line.png"
                y: cloudsRainImage1.y - cloudsRainImage1.sourceSize.height -(cloudsRainImage1.sourceSize.height / 1.844)
                x:cloudsRainImage1.width / 1.844
            }
            // End cloudsImageRain1
            //cloudsImageRain2
            Image {
                id: cloudsImageRain2
                width:  sourceSize.width / 1.88
                height: sourceSize.height / 1.88
                smooth: true
                state: mainImage.state
                x: parent.width / 2
                opacity:{
                    if (clouds === "Rain"|| clouds === "Snow showers")
                        1
                    else
                        0
                }
                y: if (state === "Shown")
                       parent.width / 2
                   else if (state === "Hidden")
                       -parent.width
                   else
                       parent.width / 2
                Behavior on y{NumberAnimation{duration: 1400;easing.type: Easing.OutBack}}
                source: "../artwork/" + "cloud_rain_2.png"
            }
            Image {
                id: hangerCloudRain2
                height: sourceSize.height /2
                source: "../artwork/"+"cloud_rain_2_line.png"
                opacity: cloudsImageRain2.opacity

                y: cloudsImageRain2.y - cloudsImageRain2.sourceSize.height -(cloudsImageRain2.sourceSize.height / 1.14)
                x:cloudsImageRain2.x + cloudsImageRain2.width / 2.25
            }
            // End cloudsImageRain2
            //cloudsImageRain3
            Image {
                id: cloudsImageRain3
                width:  sourceSize.width /2
                height: sourceSize.height /2
                smooth: true
                opacity:{
                    if (clouds === "Rain" || clouds === "Snow showers")
                        1
                    else
                        0
                }
                state: mainImage.state
                x: parent.width / 50
                y: if (state === "Shown")
                       parent.width / 2.66
                   else if (state === "Hidden")
                       -parent.width
                   else
                       parent.width / 2.66
                Behavior on y{NumberAnimation{duration: 700;easing.type: Easing.OutBack}}
                source: "../artwork/" + "cloud_rain_3.png"
            }
            Image {
                id: hangerCloudRain3
                height: sourceSize.height /2
                opacity: cloudsImageRain3.opacity
                source: "../artwork/"+"cloud_rain_3_line.png"
                y: cloudsImageRain3.y - cloudsImageRain3.sourceSize.height -(cloudsImageRain3.sourceSize.height + cloudsImageRain3.height /2)
                x:cloudsImageRain3.x + cloudsImageRain3.width / 2.25
            }
            // End cloudsImageRain3
            ////////////////////////start Storm Clouds
            //cloudsImageStrom1
            Image {
                id: cloudsStormImage1
                width:  sourceSize.width /2
                height: sourceSize.height /2
                opacity:{
                    if (clouds === "Heavy rain" )
                        1
                    else
                        0
                }
                smooth: true
                state: mainImage.state
                x: parent.width / 20
                y: if (state === "Shown")
                       parent.width / 2
                   else if (state === "Hidden")
                       -parent.width
                   else
                       parent.width / 2
                Behavior on y{NumberAnimation{duration: 1000;easing.type: Easing.OutBack}}
                source: "../artwork/" + "cloud_storm_1.png"
            }
            Image {
                id: hangerCloudStorm1
                height: sourceSize.height /2
                opacity: cloudsImageTStorm1.opacity

                source: "../artwork/"+"cloud_storm_1_line.png"
                y: cloudsStormImage1.y - cloudsStormImage1.sourceSize.height -(cloudsStormImage1.sourceSize.height / 1.844)
                x:cloudsStormImage1.width / 1.844
            }
            // End cloudsImageStrom1
            //cloudsImageStrom2
            Image {
                id: cloudsImageStrom2
                width:  sourceSize.width / 1.88
                height: sourceSize.height / 1.88
                opacity:{
                    if (clouds === "Heavy rain" )
                        1
                    else
                        0
                }
                smooth: true
                state: mainImage.state
                x: parent.width / 2
                y: if (state === "Shown")
                       parent.width / 2
                   else if (state === "Hidden")
                       -parent.width
                   else
                       parent.width / 2
                Behavior on y{NumberAnimation{duration: 1400;easing.type: Easing.OutBack}}
                source: "../artwork/" + "cloud_storm_2.png"
            }
            Image {
                id: hangerCloudStorm2
                height: sourceSize.height /2
                source: "../artwork/cloud_storm_2_line.png"
                opacity: cloudsImageStrom2.opacity

                y: cloudsImageStrom2.y - cloudsImageStrom2.sourceSize.height -(cloudsImageStrom2.sourceSize.height / 1.14)
                x:cloudsImageStrom2.x + cloudsImageStrom2.width / 2.25
            }
            // End cloudsImageStrom
            //cloudsImageStrom3
            Image {
                id: cloudsImageStrom3
                width:  sourceSize.width /2
                height: sourceSize.height /2
                smooth: true
                opacity:{
                    if (clouds === "Heavy rain" )
                        1
                    else
                        0
                }
                state: mainImage.state
                x: parent.width / 50
                y: if (state === "Shown")
                       parent.width / 2.66
                   else if (state === "Hidden")
                       -parent.width
                   else
                       parent.width / 2.66
                Behavior on y{NumberAnimation{duration: 700;easing.type: Easing.OutBack}}
                source: "../artwork/" + "cloud_storm_3.png"
            }
            Image {
                id: hangerCloudStorm3
                opacity: cloudsImageStrom3.opacity
                height: sourceSize.height /2
                source: "../artwork/cloud_storm_3_line.png"
                y: cloudsImageStrom3.y - cloudsImageStrom3.sourceSize.height -(cloudsImageStrom3.sourceSize.height + cloudsImageStrom3.height /2)
                x:cloudsImageStrom3.x + cloudsImageStrom3.width / 2.25
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
                x: parent.width / 20
                y: if (state === "Shown")
                       parent.width / 2
                   else if (state === "Hidden")
                       -parent.width
                   else
                       parent.width / 2
                Behavior on y{NumberAnimation{duration: 1000;easing.type: Easing.OutBack}}
                source: "../artwork/" + "cloud_tstorm_1.png"
            }
            Image {
                id: hangerCloudTStorm1
                height: sourceSize.height /2
                source: "../artwork/cloud_tstorm_1_line.png"
                opacity: cloudsImageTStorm1.opacity
                y: cloudsImageTStorm1.y - cloudsImageTStorm1.sourceSize.height -(cloudsImageTStorm1.sourceSize.height / 1.844)
                x:cloudsImageTStorm1.width / 1.844
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
                x: parent.width / 2
                y: if (state === "Shown")
                       parent.width / 2
                   else if (state === "Hidden")
                       -parent.width
                   else
                       parent.width / 2
                Behavior on y{NumberAnimation{duration: 1400;easing.type: Easing.OutBack}}
                source: "../artwork/" + "cloud_tstorm_2.png"
            }
            Image {
                id: hangerCloudTStorm2
                height: sourceSize.height /2
                opacity: cloudsImageTStorm2.opacity
                source: "../artwork/"+"cloud_tstorm_2_line.png"
                y: cloudsImageTStorm2.y - cloudsImageTStorm2.sourceSize.height -(cloudsImageTStorm2.sourceSize.height / 1.14)
                x:cloudsImageTStorm2.x + cloudsImageTStorm2.width / 2.25
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
                x: parent.width / 50
                y: if (state === "Shown")
                       parent.width / 2.66
                   else if (state === "Hidden")
                       -parent.width
                   else
                       parent.width / 2.66
                Behavior on y{NumberAnimation{duration: 700;easing.type: Easing.OutBack}}
                source: "../artwork/" + "cloud_storm_3.png"
            }
            Image {
                id: hangerCloudTStorm3
                opacity: cloudsImageTStorm3.opacity
                height: sourceSize.height /2
                source: "../artwork/"+"cloud_storm_3_line.png"
                y: cloudsImageTStorm3.y - cloudsImageTStorm3.sourceSize.height -(cloudsImageTStorm3.sourceSize.height + cloudsImageTStorm3.height /2)
                x:cloudsImageTStorm3.x + cloudsImageTStorm3.width / 2.25
            }
            // End cloudsImageTStorm3
            /////////////////////// Credits
            Text {
                id: creditcTXT
                text: creditTXT
                color: "white"
                wrapMode: Text.WordWrap
                width: separator1.width
                y:tempatureTxt.y + tempatureTxt.height - 15
                font.pixelSize: 11
                anchors{
                    left:parent.left
                }
            }
            Text {
                id: creditcLink
                text: creditURL
                color: "white"
                font.pixelSize: 9
                anchors{
                    top: creditcTXT.bottom
                }
            }
            MouseArea{
                anchors.fill: creditcLink
                hoverEnabled: true
                onEntered:{
                    creditcLink.color = "blue"
                    creditcLink.font.underline = true
                }
                onExited: {
                    creditcLink.color = "white"
                    creditcLink.font.underline = false
                }
                onClicked:{
                    if (weatherWebSlider.state === "Hidden"){
                        weatherWebSlider.x = 0
                        weatherWebSlider.state = "Shown"
                        detailsButton.y = tabs.height

                    } else{
                        weatherWebSlider.x = separator1.width * 2
                        weatherWebSlider.state = "Hidden"
                        detailsButton.opacity = 1
                        detailsSaveButtonTxt.opacity = 1
                    }
                }
            }
            Image {
                id: fahrenheitImg
                source: "../artwork/"+"fahrenheit.png"
                width: sourceSize.width / 2
                height: sourceSize.height / 2
                opacity: tempatureTxt.state === "Celcius" ? 0 : 1
                Behavior on opacity {NumberAnimation{duration: 200; easing.type: Easing.InQuad}}
                y: tempatureTxt.state === "Celcius" ? separator1.height * 2 : separator1.width - (tempatureTxt.height /2)
                Behavior on y {NumberAnimation{duration: 1200 ; easing.type: Easing.OutBack}}
                x: tempatureTxt.width + (tempatureTxt.height/2)
            }
            Image {
                id: celciusImg
                source: "../artwork/centigrades.png"
                height: sourceSize.height / 2
                width: sourceSize.width / 2
                opacity: tempatureTxt.state === "Celcius" ? 1 : 0
                Behavior on opacity {NumberAnimation{duration:200;  easing.type: Easing.OutQuad}}
                x: tempatureTxt.state === "Celcius" ? tempatureTxt.width :tempatureTxt.state === "Fahrenheit"? -separator1.width : tempatureTxt.width
                Behavior on x{NumberAnimation{duration: 1200; easing.type: Easing.OutBack}}
                anchors{
                    top: tempatureTxt.top
                }

            }
            Text {
                id: tempatureTxt
                text: temperature
                color: "white"
                width: separator1.width / 2
                font.pixelSize: 64
                font.bold: true
                state: "Celcius"
                x: state === "Celcius" ? (separator1.width / 1.22)-width : (separator1.width/1.22)-width
                y: parent.width / 1.12
            }
            MouseArea{
                anchors.fill: tempatureTxt
                onClicked: {
                    function cutDot(){
                        var f = (temperature * 9 / 5 + 32).toLocaleString()
                        return f.substring(0,f.lastIndexOf("."))
                    }
                    if (tempatureTxt.state === "Celcius"){
                        tempatureTxt.text = cutDot()
                        tempatureTxt.state = "Fahrenheit"
                    }else{
                        tempatureTxt.text = temperature
                        tempatureTxt.state = "Celcius"

                    }
                }
            }
            /////////////////////////////////////Weather Web Page Slider
            Rectangle{
                id:weatherWebSlider
                width: separator1.width
                height: tab.height
                color: "#88000000"
                state: "Hidden"
                x: state === "Hidden" ? separator1.width * 2 : 0
                Behavior on x{NumberAnimation{duration: 1200; easing.type: Easing.OutBack}}
                WebView{
                    anchors.fill: weatherWebSlider
                    url: creditURL
                }
            }
            // weather Slider Button
            Rectangle{
                id:weatherWebSliderButton
                width: separator1.width / 3
                height: separator1.width / 9
                opacity: weatherWebSlider.state === "Shown" ? 1 : 0
                Behavior on opacity {NumberAnimation{duration: 700; easing.type: Easing.OutSine}}
                state: "Hidden"
                color:"grey"
                x: tabs.width / 2 - (width/2)
                y: tabs.width + (height*1.6)
            }
            Text {
                id:weatherWebSliderButtonTxt
                color:"#92FFFFFF"
                opacity: weatherWebSlider.state === "Shown" ? 1 : 0
                anchors.centerIn: weatherWebSliderButton
                text: "Close"
            }
            MouseArea{
                anchors.fill: weatherWebSliderButtonTxt
                onClicked: {
                    if (weatherWebSlider.state === "Hidden"){
                        weatherWebSlider.x = 0
                        weatherWebSlider.state = "Shown"

                    } else{
                        weatherWebSlider.x = separator1.width * 2
                        weatherWebSlider.state = "Hidden"
                        detailsButton.y = separator1.width + (height*3.66)
                    }
                }
            }
            //////////////////////////////////// This is Details
            Rectangle{
                id:detailsSlider
                width: separator1.width
                height: separator1.width * 1.5
                color: "#88000000"
                state: "Hidden"
                x: state === "Hidden" ? -separator1.width * 2 : 0
                Behavior on x{NumberAnimation{duration: 1200; easing.type: Easing.OutBack}}
                Text {
                    id: conditions
                    height: 20
                    width: separator1.width
                    text:"<b>Conditions: </b>"+clouds
                    color: "white"
                    font.pixelSize: 12
                    anchors{
                        top:detailsSlider.top
                        topMargin:40  //detailsSlider.width / 2
                        left: parent.left
                        leftMargin: parent.width / 20

                    }
                }
                Text {
                    id: humidityText
                    height: 20
                    width: separator1.width
                    text:"<b>Wind Speed: </b>" + windSpeed + "  \("+ windSpeedMPS +" MPS \) "
                    color: "white"
                    font.pixelSize: 12
                    anchors{
                        top:conditions.bottom
                        topMargin: 1
                        left: parent.left
                        leftMargin: parent.width / 20
                    }
                }
                Text {
                    id: dewPointTxt
                    height: 20
                    width: separator1.width
                    text:"<b>Wind Direction: </b>" + windDirection
                    color: "white"
                    font.pixelSize: 12
                    anchors{
                        top:humidityText.bottom
                        topMargin: 1
                        left: parent.left
                        leftMargin: parent.width / 20
                    }
                }
                Text {
                    id: presureTxt
                    height: 20
                    width: separator1.width
                    text:"<b>Pressure: </b>"+pressure
                    color: "white"
                    font.pixelSize: 12
                    anchors{
                        top:dewPointTxt.bottom
                        topMargin: 1
                        left: parent.left
                        leftMargin: parent.width / 20

                    }
                }
                Text {
                    id: timeFromTxt
                    height: 20
                    width: separator1.width
                    text:"<b>Staring Observation Time: </b>"+   Qt.formatDateTime( timeFrom,"dddd, hh:mm yyyy ")
                    color: "white"
                    font.pixelSize: 12
                    anchors{
                        top:presureTxt.bottom
                        topMargin: 1
                        left: parent.left
                        leftMargin: parent.width / 20
                    }
                }
                Text {
                    id: timeToTxt
                    height: 20
                    width: separator1.width
                    text:"<b>Ending Observation Time: </b>"+Qt.formatDateTime( timeTo,"dddd, hh:mm yyyy ")
                    color: "white"
                    font.pixelSize: 12
                    anchors{
                        top:timeFromTxt.bottom
                        topMargin: 1
                        left: parent.left
                        leftMargin: parent.width / 20
                    }
                }
                Text {
                    id: sunRiseTxt
                    height: 20
                    width: separator1.width
                    text:"<b>Sun Rise: </b>"+Qt.formatDateTime( sunRise," hh:mm")
                    color: "white"
                    font.pixelSize: 12
                    anchors{
                        top:timeToTxt.bottom
                        topMargin: 1
                        left: parent.left
                        leftMargin: parent.width / 20
                    }
                }
                Text {
                    id: sunSetTxt
                    height: 20
                    width: separator1.width
                    text:"<b>Sun Set: </b>"+Qt.formatDateTime( sunSet," hh:mm")
                    color: "white"
                    font.pixelSize: 12
                    anchors{
                        top:sunRiseTxt.bottom
                        topMargin: 1
                        left: parent.left
                        leftMargin: parent.width / 20

                    }
                }
                //Grid for extras
            }
            // Details Button
            Rectangle{
                id:detailsButton
                width: separator1.width / 3
                height: separator1.width / 9
                color:"grey"
                x: parent.width - width
                y: parent.width + (height*1.6)
                Behavior on y{NumberAnimation{duration: 700;easing.type: Easing.OutBack}}
            }
            Text {
                id:detailsButtonTxt
                color:"#92FFFFFF"
                anchors.centerIn: detailsButton
                text: "details"
            }
            MouseArea{
                anchors.fill: detailsButtonTxt
                onClicked: {
                    if (detailsSlider.state === "Hidden"){
                        detailsSlider.x = 0
                        detailsSlider.state = "Shown"
                    } else{
                        detailsSlider.x = -separator1.width * 2
                        detailsSlider.state = "Hidden"
                    }
                }
            }

        }//Item
    }//ListView
//    XmlListModel {
//        id: homeModel
//        function loadthis(){
//            return "http://www.yr.no/place/"+DataBase.homeCountry()+"/"+DataBase.homeState()+"/"+DataBase.homeCity()+"/forecast_hour_by_hour.xml"
//        }
//        source:loadthis()
//        query: "/weatherdata"
//        XmlRole { name: "timezone"; query: "location/type/string()"}
//        XmlRole { name: "timeFrom"; query: "forecast/tabular/time[1]/@from/string()"}
//        XmlRole { name: "timeTo"; query: "forecast/tabular/time[1]/@to/string()"}
//        XmlRole { name: "observationTime"; query: "forecast/tabular/time[1]/string()"}
//        XmlRole { name: "temperature"; query: "forecast/tabular/time[1]/temperature/@value/string()" }
//        XmlRole { name: "precipitation"; query: "forecast/tabular/time[1]/precipitation/@value/string()" }
//        XmlRole { name: "clouds"; query: "forecast/tabular/time[1]/symbol/@name/string()" }
//        XmlRole { name: "windDirection"; query: "forecast/tabular/time[1]/windDirection/@name/string()" }
//        XmlRole { name: "windSpeed"; query: "forecast/tabular/time[1]/windSpeed/@name/string()" }
//        XmlRole { name: "windSpeedMPS"; query: "forecast/tabular/time[1]/windSpeed/@mps/string()" }
//        XmlRole { name: "pressure"; query: "forecast/tabular/time[1]/pressure/@value/string()" }
//        XmlRole { name: "sunRise"; query: "sun/@rise/string()"  }
//        XmlRole { name: "sunSet"; query: "sun/@set/string()"  }
//        XmlRole { name: "weatherCondition"; query: "forecast/tabular/string()"}
//        XmlRole { name: "status"; query: "forecast/tabular/string()" }
//        XmlRole { name:"creditTXT"; query: "credit/link/@text/string()"}
//        XmlRole { name:"creditURL"; query: "credit/link/@url/string()"}
//        onStatusChanged: {
//            if (status == XmlListModel.Ready){
//                console.log("Home Loaded")
//            }
//            if (status == XmlListModel.Loading){
//                console.log("Home Loading")
//            }
//            if (status == XmlListModel.Error)
//                console.log("Home Error" + errorString());
//        }
//    }
}//Item
