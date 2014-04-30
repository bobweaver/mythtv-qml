import QtQuick 2.0
Item {
    id: progressbar
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int minimum: 0
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int maximum: 100
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int value: 0
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property color color
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int margins: border.radius
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property color borderColor: border.color
    width: 250; height: 23
    clip: true
    Rectangle {
        id: border
        anchors.fill: parent
        anchors.bottomMargin: 1
        anchors.rightMargin: 1
        color:  "transparent"
        border.width: 1
        border.color: parent.borderColor
        radius: parent.margins
    }
    Rectangle {
        id: highlight
        property int widthDest: ( ( progressbar.width * ( value - minimum ) ) / ( maximum - minimum ) - 4 )
        width: highlight.widthDest
        Behavior on width {
            SmoothedAnimation {
                velocity: 1200;
                easing.type: Easing.OutInBack
            }
        }
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
            margins: 2
        }
        color: parent.color
    }
}
