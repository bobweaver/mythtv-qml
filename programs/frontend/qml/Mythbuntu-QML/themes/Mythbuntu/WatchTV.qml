import QtQuick 2.0
import MythSystemTools 1.0
Rectangle {
    width: 100
    height: 62
    color: "transparent"
    Text {
        id: fds
        text: qsTr("Opening TV Please Wait")
    }
    Component.onCompleted: {
        la.launchScript("mythavtest")
    }
    ScriptLauncher{
     id: la
    }
}
