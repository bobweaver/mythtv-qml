import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import  "dbUtil.js" as DataBase
import "Util.js" as Util
BorderImage {
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property bool pressed: false
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property bool enabled: true
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias mouseOver: themeMouseArea.containsMouse
    source: ""
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5
    id: themeRec
    width: parent.buttonWidth
    height: parent.buttonHeight
    MouseArea{
        id:themeMouseArea
        anchors.fill: themeRec
        enabled: parent.enabled
        hoverEnabled: parent.enabled
        onEntered: {}
        onExited: {}
        state: {
            if (activeFocus && themeMouseArea.containsMouse)
                return "selected-hovered"
            else if(pressed || themeMouseArea.pressed)
                return "pressed"
            else if(activeFocus)
                return "selected"
            else if(themeMouseArea.containsMouse)
                return "hovered"
            else
                return "default"
        }
        onClicked: {
            function getname() {
                return  themeName.text.toString()
            }
            function truncateThemeTable(){
                var db = DataBase.themeDatabase();
                db.transaction(
                            function(tx){
                                tx.executeSql('DELETE FROM mythbuntu_theming_table WHERE WD_1=1')
                            }
                            )
            }
            function insertIntoThemingTable() {
                var db = DataBase.themeDatabase();
                db.transaction(
                            function(tx) {
                                tx.executeSql('INSERT INTO mythbuntu_theming_table VALUES(?, ?)', ['1', getname()]);
                            }
                            )
            }
            DataBase.createInitIThemingTable()
            truncateThemeTable()
            insertIntoThemingTable()
            //                    console.log("Theme   is  " + DataBase.theme())
        }
    }
    Image {
        id: themeIcon
        source: ""
        sourceSize.width: width
        sourceSize.height: height
        width: parent.width / 4
        height: parent.height / 1.2
        anchors.verticalCenter: parent.verticalCenter

    }
    Text {
        id: themeName
        text: ""
        anchors.centerIn: themeMouseArea

    }
    //    }
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias buttonBaseBackground: themeRec.source
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property bool buttonSmooth: themeRec.smooth
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias buttonStatus: themeRec.status
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias buttonCache: themeRec.cache
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias buttonMirror: themeRec.mirror
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias buttonWidth: themeRec.width
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias buttonHeight: themeRec.height
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias  mouseState: themeMouseArea.state

    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias  iconSource: themeIcon.source
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias  iconShown: themeIcon.opacity
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias iconX: themeIcon.x
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias iconY: themeIcon.y
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias  iconStatus: themeIcon.status
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias  name: themeName.text
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias  textpxSize: themeName.font.pixelSize
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias textEffect: themeName.style
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias textEffectColor: themeName.styleColor
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias textWraping: themeName.wrapMode
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias textMaxLineCount: themeName.maximumLineCount
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property bool textBold: themeName.font.bold
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias textFont: themeName.font
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias textWeight: themeName.font.weight
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property bool textItalic: themeName.font.italic
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias textLetterSpacing: themeName.font.letterSpacing
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property bool  textUnderLined: themeName.font.underline
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property alias   textColor : themeName.color
}
