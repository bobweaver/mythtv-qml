import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Window 2.0
import  MythTv 1.0
import "common/qtlook.js" as Theming
import "common"
Item{
    id: root
    width: Screen.width
    height: Math.round(Screen.height)
    focus: pageLoader.opacity === 1 ?   false: true
     Keys.onUpPressed: menuView.decrementCurrentIndex()
     Keys.onDownPressed: menuView.incrementCurrentIndex()
     Keys.onReturnPressed: {
        pageLoader.source = menuView.model.get(menuView.currentIndex).loaderSource
        pageLoader.opacity = 1
    }
    Rectangle{
        id: starthere
        width: parent.width
        height: parent.height
        color: "#00000000"
        BorderImage {
            id: bkgRoot
            source: "background.png"
            width: parent.width
            height: parent.height
            BorderImage {
                id: watermark
                source: menuView.model.get(menuView.currentIndex).waterMark
                state: "base"
                anchors.fill: bkgRoot
                width: parent.width
                height: parent.height
//                onSourceChanged {
//               SequentialAnimation{
//               NumberAnimation{target: watermark;property: "opacity" ; from: 0;to:0; duration: 200  }
//               NumberAnimation{target: watermark; property: "opacity" ; from: .55;to:1; duration: 400; easing.type: Easing.OutQuint }
//           }
//           }
        }
            PathView {
                id: menuView
//                anchors.centerIn:  bkgRoot
                width: bkgRoot.width
                height: bkgRoot.height
                y: parent.height / 2
                model: HomeMenuModel{}
                delegate: menuDel
                path: Path {
                    startX:  800; startY: 400
                    PathAttribute{name: "iconScale" ; value: 1}
                    PathQuad { x: 750; y: 450 ; controlX: 750; controlY: 450   }

                    PathQuad { x: 700; y: 500 ; controlX: 700; controlY: 500   }

                    PathQuad { x: 600; y: 700 ; controlX: 600; controlY: 700   }
//                    PathAttribute{name: "iconScale" ; value: .8}

//                    PathQuad { x: bkgRoot.width  /2 ; y: 0; controlX: bkgRoot.width /2; controlY:0}// bkgRoot.height  }
//                    PathAttribute{name: "iconScale" ; value: 6}

//                    PathQuad { x: 400; y: 900 ; controlX: 400; controlY: 900   }
//                    PathAttribute{name: "iconScale" ; value: .4}

                    PathQuad { x: -400; y:350 ; controlX: -400; controlY: 350 }
//                    PathAttribute{name: "iconScale" ; value: .4}

//                    PathQuad { x: 0; y:0 ; controlX: 0; controlY: 0  }
//                    PathAttribute{name: "iconScale" ; value: .4}


//                    PathQuad { x: 400; y: 100 ; controlX: 500; controlY: 100  }
//                    PathAttribute{name: "iconScale" ; value: .4}

                    PathQuad { x: 600; y: 50 ; controlX: 600; controlY: 50  }
                    PathAttribute{name: "iconScale" ; value: 1}

                    //                    PathAttribute{name: "iconScale" ; value: .8}
                    PathQuad { x: 700; y: 150 ; controlX: 700; controlY: 150   }



                    //                    PathQuad { x: 500; y: 700 ; controlX: 500; controlY: 700   }

//                    PathQuad { x: 100; y: 100 ; controlX:  100; controlY:  100  }

//                    PathQuad { x:  bkgRoot.width /  2; y: bkgRoot.height / 2 ; controlX:   bkgRoot.width /  2 ; controlY: bkgRoot.height / 2  }

//                    PathQuad { x: bkgRoot.width  /2 ; y: 0; controlX: bkgRoot.width /2; controlY:0}// bkgRoot.height  }
//                    PathAttribute{name: "iconScale" ; value: 1}
//                    PathAttribute { name: "iconOpacity"; value: 1 }

//                    PathQuad { x:bkgRoot.width /  2 ; y: bkgRoot.height  / 1.04; controlX: bkgRoot.width / 2; controlY:bkgRoot.height / 1.06}

//                    PathAttribute { name: "iconScale"; value: .8 }
//                    PathAttribute { name: "iconOpacity"; value: .80}
//                    PathQuad { x:-bkgRoot.width * 5 ;  y:bkgRoot.height + bkgRoot.height  ; controlX: -bkgRoot.width *5; controlY:bkgRoot.height / 5 }
//                                        PathAttribute { name: "iconScale"; value: .5}
//                                        PathAttribute { name: "iconOpacity"; value: .80}

//                    PathQuad { x: bkgRoot.width / 5; y: 100 ; controlX: bkgRoot.width / 5; controlY: 100 }
//                                        PathAttribute { name: "iconScale"; value: .3 }
//                                        PathAttribute { name: "iconOpacity"; value: .80}

//                  PathQuad { x: bkgRoot.width / 2; y: bkgRoot.height/ 3; controlX: bkgRoot.width / 2; controlY: bkgRoot.height  / 3}
//                  PathAttribute { name: "iconScale"; value: .5 }
//                  PathAttribute { name: "iconOpacity"; value: 1}


                    //                    PathQuad { x:bkgRoot.width / 2 ;  y:bkgRoot.height /1.04; controlX: bkgRoot.width / 2; controlY:bkgRoot.height /1.04 }
//                    PathQuad { x:bkgRoot.width / 2 ;  y:bkgRoot.height /1.03; controlX: bkgRoot.width / 2; controlY:bkgRoot.height /1.03 }
//                    PathQuad { x:bkgRoot.width / 2 ;  y:bkgRoot.height /1.02; controlX: bkgRoot.width / 2; controlY:bkgRoot.height /1.02 }

//                    PathAttribute { name: "iconScale"; value: .7}
//                    PathAttribute { name: "iconOpacity"; value: .70 }
//                    PathQuad { x:bkgRoot.width / 2 ;  y:bkgRoot.height ; controlX: bkgRoot.width / 2; controlY:bkgRoot.height }
//                    PathQuad { x:bkgRoot.width / 2 ;  y:0 ; controlX: bkgRoot.width / 2; controlY:0 }
//                    PathQuad { x:bkgRoot.width / 2 ;  y:100 ; controlX: bkgRoot.width / 2; controlY:100 }

//                 PathQuad { x:bkgRoot.width * 4 ;  y:- 400 ; controlX: bkgRoot.width * 4; controlY: - 400}


                }

                Component{
                    id: menuDel
                    Item{
                        scale: PathView.iconScale
                        width: parent.width
                        height: parent.height /1.2
                        Column{
                            width: parent.width
                            height: parent.height /1.2
                            MythButton{
                                id: mediaLib
                                enabled: true
                                onStateChanged: {
                                    if (state === "hovered"){
                                        buttonColor = Qt.darker(buttonColor,1.2)
                                        scale = 1.2
                                        watermark.source = waterMark
                                    }
                                    if (state === "exited"){
                                     buttonColor = "#44FFFFFF"
                                     scale = 1
                                     watermark.source = waterMark
                                    }
                                }
                                radius: 80
                                height: focus === true ? parent.height / 7.7 : parent.height / 8
                                width: focus === true ? parent.width : parent.width / 1.7
                                name: text
                                buttonColor: "#44FFFFFF"
                                nameColor: "white"
                                nameItalic: false
                                nameBold: false
                                nameEffect: Text.Raised
                                nameEffectColor: "grey"
                                namepxSize:  Math.round(height / 1.7)
                                onButtonClick: {
                                    pageLoader.source =  loaderSource
                                    pageLoader.opacity = 1
                                }

                            }
                        }
                    }
                }
            }
            Text {
                id: time
                color: "grey"
                text: Qt.formatDateTime(new Date(),"ddd MMMM d yyyy , hh:mm ap")
                font.pixelSize:  parent.width / 30
                anchors{
                    bottom:parent.bottom
                    bottomMargin: bkgRoot.height / 20
                    right: parent.right
                    rightMargin: 12
                }
            }
        }
        Loader{
            id: pageLoader
            anchors.fill: parent
            source: ""
            opacity:  0
            Behavior on opacity {
                NumberAnimation {
                    target: pageLoader
                    property: "scale"
                    from:0
                    to:1
                    duration: 1000
                    easing.type: Easing.OutExpo
                }
            }
        }
    }
}
