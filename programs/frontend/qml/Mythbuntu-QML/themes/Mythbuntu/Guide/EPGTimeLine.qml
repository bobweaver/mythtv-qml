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
import "../common"
import MythTv 1.0
Item {
    id: timeline
    property variant start
    property variant end
    property real hoursPerStep: 0.5
    property int hourSize
    property int stepsInScreen: Math.floor(width / steps.unit)
    property variant currentTime: currentTimeInTimeline()
    property real contentWidth
    property real contentX
    Image {
        id: previousArrow
        property bool shown: contentX > 0
        source: "../shared/leftarrow.png"
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        opacity: shown ? 1.0 : 0.0
    }

    Item {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: previousArrow.right
        anchors.right: nextArrow.left
        clip: true

        Flickable {
            anchors.fill: parent
            anchors.leftMargin: previousArrow.show ? - previousArrow.paintedWidth : 0
            anchors.rightMargin: nextArrow.shown ? - nextArrow.paintedWidth : 0

            contentWidth: timeline.contentWidth
            contentX: timeline.contentX
            clip: true

            Repeater {
                id: steps
                property int unit: timeline.hourSize * timeline.hoursPerStep
                property int total: Math.ceil((timeline.end - timeline.start) /
                                              Util.MS_PER_HOUR / timeline.hoursPerStep)
                model: steps.total
                delegate: Text {
                    anchors.top: (parent) ? parent.top : undefined
                    anchors.bottom: (parent) ? parent.bottom : undefined
                    x: index * steps.unit + 23
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize:  18
                    text: {
                        if (!timeline.start) return "wht"
                        var timestamp = new Date(timeline.start.getTime() +
                                                 index * Util.MS_PER_HOUR * timeline.hoursPerStep)
                        return Util.pad(String(timestamp.getHours()), 2, "0") + ":" +
                               Util.pad(String(timestamp.getMinutes()), 2, "0")
                    }
                }
            }
        }
    }

    Image {
        id: nextArrow
        property bool shown: contentX + timeline.width < contentWidth
        source: "../shared/rightarrow.png"
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        opacity: shown ? 1.0 : 0.0
    }

    /* Update the current time once per minute.
       FIXME: I don't think it's a big deal for now if it doesn't update at the
       start of every minute, but we should do that if possible */
    Timer {
        interval: 60 * 1000
        running: true
        repeat: true
        onTriggered: timeline.currentTime = currentTimeInTimeline()
    }
    function currentTimeInTimeline() {
        if (timeline.start) {
            var now = new Date()
            return new Date(now.getFullYear(), now.getMonth(),
                           now.getDate(), now.getHours(), now.getMinutes())
        } else return null
    }
}
