import QtQuick 2.0
import Ubuntu.Components 0.1
import QtQuick.XmlListModel 2.0
import QtQuick.Particles 2.0
import QtQuick.LocalStorage 2.0
import  MythTv 1.0

MainView {
    objectName: "mainView"
    applicationName: "myth-phablet"
    width: units.gu(40)
    height: units.gu(71)
    anchorToKeyboard: false
    automaticOrientation: true
    PageStack {
        id: mainStack
        anchors {
            fill: parent
            Behavior on bottomMargin { AnchorAnimation{ duration: 175; easing.type: Easing.OutQuad } }
       }
    }

    Component.onCompleted: {
        Theme.name = "Ubuntu.Components.Themes.SuruGradient"
        mainStack.push(Qt.createComponent("UbuntuSDK.qml"))
        mainWindow.applicationReady()
    }



//    Tabs {
//        id: tabs
////        anchors.fill: parent
//        // First tab begins here
////        Tab {
////            objectName: "Home"
////            title: qsTr("Home")
////            page:
////                Loader {
////                id: homeLoader
////                anchors{
////                    top: parent.top
////                    topMargin: units.gu(9)
////                    bottom: parent.bottom
////                    left: parent.left
////                    right: parent.right
////                }
////                source:    Qt.resolvedUrl("UbuntuSDK/StartHere.qml")

////}

////        }
//        Tab{
//            objectName: "Videos"
//            title:qsTr("Videos")
//            page: Videos{ }
//        }

////        Tab{
////            objectName: "Remote"
////            title:qsTr("Remote")
////            page: Remote{
////                anchors{
////                    top: parent.top
////                    topMargin: units.gu(9)
////                    bottom: parent.bottom
////                    left: parent.left
////                    right: parent.right
////                }
////            }
////        }
//        Tab{
//            objectName: "Schedule"
//            title:qsTr("Schedule")
//            page: Schedule{ }
//        }
//        Tab{
//            objectName: "CaptureCards"
//            title:qsTr("CaptureCards")
//            page: CaptureCards{ }
//        }
//        Tab{
//            objectName: "SetUp"
//            title:qsTr("SetUp")
//            page: StartHere{ }
//        }
////        Tab{
////            objectName: "Theme"
////            title:qsTr("Theme")
////            page: ThemingSettings{
////                anchors{
////                    top: parent.top
////                    topMargin: 9
////                    bottom: parent.bottom
////                    left: parent.left
////                    right: parent.right
////                }
////            }
////        }
//    }
}
