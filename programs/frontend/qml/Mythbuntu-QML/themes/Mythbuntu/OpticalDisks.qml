import QtQuick 2.0
import "common"
import MythTv 1.0
import QtQuick.LocalStorage 2.0
//import "../../common/dbUtil.js" as DataBase
//import "../../common/Util.js" as Util
Image {
    id: testingRoot
    width:parent.width
    height: parent.height
    source: "background.png"
                Text{
                    id:textTest
                    width:testingRoot.width / 4
                    height: testingRoot.height / 4
                    color: "grey"
                    text:""
                    anchors.centerIn: testingRoot
    }
Component.onCompleted: {
    textTest.text =  ip + "\n" + Util.getFrontEnd() + "\n" +Util.getBackEnd()
}
}





