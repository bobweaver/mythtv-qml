import QtQuick 2.0
import QtQuick.XmlListModel 2.0

XmlListModel {
    id: seriesModel
    function newSearch(text) {
        console.log("Searching: " + text);
        source ="http://api.geonames.org/search?q="+text+"&maxRows=10&username=bobweaver12345&style=FULL"
        reload()
    }
    query: "//geonames/geoname"
    XmlRole { name: "name"; query: "name/string()" }
    XmlRole { name: "lat"; query: "lat/string()" }
    XmlRole { name: "lng"; query: "lng/string()" }
    XmlRole { name:"postalcode"; query: "postalcode/string()"}          //zip code
    //    XmlRole { name:"stateName"; query: "adminName1/string()"}         //state
    XmlRole { name:"countryName"; query: "countryName/string()"}        //country long name
    XmlRole { name:"countryCode"; query: "countryCode/string()"}         //counrty short name
    XmlRole { name:"geonameId"; query: "geonameId/string()"}            //site name ID
    XmlRole { name:"fclName"; query: "fclName/string()"}                //Items a town ,city ,rural ,ect
    XmlRole { name:"population"; query: "population/string()"}          //population of item
    XmlRole { name:"elevation"; query: "elevation/string()"}            //elevation of Item
    XmlRole { name:"adminName1"; query: "adminName1/string()"}          //long statename
    XmlRole { name:"adminName2"; query: "adminName2/string()"}          // county in state USA
    //    bbox top line of the east west south and north
    XmlRole { name:"west";query: "bbox/west/string()"}
    XmlRole { name:"north"; query: "bbox/north/string()"}
    XmlRole { name:"east"; query: "bbox/east/string()"}
    XmlRole { name:"south"; query: "bbox/south/string()"}

//    XmlRole { name:"score" ; query:"score/string()" }                  // Have No clue
    XmlRole { name:"totalResultsCount" ; query:"totalResultsCount/string()" }                  // For Debuging

    onStatusChanged: {
        if (status == XmlListModel.Ready) console.log("Loaded")
        if (status == XmlListModel.Loading) console.log("Loading");
//        if (status == XmlListModel.Error) console.log("Error: " + errorString );
    }
}

