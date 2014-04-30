import QtQuick 2.0
import QtQuick.Particles 2.0

Item {
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string image: img.source
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageColor: img.color
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property bool  imageCliped: img.clip
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property  int imageAlpha: img.alpha
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int emiterRate: emiter.emitRate
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int emiterLife: emiter.lifeSpan
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int emiterSize: emiter.size
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int  emiterSizeVariation: emiter.sizeVariation
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int emiterAngleVariation: emiterAngle.angleVariation
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int emiterMagnitude: emiterAngle.magnitude
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int emiterMaxEmitted: emiter.maximumEmitted
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property int emiterStartTime: emiter.startTime

    width: parent.width
    height: parent.height
        ImageParticle {
            id: img
            anchors.fill: parent ;
            system: particles ;
            source: image ;
            color:  imageColor
            clip: imageCliped
            alpha:  imageAlpha
        }
        ParticleSystem {
            id: particles
        }
        Emitter {
            id:emiter
            system: particles;
            anchors.fill: parent ;
            emitRate: emiterRate
            lifeSpan: emiterLife
            size: emiterSize
            sizeVariation: emiterSizeVariation
            velocity: AngleDirection {
                id: emiterAngle
                angleVariation: emiterAngleVariation
                magnitude: emiterMagnitude
            }
            maximumEmitted: emiterMaxEmitted
            startTime: emiterStartTime

        }
    }
