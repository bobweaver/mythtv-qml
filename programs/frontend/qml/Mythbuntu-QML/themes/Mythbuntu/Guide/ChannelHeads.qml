/*
 * This file is part of unity-2d
 *
 * Copyright 2010-2011 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import MythTv 1.0
Flickable {
    id: heads
//    property variant channels
    property int channelHeight
    property int selectedChannel
    clip: true
    Column {
        anchors.fill: parent
        Repeater {
            id: repeaterChan
            model: schedule
            delegate: ChannelHead {
                anchors.left: parent.left
                anchors.right: parent.right
                height: channelHeight
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
