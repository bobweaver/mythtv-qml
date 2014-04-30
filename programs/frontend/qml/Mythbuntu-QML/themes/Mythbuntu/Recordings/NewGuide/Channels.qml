import QtQuick 2.0
import SqlDatabase 1.0
import QtQuick.Window 2.0
import MythTv 1.0
import "../"
Rectangle {
    id: root
    width: Screen.width
    height: Screen.height
    property string  chanId
    Repeater{
        id: view
        width: parent.width
        height: parent.height
        model: sqlModel
        delegate: GuideBroadCast{ }
        Component.onCompleted: {
            connection.createConnection();
            sqlModel.setQuery(
                        "SELECT * FROM `program`
                           WHERE `starttime`>=NOW()
                           && `chanid`="+"\""+chanId+"\""+" ORDER BY `program`.`starttime` ASC"
                        )
            console.log(view.count + " " + chanId)
        }
    }
    SqlConnection{
        id:connection
        source: "192.168.1.21"
        user: "mythtv"
        databaseType: "mysql"
        databaseName: "mythconverg"
        port: 3306
        password: "Sm1|3x1983"
    }
    SqlModel{
        id: sqlModel
    }
}
