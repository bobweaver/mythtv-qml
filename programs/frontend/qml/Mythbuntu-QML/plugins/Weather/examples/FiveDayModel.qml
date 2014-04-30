import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import "../common/dbUtils.js" as DataBase
//webcam id
///1dc9df68bb4c047e940c2f9be7d6038d
    XmlListModel {
        id: fivedayModel
        function loadthis(){
         return "http://www.yr.no/place/"+DataBase.homeCountry()+"/"+DataBase.homeState()+"/"+DataBase.homeCity()+"/forecast.xml"
        }
        source:loadthis()
        query: "/weatherdata/forecast/tabular/time"
        XmlRole { name: "timeFrom"; query: "@from/string()"}
        XmlRole { name: "timeTo"; query: "@to/string()"}
        XmlRole { name: "period"; query: "@period/string()"}
        //Role INfos
        XmlRole { name: "temperature"; query: "temperature/@value/string()" }
        XmlRole { name: "precipitation"; query: "precipitation/@value/string()" }
        XmlRole { name: "clouds"; query: "symbol/@name/string()" }
        XmlRole { name: "windDirection"; query: "windDirection/@name/string()" }
        XmlRole { name: "windSpeed"; query: "windSpeed/@name/string()" }
        XmlRole { name: "windSpeedMPS"; query: "windSpeed/@mps/string()" }
        XmlRole { name: "pressure"; query: "pressure/@value/string()" }
        onStatusChanged: {
            if (status == XmlListModel.Ready){
                console.log("5 Day Loaded"
                            + "http://www.yr.no/place/"+DataBase.homeCountry()+"/"+DataBase.homeState()+"/"+DataBase.homeCity()+"/forecast.xml"
                            )
            }
            if (status == XmlListModel.Loading){
                console.log("5 Day Loading")
            }
            if (status == XmlListModel.Error)
                console.log("5 Day Error" + errorString());
        }
    }

