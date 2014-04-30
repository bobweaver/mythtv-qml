import QtQuick 2.0
/*!
    \qmltype BackButton
    \inqmlmodule MythTv 1.0
    \ingroup mythtv
    \brief The BackButton is used for navagation of menus.  One can set the Image on which they would like to use.

    Example:
    \qml
    Item {
    BackButton{
        id: foo
        backButtonWidth: parent.width / 6
        backButtionHeight:  parent.width / 6
        iconSource: "shared/leftarrow.png"
        backButtonsmooth: false
        MouseArea{
            anchors.fill: foo
            onClicked:{
              DO something here.
            }
        }
    }
    }
    \endqml
*/
Rectangle{
    id: root
    width: parent.backButtonWidth
    height: parent.backButtonHeight
    color: "#00000000"
    Image {
        id: backbutton
        sourceSize.width:  parent.width
        sourceSize.height:  parent.height
        source:  parent.iconSource
        smooth: parent.backButtonsmooth
    }

    /*!
      \preliminary
      The width of the Back Button
      */
    property alias backButtonWidth: root.width
    /*!
      \preliminary
      The height of the Back Button
      */
    property alias backButtionHeight: root.height
    /*!
      \preliminary
      The source in which you want to use for a icon. Inhert of Image source
      */
    property alias  iconSource: backbutton.source
    /*!
      \preliminary
      weither or not the icon should be smooth or not. When using smooth be careful because
      the more that you use it the more you will take up resources. But the more that you use it
      the more detailed the icon will be.
      */
    property bool backButtonsmooth: backbutton.smooth
}

