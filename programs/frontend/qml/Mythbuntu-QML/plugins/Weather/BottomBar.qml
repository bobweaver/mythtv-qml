import QtQuick 2.0
import "../../common"
Item{
    width: shellaroo.width
    height:   shellaroo.height /10
    Row{
        width: parent.width
        height:   parent.height /10
        MythButton{
            id : home
            width:  parent.width / 3
            height:    parent.height / 10
            onButtonClick:{
                weatherloader.source = "Home.qml"
                weatherloader.y = 0
                weatherloader.opacity = 1
                startHereM.opacity = 0
                startHereM.x = parent.width * 3
            }
                buttonColor: "green"
        }
        MythButton{
            id : startHere
            width:  parent.width / 3
            height:    parent.height / 10
            radius: 20
            onButtonClick:{
                    startHereM.opacity = 1
                    startHereM.x = 0
                    weatherloader.y = (- shellaroo.height * 2)
                    weatherloader.opacity = 0
                console.log(state)
            }
                buttonColor: "brown"
        }
        MythButton{
            id : fiveDay
            width:  parent.width / 3
            height:    parent.height / 10
            onButtonClick:{
                weatherloader.source = "FiveDay.qml"
                weatherloader.y = 0
                weatherloader.opacity = 1
                startHereM.opacity = 0
            }
            buttonColor: "blue"
        }
    }
}
