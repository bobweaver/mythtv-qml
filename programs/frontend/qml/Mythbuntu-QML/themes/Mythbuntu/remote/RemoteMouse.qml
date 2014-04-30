import QtQuick 2.0
import MythTv 1.0
import ZeroConf 1.0
Rectangle {
    id: container
    width: 600; height: 200
    color: "#88000000"
    border.width:  2
    border.color: "#77FFFFFF"
    property int startX: width / 2 + (rect.width / 2)
    property int startY: height / 2 + (rect.height / 2)

    Rectangle {
        id: rect
        width: 50; height: 50
        color: "red"
        radius: 360
        y: startY
        x: startX
        MouseArea {
            anchors.fill: parent
            drag.target: rect
            drag.axis: Drag.XAndYAxis
            drag.minimumX: 0
            drag.maximumX: container.width - rect.width
            drag.minimumY: 0
            drag.maximumY: container.height - rect.height
            onPositionChanged:{
                if (rect.y > startY){
                    console.log(Math.round(rect.y))
                    console.log("moving Down")
                    var down = Util.zeroConf(frontend.getFrontendString())+":6547/Frontend/SendAction?Action=MOUSEDOWN"
                    Remote.sendAction(down)
                }
                if (rect.y < startY){
                    console.log(Math.round(rect.y))
                    console.log("moving Up")
                    var up = Util.zeroConf(frontend.getFrontendString())+":6547/Frontend/SendAction?Action=MOUSEUP"
                    Remote.sendAction(up)
                }
                if (rect.x >  startX){
                    console.log(Math.round(rect.x))
                    console.log("moving right")
                    var right = Util.zeroConf(frontend.getFrontendString())+":6547/Frontend/SendAction?Action=MOUSERIGHT"
                    Remote.sendAction(right)
                }
                if (rect.x <  startX){
                    console.log(Math.round(rect.x))
                    console.log("moving left")
                    var left = Util.zeroConf(frontend.getFrontendString())+":6547/Frontend/SendAction?Action=MOUSELEFT"
                    Remote.sendAction(left)
                }
            }
            onReleased: {
                rect.x = startX
                rect.y =  startY
                var t = Util.zeroConf(frontend.getFrontendString())
                console.log(t)
            }
        }
    }
    BonjourFrontend{
        id:frontend
    }
}
