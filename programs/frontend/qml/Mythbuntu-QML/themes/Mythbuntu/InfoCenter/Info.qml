import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
//import "../../../common/dbUtil.js" as DataBase
//import "../../../common/Util.js" as Util
import "../common"
import MythTv 1.0
import "models"
Image{
    id: root
    width: parent.width
    height: parent.height
    source: "../background.png"


            ListView{
                id: versionInfo
                model: versions
                delegate: Item{
                    width: root.width
                    height: root.height /2
                    Column{
                        width:  root.width
                        height: root.height /2
                        spacing: 4
                    Rectangle{
                        id: branchRec
                        width:  root.width
                        height: root.height / 10
                        color: "#64C7C7C7"
                    Text {
                        id: branchTxt
                        font.pixelSize: 42
                        color: "lightblue"
                        text:"Myth Branch Version: \t "+ Branch
                    anchors.centerIn: branchRec
                    }
                }

                    Rectangle{
                        id: versionRec
                        width:  root.width
                        height: root.height / 10
                        color: "#64C7C7C7"
                    Text {
                        id: versionTxt
                        font.pixelSize: 42
                        color: "lightblue"
                        text:"Myth Backend Version: \t "+ Version
                    anchors.centerIn: versionRec
                    }
                }
                    Rectangle{
                        id: protocolRec
                        width:  root.width
                        height: root.height / 10
                        color: "#64C7C7C7"
                    Text {
                        id: protocolTxt
                        font.pixelSize: 42
                        color: "lightblue"
                        text:"Myth Protocol Version: \t "+ Protocol
                    anchors.centerIn: protocolRec
                    }
                }


                    Rectangle{
                        id: schemaRec
                        width:  root.width
                        height: root.height / 10
                        color: "#64C7C7C7"
                    Text {
                        id: schemaTxt
                        font.pixelSize: 42
                        color: "lightblue"
                        text:"Myth Schema Version: \t "+ Schema
                    anchors.centerIn: schemaRec
                    }
                }
                    MythDBInfo{
                        width:  parent.width
                        height:     parent.height
//                    anchors.top: versionInfo.bottom
                    }

}

                }//Item
}


    XmlListModel{
        id: versions
        source: DataBase.ipAddress() + ":"+ DataBase.port() +"/Myth/GetConnectionInfo"
        query: "//ConnectionInfo/Version"
        XmlRole{name: "Version"; query: "Version/string()"  }
        XmlRole{name: "Branch"; query: "Branch/string()"  }
        XmlRole{name: "Protocol"; query: "Protocol/string()"  }
        XmlRole{name: "Binary"; query: "Binary/string()"  }
        XmlRole{name: "Schema"; query: "Schema/string()"  }

    }

}
