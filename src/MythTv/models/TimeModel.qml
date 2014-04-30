import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import  QtQuick.LocalStorage 2.0
import  "../dbUtil.js" as DataBase

Item {
    id:timeItem
    property variant timeaRoo: null
    XmlListModel{
        id: offSet
        source: DataBase.ipAddress()+":"+DataBase.port()+"/Myth/GetTimeZone"
        query: "/TimeZoneInfo"
        XmlRole{name: "UTCOffset" ; query: "UTCOffset/string()"}
        onStatusChanged: {
            if (status === XmlListModel.Ready){
                if (count > 0 )
                    timeItem.timeaRoo =  offSet.get(0).UTCOffset
                DataBase.createtimeOffSetTable()
                DataBase.truncateTimeOffSetAddess()
                function insertIntoTimeTable() {
                    var db = DataBase.timeDatabase();
                    db.transaction(
                                function(tx) {
                                    tx.executeSql('INSERT INTO mythbuntu_time_offset_table VALUES(?, ?)', ['1', offSet.get(0).UTCOffset ]);
                                }
                                )
                }
                insertIntoTimeTable()
            }
        }
    }
}
