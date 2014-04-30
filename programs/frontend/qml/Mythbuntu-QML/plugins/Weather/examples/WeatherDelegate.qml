import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.Particles 2.0
import QtQuick.Window 2.0
import QtQuick.LocalStorage 2.0
//import QtWebKit 3.0
import "../common/dbUtils.js" as DataBase
import "../common/Utils.js" as Util
Item {
    id: serie
    property string name:''
    property string countryName:''
    property string adminName1:''
    function loadDetails(countryName,adminName1,name) {
        serie.name = name
        serie.countryName = countryName
        serie.adminName1 = adminName1
        serieModel.load(countryName,adminName1,name)
    }

    XmlListModel {
        id: serieModel
        function load(CountryName,AdminName1,Name) {
            console.log("Loading Weather For ....... \n "+Name+"\n \n"
                        + encodeURI("http://www.yr.no/place/"
                                    + CountryName
                                    + "/"
                                    + AdminName1
                                    + "/"
                                    + Name
                                    + "/forecast.xml"))
            source = encodeURI("http://www.yr.no/place/"+CountryName+"/"+AdminName1+"/"+Name+"/forecast_hour_by_hour.xml")
            reload()
        }
        query: "/weatherdata"
        XmlRole { name: "timezone"; query: "location/type/string()"}

        // Right Now
        XmlRole { name: "timeFrom"; query: "forecast/tabular/time[1]/@from/string()"}
        XmlRole { name: "timeTo"; query: "forecast/tabular/time[1]/@to/string()"}
        XmlRole { name: "observationTime"; query: "forecast/tabular/time[1]/string()"}
        XmlRole { name: "temperature"; query: "forecast/tabular/time[1]/temperature/@value/string()" }
        XmlRole { name: "precipitation"; query: "forecast/tabular/time[1]/precipitation/@value/string()" }
        XmlRole { name: "clouds"; query: "forecast/tabular/time[1]/symbol/@name/string()" }
        XmlRole { name: "windDirection"; query: "forecast/tabular/time[1]/windDirection/@name/string()" }
        XmlRole { name: "windSpeed"; query: "forecast/tabular/time[1]/windSpeed/@name/string()" }
        XmlRole { name: "windSpeedMPS"; query: "forecast/tabular/time[1]/windSpeed/@mps/string()" }
        XmlRole { name: "pressure"; query: "forecast/tabular/time[1]/pressure/@value/string()" }
        XmlRole { name: "sunRise"; query: "sun/@rise/string()"  }
        XmlRole { name: "sunSet"; query: "sun/@set/string()"  }
        XmlRole { name: "weatherCondition"; query: "forecast/tabular/string()"}
        XmlRole { name: "status"; query: "forecast/tabular/string()" }
        XmlRole { name:"creditTXT"; query: "credit/link/@text/string()"}
        XmlRole { name:"creditURL"; query: "credit/link/@url/string()"}
        onStatusChanged: {
            if (status == XmlListModel.Ready) console.log("Loaded")
            if (status == XmlListModel.Loading) console.log("Loading");
        }
    }

    Text {
        id: cityName
        color: "white"
        height:22
        font.bold: true
        font.pixelSize: 28
        text: serie.name
        anchors{
            top: parent.top
            topMargin: 80
        }
    }

    Rectangle{
        id: separator1
        color: "#44000000"
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
    ListView {
        model: serieModel
        delegate: Item{
            property string temp: tempatureTxt.text.toString()
            id: topLayout
            width: parent.width;
            height: parent.height
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
                            width: page.width
                            height: page.height
                            x: page.width / 20
                            y: page.height / 1.58
                            system: snowSystem
                            source: Util.dir+"snow_flake_01.png"
                            color: "#FFFAFA"
                            clip: true
                            alpha: 0.8
                        }
                        ParticleSystem {
                            id: snowSystem
                        }
                        Emitter {
                            system: snowSystem
                            width: page.width
                            height: page.height
                            emitRate: 22
                            lifeSpan: 9000
                            size: page.width / 30
                            sizeVariation:page.width / 9
                            velocity: AngleDirection {
                                angleVariation: 90;
                                magnitude: 9
                            }
                            maximumEmitted: 100
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
                            width: page.width
                            height: page.height / 12
                            x: page.width / 20
                            y: page.height / 1.58
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
                            y:page.height / 1.5
                            height: page.height / 4
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
                            size: page.width
                            sizeVariation:page.width
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
                    topMargin: 86
                }
            }
            MouseArea{
                anchors.fill: timeAroo
                onClicked: if (timeAroo.text === Qt.formatDateTime(new Date(), "hh"+":"+"mm") ){
                               timeAroo.text = Qt.formatDateTime(new Date(), "h:mm ap")
                               timeAroo.state = "12-Hour"
                           }else{
                               timeAroo.text = Qt.formatDateTime(new Date(), "hh"+":"+"mm")
                               timeAroo.state = "Milatary"
                           }
            }
            Image {
                id: fahrenheitImg
                source: Util.dir+"fahrenheit.png"
                width: sourceSize.width / 2
                height: sourceSize.height / 2
                opacity: tempatureTxt.state === "Celcius" ? 0 : 1
                Behavior on opacity {NumberAnimation{duration: 200; easing.type: Easing.InQuad}}
                y: tempatureTxt.state === "Celcius" ? separator1.height * 2 : separator1.width
                Behavior on y {NumberAnimation{duration: 1200 ; easing.type: Easing.OutBack}}
                x: tempatureTxt.width + tempatureTxt.height + 12
            }
            Image {
                id: celciusImg
                source:{if(tempatureTxt.state === "Celcius")
                        Util.dir+"centigrades.png"
                    else
                        Util.dir+"fahrenheit.png"
                }
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
                y: page.height / 1.44
            }MouseArea{
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
                height: sourceSize.height
                smooth: true
                state: "Shown"
                x: page.width /2 - (width/2)
                y: if (state === "Shown")
                       page.height / 4.22
                else if (state === "Hidden")
                       -page.height
                else
                       page.height/ 5.44
                Behavior on y{NumberAnimation{duration: 1200;easing.type: Easing.OutBounce}}
                source: {

                    if (Util.nightOrDay(new Date(),"hh") === "night" === true )
                        Util.dir + "moon.png"
                    else if (Util.nightOrDay(new Date(),"hh") === "night" !== true  && temperature > 5)
                        Util.dir + "sun.png"
                    else if (Util.nightOrDay(new Date(),"hh") === "night" !== true  && temperature < 5)
                        Util.dir + "cold_sun.png"

                    else if (weatherCondition === "light rain" && Util.nightOrDay(new Date(),"hh") === "night" !== true)
                        Util.dir+"sun.png"


                    else if (weatherCondition === "mist" && Util.nightOrDay(new Date(),"hh") === "night" !== true)
                        Util.dir+"cold_sun.png"



                    else
                        Util.dir +"na_icon.png"
                }

            }MouseArea  {
                id:mainImageMouseArea
                anchors.fill: mainImage
                onPressAndHold:{ mainImage.state = "Hidden" }
                onReleased:{mainImage.state = "Shown"}
            }


            //Start to add the clouds
            // Ok this is how this works if there condtions call for the cloud then they are shown pelse they are not.
            //each item has a string and the string is set to match the item that it is attached to. this makes it so
            //so that each time the moon or sun is pressed and held each one will move up with animations and also on different durations
            //It is imporant that we keep the states the same as "main Image" aka the sun or moon or cold sun

  //////////////////////////cloudsImage1
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
                x: page.width / 20
                y: if (state === "Shown")
                       page.height / 2
                else if (state === "Hidden")
                       -page.height
                else
                       page.height / 2
                Behavior on y{NumberAnimation{duration: 1000;easing.type: Easing.OutBack}}
                source: Util.dir + "cloud_1.png"
                }
            Image {
                id: hangerCloud1
                height: sourceSize.height /2
                         opacity: cloudsImage1.opacity

                            source: Util.dir+"cloud_1_line.png"
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
                x: page.width / 2
                y: if (state === "Shown")
                       page.height / 2
                else if (state === "Hidden")
                       -page.height
                else
                       page.height / 2
                Behavior on y{NumberAnimation{duration: 1400;easing.type: Easing.OutBack}}
                source: Util.dir + "cloud_2.png"
                }
            Image {
                id: hangerCloud2
                         opacity: cloudsImage2.opacity

                            height: sourceSize.height /2
                source: Util.dir+"cloud_2_line.png"
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
                x: page.width / 50
                y: if (state === "Shown")
                       page.height / 2.66
                else if (state === "Hidden")
                       -page.height
                else
                       page.height / 2.66
                Behavior on y{NumberAnimation{duration: 700;easing.type: Easing.OutBack}}
                source: Util.dir + "cloud_3.png"
                }
            Image {
                id: hangerCloud3
                opacity: cloudsImage3.opacity
                            height: sourceSize.height /2
                source: Util.dir+"cloud_3_line.png"
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
            Image {
                id: hangerCloudRain1
                         opacity: cloudsRainImage1.opacity

                            height: sourceSize.height /2
                source: Util.dir+"cloud_rain_1_line.png"
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
            Image {
                id: hangerCloudRain2
                height: sourceSize.height /2
                source: Util.dir+"cloud_rain_2_line.png"
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
            Image {
                id: hangerCloudRain3
                height: sourceSize.height /2
                         opacity: cloudsImageRain3.opacity

                            source: Util.dir+"cloud_rain_3_line.png"
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
            Image {
                id: hangerCloudStorm1
                height: sourceSize.height /2
                         opacity: cloudsImageTStorm1.opacity

                            source: Util.dir+"cloud_storm_1_line.png"
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
            Image {
                id: hangerCloudStorm2
                height: sourceSize.height /2
                source: Util.dir+"cloud_storm_2_line.png"
                         opacity: cloudsImageStrom2.opacity

                            y: cloudsImageStrom2.y - cloudsImageStrom2.sourceSize.height -(cloudsImageStrom2.sourceSize.height / 1.14)
                x:cloudsImageStrom2.x + cloudsImageStrom2.width / 2.25
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
            Image {
                id: hangerCloudStorm3
             opacity: cloudsImageStrom3.opacity
                height: sourceSize.height /2
                source: Util.dir+"cloud_storm_3_line.png"
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
            Image {
                id: hangerCloudTStorm1
                height: sourceSize.height /2
                source: Util.dir+"cloud_tstorm_1_line.png"
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
            Image {
                id: hangerCloudTStorm2
                height: sourceSize.height /2
                opacity: cloudsImageTStorm2.opacity
                source: Util.dir+"cloud_tstorm_2_line.png"
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
            Image {
                id: hangerCloudTStorm3
                opacity: cloudsImageTStorm3.opacity
                height: sourceSize.height /2
                source: Util.dir+"cloud_storm_3_line.png"
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
                y:tempatureTxt.y + tempatureTxt.height
                font.pixelSize: 12
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
                    } else{
                        weatherWebSlider.x = separator1.width * 2
                        weatherWebSlider.state = "Hidden"
                    }
                }
            }

            /////////////////////////////////////Weather Web Page Slider
            Rectangle{
                id:weatherWebSlider
                width: separator1.width
                height: Screen.height
                color: "#88000000"
                state: "Hidden"
                x: state === "Hidden" ? separator1.width * 2 : 0
                Behavior on x{NumberAnimation{duration: 1200; easing.type: Easing.OutBack}}
//                WebView{
//                    anchors.fill: weatherWebSlider
//                    url: creditURL
//                }
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
                x: Screen.width / 2 - (width/2)
                y: Screen.width + (height*3)
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
                        topMargin:detailsSlider.width / 2
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
                    text:"<b>Staring Observation Time: </b>"+  Qt.formatDateTime( timeFrom,"dddd, hh:mm yyyy ")
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
                Rectangle{
                    id:saveButton
                    width: separator1.width / 3
                    height: separator1.width / 8
                    color:"grey"
                    x: page.width / 3
                    y: page.height / 1.5
                }
                MouseArea{
                                    id:saveButtonMouseArea
                                    anchors.fill: saveButton
                                    onClicked: {
                                                                           DataBase.createInitHomeTable()
                                                                           DataBase.truncateHome()
                                                                           function insertIntoTable() {
                                                                               var db = DataBase.homeDatabase();
                                                                               db.transaction(
                                                                                   function(tx) {
                                                                                       tx.executeSql('INSERT INTO weather_api_home VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',  [ '1', encodeURI(serie.countryName), encodeURI(serie.adminName1) , encodeURI(serie.name), serie.timezone, serie.timeFrom , serie.timeTo, serie.observationTime, serie.temperature , serie.precipitation, clouds, serie.windDirection ,  serie.windSpeed, serie.windSpeedMPS, serie.pressure, serie.sunRise ,serie.sunSet, serie.weatherCondition, serie.status , serie.creditTXT, serie.creditURL ]);
                                                                                   }
                                                                               )
                                                                           }
                                                                           insertIntoTable()
                                                                           savedTXT.opacity = 1
                                                                           savedTXT.scale = 1
                                                                           console.log(
                                                                                         DataBase.homeCountry() + "\n"
                                                                                       + DataBase.homeState() + "\n"
                                                                                       + DataBase.homeCity() +"\n"
                                                                                       + serie.countryName + "\n"
                                                                                       + serie.adminName1 +"\n"
                                                                                       + serie.name + "\n"+"\n"  + "\n"+"\n"  + "\n"+"\n"
                                                                                       + DataBase.homeClouds()

                                                                                       )
                                                                       }


                             }
                Text {
                    id:detailsSaveButtonTxt
                    color:"#92FFFFFF"
                    anchors.centerIn: saveButtonMouseArea
                    text: "Save"
                }
                Text {
                    id: savedTXT
                    text: qsTr("Saved")
                    color: "white"
                    font.bold: true
                    font.pixelSize: 22
                    scale: 0
                    Behavior on scale {NumberAnimation{from:1;to:0;duration: 3700;easing.type: Easing.OutQuad}}
                    opacity: 0
                    Behavior on opacity {}
                    x: (page.width / 2) - (width/2)
                    anchors{
                        top: detailsSaveButtonTxt.bottom
                    }
                }
            }//Details Rec
            // Details Button
            Rectangle{
                id:detailsButton
                width: separator1.width / 3
                height: separator1.width / 8
                color:"grey"
                x: page.width - width
                y: page.height - height
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
}//Item
