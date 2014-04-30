import QtQuick 2.0
ListModel {
    ListElement {
        markerId: "setup"
        text: "Set Up Wizard"
        loaderSource:"Settings/SetupWizard.qml"
        waterMark: "watermark/tweak.png"
        navUp: "media"
        navDown: "general"
    }
     ListElement {
         markerId: "general"
         text: "General"
        loaderSource: "Settings/GeneralSettings.qml"
        waterMark: "watermark/settings.png"
        navUp: "setup"
        navDown: "theme"
     }
     ListElement {
         markerId: "theme"
         text:"Theme Chooser"
        loaderSource: "Settings/ThemeChooser.qml"
        waterMark: "watermark/themes.png"
        navUp: "general"
        navDown: "media"
     }
     ListElement {
         markerId: "media"
         text: "Media Settings"
         loaderSource: "Guide/EPG.qml"
         waterMark: "watermark/dvd.png"
         navUp: "theme"
         navDown: "setup"
     }
   }
