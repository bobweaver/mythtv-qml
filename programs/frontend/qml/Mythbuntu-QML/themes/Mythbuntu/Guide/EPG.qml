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
import MythTv 1.0
import "../common"
FocusScope {
    id: epg
    property int hourSize: 610
    property int channelHeight: 80
    property int timelineHeight: 32

    Rectangle{
        id: channels
        anchors.fill: parent
//        path: "unity-2d:shell/dash/epgdata/channels"
        color:"blue"
    }

    Item {
        id: filters
        anchors.top: parent.top
        anchors.topMargin: 35
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 25
        height: titleText.paintedHeight

        Text {
            id: titleText
            anchors.left: parent.left
            anchors.leftMargin: 15
            text: "TV Guide"
//            fontSize: "large"
        }

        Text {
            anchors.centerIn: parent
            color: "white"
            text:{
                function updateTime(){
                    var nw = new Date()
                        var s = Qt.formatDateTime(nw,"yyyy-mm-ddThh:mm:ssZ")
                    var q = Util.fromIso8601(s) //"All Channels"
                        var e  = Qt.formatDateTime(s,"ddd MMMM d yyyy hh:mm:ss");
                        var td = new Date(e)
                        return td
                }
//                updateTime().toString();
                    var mw = new Date();
              updateTime(mw)
//                    var e  = Qt.formatDateTime(nw,"ddd MMMM d yyyy hh:mm:ss");
//                    var td = new Date(e);
//                    return "\t"+ td
//                }
//                d(mw)
        }
        }


        Text {
            anchors.right: parent.right
            anchors.rightMargin: 230
            text: "Today"
//            fontSize: "large"
        }
    }

    EPGTimeLine {
        id: timeline
        anchors.top: filters.bottom
        anchors.topMargin: 40
        anchors.left: channelHeads.right
        anchors.right: parent.right
        anchors.rightMargin: 25
        height: epg.timelineHeight

        hourSize: epg.hourSize
        contentX: mainScrollArea.contentX
        contentWidth: mainScrollArea.contentWidth
    }

    Rectangle {
        id: divider
        anchors.top: timeline.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.rightMargin: 25
        height: 2
        opacity: 0.2
    }

    ChannelHeads {
        id: channelHeads
        anchors.top: divider.bottom
        anchors.topMargin: 2
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        width: 200

        contentHeight: mainScrollArea.contentHeight
        contentY: mainScrollArea.contentY

//        channels: channels
        channelHeight: epg.channelHeight
        selectedChannel: (epg.activeFocus) ? mainScrollArea.selectedChannel : -1
    }

    EPGScrollArea {
        id: mainScrollArea
        anchors.top: divider.bottom
        anchors.topMargin: 2
        anchors.left: channelHeads.right
        anchors.right: parent.right
        anchors.rightMargin: 25
        anchors.bottom: channelHeads.bottom
        focus: true

        channelHeight: epg.channelHeight
//        channels: channels

        hourSize: epg.hourSize
        currentTime: timeline.currentTime
        startOfTimeline: timeline.start
        endOfTimeline: timeline.end

        onNewStartOfTimeline: timeline.start = newStart
        onNewEndOfTimeline: timeline.end = newEnd

        selectionTracker: floatingSelection
    }

    Rectangle {
        id: timebar
        width: 2
        color: "white"
        anchors.top: divider.bottom
        anchors.bottom: mainScrollArea.bottom
        x: mainScrollArea.mapToItem(epg, (timeline.currentTime - timeline.start) * timeline.hourSize
                                          / Util.MS_PER_HOUR - mainScrollArea.contentX, 0).x
        opacity: (x <= mainScrollArea.x || x >= mainScrollArea.x + mainScrollArea.width) ? 0.0 : 0.2
    }

    /* The selected item needs to have a glow around it. This can't be done if the selection is inside
       of the mainScrollArea Flickable, since it clips, so any item in contact with the margins will
       have its glow clipped.
       Therefore we are keeping the selection here, and binding its position so that it follows
       the currently selected item.

       To do this we first pass the floatingSelection object down through to the Channel objects,
       which will update its "follow" property with whatever item is currently selected.
       Then we bind its position to the translated coordinates of the item, and set a few other
       position-dependent properties that will allow to calculate the proper size of the selection.
    */
    SelectedBroadcast {
        id: floatingSelection

        x: (follow) ? mainScrollArea.x + Math.max(follow.x, mainScrollArea.contentX)
                      - mainScrollArea.contentX : 0
        y: (follow) ? mainScrollArea.y + Math.max(follow.parentChannelItem.y, mainScrollArea.contentY)
                      - mainScrollArea.contentY : 0
        distanceToEdge: (follow) ? mainScrollArea.width - Math.max(follow.x - mainScrollArea.contentX, 0) : 0
        containedWidth: (follow) ? Math.min(follow.width + Math.min(follow.x - mainScrollArea.contentX, 0),
                                            mainScrollArea.width) : 0
        opacity: (epg.activeFocus) ? 1.0 : 0.0
    }

    /* Properties needed for compliance with the pageLoader in the Dash */

//    property variant model: PageModel {
//        /* model.searchQuery is copied over to all lenses globalSearchQuery property */
//        onSearchQueryChanged: {
//            for (var i = 0; i < dash.lenses.rowCount(); i++) {
//                dash.lenses.get(i).globalSearchQuery = searchQuery
//            }
//        }
//    }
    /* Used by dash.qml to bind to declarativeView "expanded" property */
//    property bool expanded: false

//    Keys.onReturnPressed: shell.play("file:///home/ubuntu/Videos/unity/local/epg/epg.mkv")

}
