import QtQuick 2.0
import "common"
import "examples"
import QtQuick.Window 2.0
import QtQuick.XmlListModel 2.0
Rectangle {
    id: page
    width:  Screen.width; height: Screen.height
    color: "black"
    property string currentSearchString: ""
    Text {
        id: searchHeader
        text: qsTr("  Location")
        font.family: "Ubuntu"
        color: "#92FFFFFF"
        font.pixelSize: 22
        opacity: searchBar.anchors.top === parent.bottom ? 0 : 1
        Behavior on opacity{ NumberAnimation{duration: 1200 ;easing.type: Easing.OutQuart}}
        anchors{
            top: parent.top
            topMargin:searchBar.height + 20
        }
    }
    SearchBar {
        id: searchBar
        width: parent.width
        height:80
        KeyNavigation.down: listView
        anchors{
            top: searchHeader.bottom

        }
        onSearch: {
            currentSearchString = text;
            feedModel.newSearch(text);
        }
    }
    GridView {
        id: listView
        width: parent.width -10
        cacheBuffer: 687
        anchors{
            top: searchBar.bottom;
            topMargin: 5
            bottom: parent.bottom
        }
        contentHeight: 10
        contentWidth: parent.width
        cellHeight: parent.height / 4
        cellWidth:parent.width
        clip: true
        model: GetLatLongModel {
            id: feedModel;
            source: ''
            onStatusChanged: {
                if (status == XmlListModel.Loading){
                    progresDialog.text = "Searching '" + currentSearchString + "'";
                    page.state = 'Loading';
                } else {
                    page.state = '';
                }
            }
        }
        delegate: GetLatLongDelegate {
            id:feedDelegate
            onClicked:  {
                serieDelegate.loadDetails(countryName,adminName1,name);
                page.state = 'Serie';
            }
        }
    }
    Rectangle{
        id:backButton
        width: parent.width / 3
        height: parent.width / 8
        color: "grey"
        visible: searchBar.anchors.top === searchHeader.bottom ? false : true
        anchors{
            left:parent.left
            bottom: parent.bottom
        }
    }
    MouseArea{
        id:backButtonMouseArea
        anchors.fill: backButton
        onClicked: {
            page.state = 'base state'
            serieDelegate.opacity = 0
            searchBar.anchors.top = searchHeader.bottom

        }
    }
    Text {
        id: backButtonTxt
        text: qsTr("back")
        font.family: "Ubuntu"
        color: "#92FFFFFF"
        visible: backButton.visible === true ? true : false
        anchors.centerIn: backButtonMouseArea
    }
    WeatherDelegate{
        id: serieDelegate
        opacity: 0.0
        state: opacity === 0.0
        anchors.fill: parent
        Behavior on x { NumberAnimation { from:listView.currentItem.x; to: 0; duration: 1000 }}
        Behavior on height { NumberAnimation { from: listView.currentItem.height; to: page.height; duration: 1000 }}
    }

    ProgressDialog {
        id: progresDialog;
        visible: false;
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
    }

    states: [
        State {
            name: "Serie"
            PropertyChanges {
                target: serieDelegate
                opacity: 1.0
            }

            PropertyChanges {
                target: listView
                opacity: 0.0
            }
            AnchorChanges {
                target: searchBar
                anchors.top: parent.bottom
            }
        },
        State {
            name: "Loading"
            PropertyChanges {
                target: progresDialog
                visible: true
            }
        }
    ]

    transitions: [
        Transition {
            PropertyAnimation { properties: "opacity"; duration: 300}
            AnchorAnimation { duration: 300 }
        }
    ]
}

