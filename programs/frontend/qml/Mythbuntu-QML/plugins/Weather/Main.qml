import QtQuick 2.0
import QtQuick.Window 2.0
//import "common" as Con
FocusScope{
    id:shellaroo
  width: Screen.width
  height: Screen.height
 Rectangle{
     width: maxWidth.text
     height:  maxHeight.text
     color: "grey"
     StartHere{
      id:startHereM
   anchors.fill: parent
  }

  Loader{
   id:weatherloader
   source: ""
   width: shellaroo.width
   height:   shellaroo.height - bottomBar.height
   opacity: 0
   y: Math.round(-parent.height)
      Behavior on opacity {
       NumberAnimation{
        duration: 2200
        easing.type: Easing.OutQuint
       }
      }
      Behavior on y{
       NumberAnimation{
        duration:  1500
        easing.type: Easing.OutBack
       }
      }
  }


  BottomBar{
      id: bottomBar
          height:    shellaroo.height
          width: shellaroo.width
          anchors.bottom: parent.bottom


  }

  Text {
      id:maxWidth
      text: Screen.width
      color:"transparent"
  }
  Text {
      id: maxHeight
      text: Screen.height
      color: "transparent"
  }

}
}
