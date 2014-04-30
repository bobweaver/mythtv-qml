import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import  MythTv 1.0
import "../../../plugins/tvdb/content"

Item {
    id: tvdbRoot
    property string sourceApi: tvdbModel.source
    width: mediascreen.width
    height: mediascreen.height
    Rectangle{
        id: rootListView
        width: mediascreen.width
        height: mediascreen.height
        ListView{
            id: listview
            width: mediascreen.width
            height: mediascreen.height
            model: tvdbModel
            delegate: Item{
                width: mediascreen.width
                height: mediascreen.height
                anchors.centerIn: parent
                Text {
                    id: markerId
                    text: titles.text
                    color: "transparent"
                }
                MythPictureButton{
                    id: tvdbButton
                    width: mediascreen.width /6
                    height: mediascreen.height /6
                    buttonImage: "../../../artwork/tvdb.jpg"
                    anchors.centerIn: parent
                    Rectangle{
                        id: numberCir
                        radius: 180
                        width: 54
                        height: 54
                        color: "grey"
                        anchors{
                            left: tvdbButton.right
                            top: tvdbButton.top

                        }
                        Text {
                            id: numberOfMatch
                            text: tvdbModel.count
                            color: "black"
                            anchors.centerIn: numberCir
                        }
                        Text {
                            id: markerSId
                            text: seriesid
                            color: "transparent"
                        }
                        Text {
                            id: markerOver
                            text: overview
                            color: "transparent"
                        }
                        Text {
                            id: markerName
                            text: name
                            color: "transparent"
                        }
                        Text {
                            id: markerBanner
                            text: banner
                            color: "transparent"
                        }
                    }
                    onButtonClicked: {
                        col.opacity = 1
                        tvdbModel2.source =encodeURI("http://thetvdb.com/api/GetSeries.php?seriesname=" + markerId.text)
                    }
                }
            }
        }
    }
    Rectangle{
        id: col
        opacity: 0
        width: mediascreen.width
        height: mediascreen.height
        color: "blue"
        ListView{
            model: tvdbModel2
            spacing: 28
            orientation: ListView.Vertical
            flickableDirection: Flickable.VerticalFlick

            delegate: Item{
                width: mediascreen.width
                height: mediascreen.height /10
                Column{
                    width: mediascreen.width
                    height: mediascreen.height / 10
                    Rectangle{
                        id: mainBanner
                        color: "green"
                        width: mediascreen.width
                        height: mediascreen.height / 10
                        radius: 8
                        Image {
                            id: bannerImg
                            width: mediascreen.width
                            height: mediascreen.height / 10
                            source:  "http://thetvdb.com/banners/"+banner
                            anchors.centerIn:mainBanner
                        }
                        MouseArea{
                            anchors.fill: bannerImg
                            onClicked: {
                                console.log("clicked")
                                //
                                col.opacity = 0
                                singleSerieModel.source ="http://thetvdb.com/api/040BCD04E3D1E109/series/" + marker2.text.toString() + "/all/en.xml"
                                //         seriesDelRec.opacity = 1

                            }

                        }
                    }
                }
            }
        }
    }

    XmlListModel {
        id: tvdbModel
        source:  sourceApi
        query: "//Data/Series"
        XmlRole { name: "name"; query: "SeriesName/string()" }
        XmlRole { name: "seriesid"; query: "seriesid/string()" }
        XmlRole { name: "overview"; query: "Overview/string()" }
        XmlRole { name: "banner"; query: "banner/string()" }
        onCountChanged: {
            console.log(count )
        }
        onStatusChanged: {
            if (status == XmlListModel.Loading) console.log(encodeURI(source) );
            if (status == XmlListModel.Error) console.log("Error: " + errorString);
        }
    }
    XmlListModel {
        id: tvdbModel2
        source:  ""
        query: "/Data/Series[*]"
        XmlRole { name: "banner"; query: "banner/string()" }
        XmlRole { name: "seriesid"; query: "seriesid/string()" }

        onCountChanged: {
            console.log(count )
        }
        onSourceChanged: {
            reload()
        }
        onStatusChanged: {
            if (status == XmlListModel.Loading) console.log(encodeURI(source) );
            if (status == XmlListModel.Error) console.log("Error: " + errorString);
        }
    }
    XmlListModel {
        id: singleSerieModel
        source: ""//serieModelSource
        query: "//Data/Series"
        XmlRole { name: "seriesid"; query: "id/string()" }
        XmlRole { name: "title"; query: "SeriesName/string()" }
        XmlRole { name: "banner"; query: "banner/string()" }
        XmlRole { name: "fanart"; query: "fanart/string()" }
        XmlRole { name: "poster"; query: "poster/string()" }
        XmlRole { name: "thumb"; query: "thumb[1]/string()"}
        XmlRole { name: "status"; query: "Status/string()" }
        XmlRole { name: "runtime"; query: "Runtime/string()" }
        XmlRole { name: "rating"; query: "Rating/string()" }
        XmlRole { name: "network"; query: "Network/string()" }
        XmlRole { name: "firstaired"; query: "FirstAired/string()" }
    }
    Text {
        id: marker2
        text: seriesid
        color: "transparent"
    }
}

