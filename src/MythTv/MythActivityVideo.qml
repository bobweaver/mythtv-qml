import QtQuick 2.0
import QtQuick.Particles 2.0

ParticleSystem {
    id: sys
    width: parent.width
    height: parent.height
    running: true
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string imageSource: image.source
    property real petalLength: 180
    property real petalRotation: 0
    NumberAnimation on petalRotation {
        from: 0;
        to: 720;
        loops: -1;
        running: true
        duration: 24000
        easing.type: Easing.OutBounce
    }
    function convert(a) {return a*(Math.PI/180);}
    Emitter {
        lifeSpan: 2000
        emitRate: 120
        size: 10
        anchors.centerIn: parent
        onEmitParticles: {
            for (var i=0; i<particles.length; i++) {
                var particle = particles[i];
                particle.startSize = Math.max(02,Math.min(520,Math.tan(particle.t/2)*24));
                var theta = Math.floor(Math.random() * 6.0);
                particle.red = theta == 0 || theta == 1 || theta == 2 ? 0.2 : 1;
                particle.green = theta == 2 || theta == 3 || theta == 4 ? 0.2 : 1;
                particle.blue = theta == 4 || theta == 5 || theta == 0 ? 0.2 : 1;
                theta /= 6.0;
                theta *= 2.0*Math.PI;
                theta += sys.convert(sys.petalRotation);//Convert from degrees to radians
                particle.initialVX = petalLength * Math.cos(theta);
                particle.initialVY = petalLength * Math.sin(theta);
                particle.initialAX = particle.initialVX * -0.2;
                particle.initialAY = particle.initialVY * -0.8;
            }
        }

    }
    ImageParticle {
        id: image
        source: imageSource
        alpha: 0.0
    }
}
