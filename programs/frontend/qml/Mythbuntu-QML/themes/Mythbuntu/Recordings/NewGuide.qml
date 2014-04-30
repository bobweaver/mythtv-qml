import QtQuick 2.0
import SqlDatabase 1.0
import QtQuick.Window 2.0
import MythTv 1.0
Flickable{
    id: root
    width: scheduleRoot.width
    height: scheduleRoot.height
    flickableDirection: Flickable.HorizontalFlick
    contentWidth: scheduleRoot.width * 12
    interactive: true
    boundsBehavior: Flickable.StopAtBounds

    property string  chanId
    ListView{
        id: view
        width: parent.width
        height: parent.height
        keyNavigationWraps: true
        cacheBuffer: 1000
        flickableDirection: Flickable.HorizontalFlick
        model: sqlModel
        interactive: false
//        keyNavigationWraps: true
//        KeyNavigation.right: positionViewAtIndex(count - 1 , ListView.Beginning)
//        KeyNavigation.left:  currentIndex  = currentIndex - 1
        orientation: ListView.Horizontal
        delegate: GuideBroadCast{ }
        Component.onCompleted: {
//        positionViewAtIndex(count - 1, ListView.Beginning)
            connection.createConnection();
            sqlModel.setQuery(
                        "SELECT * FROM `program`
                           WHERE `starttime`>=NOW()
                           && `chanid`="+"\""+root.chanId+"\""+"ORDER BY `program`.`starttime` ASC"
                        )
            console.log(view.count + " " + root.chanId)
        }
    }
    SqlConnection{
        id:connection
        source: "192.168.1.21"
        user: "mythtv"
        databaseType: "mysql"
        databaseName: "mythconverg"
        port: 3306
        password: ""
    }
    SqlModel{
        id: sqlModel
    }
}
