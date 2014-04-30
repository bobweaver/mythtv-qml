import QtQuick 2.0
Rectangle {
    /*!
      \preliminary
      The background Image that one wants to use for there Coverflow page
      */
    property string themeFile: themeLoader.source
    id: th
    width: parent.width
    height: parent.height
    MythActivityVideo {
        id: loading
        opacity: 0
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }
    Loader{
        id: themeLoader
        width: th.width
        height: th.height
        source: themeFile
        state: {
            if (status === Loader.Loading){
                loading.opacity = 1
                loading.running = true
            }
            if (status === Loader.Error)
                console.log(Error +  "\n this is a testing ")
            if (status === Loader.Ready)
                loading.opacity = 0
            loading.running = false
        }
    }
}
