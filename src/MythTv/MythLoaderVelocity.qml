import QtQuick 2.0
import QtQuick.Particles 2.0
Item {
    id: root
    height: parent.width
    width: parent.height
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageOne: sys1.source
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageOneColor: sys1.color
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageOneStepTwoColor: sys1stepOne.to
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageOneStepThreeColor: sys1steptwo.to
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageOneStepFourColor: sys1stepthree.to
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageToo: sys2.source
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageTooColor: sys2.color
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageTooStepTwoColor: sys2stepOne.to
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageTooStepThreeColor: sys2stepTwo.to
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageThree: sys3.source
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageThreeColor: sys3.color
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageThreeStepTwoColor: sys3stepOne.to

    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageFour: sys4.source
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageFourColor: sys4.color
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageFourStepTwoColor: sys4stepOne.to


    MouseArea {
        id: mouseArea
        anchors.fill: root
    }
    Text{text: "Vol" ; font.pixelSize: 40}

    ParticleSystem { id: sys1 }
    ImageParticle {
        system: sys1
        source: imageOne
        color: imageOneColor
        alpha: 0
        SequentialAnimation on color {
            loops: Animation.Infinite
            ColorAnimation {
                id: sys1stepOne
                from: imageOneColor
                to: imageOneStepTwoColor
                duration: 1000
            }
            ColorAnimation {
                id: sys1steptwo
                from: imageOneStepTwoColor
                to: imageOneStepThreeColor
                duration: 2000
            }
            ColorAnimation {
                id: sys1stepthree
                from: imageOneStepThreeColor
                to: imageOneStepFourColor
                duration: 2000
            }
            ColorAnimation {
                from: imageOneStepTwoColor
                to: imageOneColor
                duration: 2000
            }
        }
        colorVariation: 0.3
    }

    Emitter {
        id: trailsNormal
        system: sys1

        emitRate: 500
        lifeSpan: 2000

        y: mouseArea.pressed ? mouseArea.mouseY : circle.cy
        x: mouseArea.pressed ? mouseArea.mouseX : circle.cx

        velocity: PointDirection {xVariation: 4; yVariation: 4;}
        acceleration: PointDirection {xVariation: 10; yVariation: 10;}
        velocityFromMovement: 8

        size: 8
        sizeVariation: 4
    }





    ParticleSystem { id: sys2 }
    ImageParticle {
        color: imageTooColor
        system: sys2
        alpha: 0
        SequentialAnimation on color {
            loops: Animation.Infinite
            ColorAnimation {
                id: sys2stepOne
                from: imageTooColor
                to: imageTooStepTwoColor
                duration: 1000
            }
            ColorAnimation {
               id: sys2stepTwo
                from: imageTooStepTwoColor
                to:  imageTooStepThreeColor
                duration: 2000
            }
        }
        colorVariation: 0.5
        source: imageTwo
    }
    Emitter {
        id: trailsStars
        system: sys2

        emitRate: 100
        lifeSpan: 2200


        y: mouseArea.pressed ? mouseArea.mouseY : circle.cy
        x: mouseArea.pressed ? mouseArea.mouseX : circle.cx

        velocity: PointDirection {xVariation: 4; yVariation: 4;}
        acceleration: PointDirection {xVariation: 10; yVariation: 10;}
        velocityFromMovement: 8

        size: 22
        sizeVariation: 4
    }









    ParticleSystem { id: sys3; }
    ImageParticle {
        source: imageThree
        system: sys3
        color: imageThreeColor
        alpha: 0
        SequentialAnimation on color {
            loops: Animation.Infinite
            ColorAnimation {
                id:sys3stepOne
                from: imageThreeColor
                to: imageThreeStepTwoColor
                duration: 2000
            }
            ColorAnimation {
                id: sys3stepTwo
                from: imageThreeStepTwoColor
                to: imageThreeColor
                duration: 2000
            }
        }

        colorVariation: 0.2

    }
    Emitter {
        id: trailsNormal2
        system: sys3

        emitRate: 300
        lifeSpan: 2000

        y: mouseArea.pressed ? mouseArea.mouseY : circle2.cy
        x: mouseArea.pressed ? mouseArea.mouseX : circle2.cx

        velocityFromMovement: 16

        velocity: PointDirection {xVariation: 4; yVariation: 4;}
        acceleration: PointDirection {xVariation: 10; yVariation: 10;}

        size: 12
        sizeVariation: 4
    }




    ParticleSystem { id: sys4; }
    ImageParticle {
        system: sys4
        source: imageFour
        color: imageFourColor
        alpha: 0
        SequentialAnimation on color {
            loops: Animation.Infinite
            ColorAnimation {
                id: sys4stepOne
                from: imageFourColor
                to:  imageFourStepTwoColor
                duration: 2000
            }
            ColorAnimation {
                from:  imageFourStepTwoColor
                to: imageFourColor
                duration: 2000
            }
        }

        colorVariation: 0.5
    }
    Emitter {
        id: trailsStars2
        system: sys4

        emitRate: 50
        lifeSpan: 2200


        y: mouseArea.pressed ? mouseArea.mouseY : circle2.cy
        x: mouseArea.pressed ? mouseArea.mouseX : circle2.cx

        velocityFromMovement: 16
        velocity: PointDirection {xVariation: 2; yVariation: 2;}
        acceleration: PointDirection {xVariation: 10; yVariation: 10;}

        size: 22
        sizeVariation: 4
    }



    Item {
        id: circle
        //anchors.fill: parent
        property real radius: 0
        property real dx: root.width / 2
        property real dy: root.height / 2
        property real cx: radius * Math.sin(percent*6.283185307179) + dx
        property real cy: radius * Math.cos(percent*6.283185307179) + dy
        property real percent: 0

        SequentialAnimation on percent {
            loops: Animation.Infinite
            running: true
            NumberAnimation {
            duration: 1000
            from: 1
            to: 0
            loops: 8
            }
            NumberAnimation {
            duration: 1000
            from: 0
            to: 1
            loops: 8
            }

        }

        SequentialAnimation on radius {
            loops: Animation.Infinite
            running: true
            NumberAnimation {
                duration: 4000
                from: 0
                to: 100
            }
            NumberAnimation {
                duration: 4000
                from: 100
                to: 0
            }
        }
    }

    Item {
        id: circle3
        property real radius: 100
        property real dx: root.width / 2
        property real dy: root.height / 2
        property real cx: radius * Math.sin(percent*6.283185307179) + dx
        property real cy: radius * Math.cos(percent*6.283185307179) + dy
        property real percent: 0

        SequentialAnimation on percent {
            loops: Animation.Infinite
            running: true
            NumberAnimation { from: 0.0; to: 1 ; duration: 10000;  }
        }
    }

    Item {
        id: circle2
        property real radius: 30
        property real dx: circle3.cx
        property real dy: circle3.cy
        property real cx: radius * Math.sin(percent*6.283185307179) + dx
        property real cy: radius * Math.cos(percent*6.283185307179) + dy
        property real percent: 0

        SequentialAnimation on percent {
            loops: Animation.Infinite
            running: true
            NumberAnimation { from: 0.0; to: 1 ; duration: 1000; }
        }
    }

}
