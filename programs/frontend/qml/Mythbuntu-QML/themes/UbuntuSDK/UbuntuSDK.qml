import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem
import Ubuntu.Components.Popups 0.1 as Popups

Page {
    id: mainPage
    objectName: "contactListPage"
    title: i18n.tr("Videos")


    Component {
        id: dialog
        Popups.Dialog {
            id: dialogue
            title: i18n.tr("Error")
            text: i18n.tr("Fail to Load contacts")
            Button {
                text: "Cancel"
                gradient: UbuntuColors.greyGradient
                onClicked: PopupUtils.close(dialogue)
            }
        }
    }

    Videos{


        anchors {
            // This extra margin is necessary because the toolbar area overlaps the last item in the view
            // in the selection mode we remove it to avoid visual problems due the selection bar appears
            // inside of the listview
            bottomMargin: units.gu(2)
            fill: parent
        }
    }


    tools: ToolbarItems {
        id: toolbar
//        locked: contactList.isInSelectionMode
        ToolbarButton {
            action: Action {
                objectName: "selectButton"
                text: i18n.tr("Select")
//                iconSource: "artwork:/select.png"
//                onTriggered: contactList.startSelection()
            }
        }


        ToolbarButton {
            objectName: "Add"
            action: Action {
                text: i18n.tr("Add")
//                iconSource: "artwork:/add.png"
//                onTriggered: {
//                    var newContact = mainPage.createEmptyContact("")
//                    pageStack.push(Qt.resolvedUrl("../ContactEdit/ContactEditor.qml"),
//                                   {model: contactList.listModel, contact: newContact})
//                }
            }
        }
        ToolbarButton {
            objectName: "Import"
            action: Action {
                text: i18n.tr("import")
//                iconSource: "artwork:/add.png"
//                onTriggered: {
//                    var newContact = mainPage.createEmptyContact("")
//                    pageStack.push(Qt.resolvedUrl("../ContactEdit/ContactsImport.qml"))
//                }
            }
        }

    }

    Connections {
        target: pageStack


    }
}
