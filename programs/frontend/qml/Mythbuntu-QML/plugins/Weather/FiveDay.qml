import QtQuick 2.0
import QtQuick.Window 2.0
import "examples"
Item{
    id:fiveDayItem
    width: parent.width
    height: parent.height
    GridView {
        id: fiveDayView
        width: parent.width
        cacheBuffer: 5000
        anchors{
            top: parent.top;
            left:parent.left
            bottom: parent.bottom
        }
        contentHeight:{  parent.height }
        contentWidth:{  parent.width }
        cellHeight:{  parent.height / 17}
        cellWidth:{  parent.width }
        clip: true
        model: FiveDayModel{
            id: feedModel;
        }
        delegate: FiveDayDelegate {
            id:feedDelegate
            opacity:{
                var checkmeOut = (timeFrom.substring(0,timeFrom.lastIndexOf("T")))
                var today = (Qt.formatDate(new Date(), "dd"))
                var cut2 = (period.substring())
                if (checkmeOut.substring(checkmeOut.lastIndexOf("-")+1) === today)
                    0
                else if (cut2 === "1" || cut2 === "2" || cut2 === "3")
                    0
                else
                    1
            }
        }
    }
//    Rectangle{
//        width: parent.width
//        height: parent.height //* 2.2
//        color: "#C7C7C7"
//        opacity: .33
//        x: fiveDaySlider.state === "Shown" ? 0 : fiveDaySlider.width*2
//        y :fiveDaySlider.state === "Shown" ?  100  :   fiveDaySlider.width*2
//        Behavior on x { NumberAnimation {duration: 1200 ;easing.type: Easing.OutBack}}
//        Behavior on y { NumberAnimation {duration: 1200 ;easing.type: Easing.OutBack}}
//    }
//   FiveDaySlider{
//            id: fiveDaySlider
//            opacity: 1
//            y: state === "Shown" ? 0 : tabs.width * 2
//            state: "Hidden"
//            Behavior on y { NumberAnimation {duration: 1200 ;easing.type: Easing.OutBack}}
//        }
}

