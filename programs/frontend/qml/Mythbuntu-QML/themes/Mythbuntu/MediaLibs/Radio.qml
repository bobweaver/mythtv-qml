import QtQuick 2.0
import QtMultimedia 5.0
import MythTv 1.0
Rectangle {
    width: parent.width
    height: parent.height
    color: "green"
    Radio {
        id: radio
        band: Radio.FM
    volume:  99
    }

    MythButton{
        x: 0; y: 0
        height: parent.height
        width: parent.width / 2
        name: "Scan Down"
        mythButtonColor: "#88FFFFFF"
        onButtonClick:  radio.scanDown()
    }

    MythButton {
        x: parent.width / 2; y: 0
        height: parent.height
        width: parent.width / 2
        name: "Scan Down"
        mythButtonColor: "#88000000"
        onButtonClick: {
 console.log(radio.state
             + "\n " + radio.signalStrength
             + "\n" + radio.stereoMode
             )

            radio.searchAllStations()
}
        }
}
