import QtQuick 2.0
import QtQuick.Particles 2.0
Item {
    width: parent.width
    height: parent.height
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string name: banner.text
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageOne: particalImage.source
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageOneColor: particalImage.color
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageTwo: shapeImage.source
    Text{
        id: banner
        text: name
        font.pixelSize: 40}
    ParticleSystem {
        width: 300
        height: 300
        anchors.centerIn: parent
        ImageParticle {
            id: particalImage
            source: imageOne
            z: 2
            anchors.fill: parent
            color:  imageOneColor
            alpha: 0
            colorVariation: 0.1
        }
        Emitter {
            anchors.fill: parent
            emitRate: 6000
            lifeSpan: 720
            size: 10
            shape: MaskShape {
                id: shapeImage
                source: imageTwo
            }
        }
    }
}
