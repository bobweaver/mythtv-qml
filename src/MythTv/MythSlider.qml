/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt Mobility Components.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0

Item {
    id: slider;
    width: 120;
    height: 16
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string  volButtonTopG: handleTopGardent.color
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string  volButtonBottomG: handleBottomGardent.color
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string  bkTopG: bkL.color
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string  bkBottomG: bkR.color

    // value is read/write
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property real value: 1
    onValueChanged: updatePos();
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property real maximum: 1
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property real minimum: 0
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int xMax: width - handle.width - 4
    onXMaxChanged: updatePos();
    onMinimumChanged: updatePos();

    function updatePos() {
        if (maximum > minimum) {
            var pos = 2 + (value - minimum) * slider.xMax / (maximum - minimum);
            pos = Math.min(pos, width - handle.width - 2);
            pos = Math.max(pos, 2);
            handle.x = pos;
        } else {
            handle.x = 2;
        }
    }

    Rectangle {
        anchors.fill: parent
        border.color: "white";
        border.width: 0;
        radius: 8
        gradient: Gradient {
            GradientStop {
                id:bkL; position: 0.0; color: bkBottomG }
            GradientStop {
          id: bkR ;     position: 1.0; color: bkTopG }
        }
    }

    Rectangle {
        id: handle;
        smooth: true
        y: 2;
        width: 30;
        height: slider.height-4;
        radius: 6
        gradient: Gradient {
            GradientStop {
                id: handleBottomGardent ;position: 0.0; color:volButtonBottomG  }
            GradientStop {
                id: handleTopGardent ; position: 1.0; color: volButtonTopG}
        }

        MouseArea {
            id: mouse
            anchors.fill: parent; drag.target: parent
            drag.axis: Drag.XAxis; drag.minimumX: 2; drag.maximumX: slider.xMax+2
            onPositionChanged: { value = (maximum - minimum) * (handle.x-2) / slider.xMax + minimum; }
        }
    }
}

