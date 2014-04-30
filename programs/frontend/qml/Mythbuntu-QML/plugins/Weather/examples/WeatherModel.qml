import QtQuick 2.0
import QtQuick.XmlListModel 2.0
XmlListModel {
    id: serieModel
    function load(Name,North,South,East,West) {
        console.log("Loading Weather For \n")
//        source = "http://api.geonames.org/weatherXML?north="+North+"&south="+South+"&east="+East+"&west="+West+"&username=bobweaver12345"
        reload()
    }
    source: ''
    query: "//observation"
    XmlRole { name: "observationTime"; query: "observationTime/string()" }
    XmlRole { name: "temperature"; query: "temperature/string()" }
    XmlRole { name: "dewPoint"; query: "dewPoint/string()" }
    XmlRole { name: "humidity"; query: "humidity/string()" }
    XmlRole { name: "clouds"; query: "clouds/string()" }
    XmlRole { name: "weatherCondition"; query: "weatherCondition/string()"}
    XmlRole { name: "status"; query: "Status/string()" }
    XmlRole { name: "windDirection"; query: "windDirection/string()" }
    XmlRole { name: "windSpeed"; query: "windSpeed/string()" }
}
