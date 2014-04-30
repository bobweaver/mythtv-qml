import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import MythTv 1.0
Flickable {
    id: heads
    property int chanHeight
    property int selectedChannel
    clip: true
    Column {
        anchors.fill: parent
        Repeater {
            id: repeaterChan
            model: schedule
            delegate: ChannelIcon {
                anchors.left: parent.left
                anchors.right: parent.right
                height: chanHeight
                isSelected: selectedChannel == index
            }
        }
    }
    XmlListModel {
        id: schedule
        source:DataBase.ipAddress()+":"+DataBase.port()+"/Guide/GetProgramGuide?StartTime="+Util.now.toISOString()+"&EndTime="+Util.time2.toISOString()
        query: "//ProgramGuide/Channels/ChannelInfo"
        XmlRole {name: "ChanId"; query: "ChanId/string()"}
        XmlRole { name: "ChanNum"; query: "ChanNum/string()" }
        XmlRole { name: "CallSign"; query: "CallSign/string()" }
        XmlRole{name: "IconURL"; query: "IconURL/string()" }
        XmlRole{name: "ChannelName"; query: "ChannelName/string()" }
        //debug
        onStatusChanged: {
            if (status == XmlListModel.Ready){
                console.log("This is the count" + count)
            }
            if (status === XmlListModel.Loading){

            }
            if (status === XmlListModel.Error) console.log("Error: " + errorString + "\n \n \n " + schedule.source.toString());
        }
    }


}
