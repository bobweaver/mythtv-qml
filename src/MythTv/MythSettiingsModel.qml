import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import "Util.js" as Utils
import "dbUtil.js" as DataBase

XmlListModel{
id: versions
    source:   DataBase.ipAddress() + ":"+ DataBase.port() +"/Myth/GetConnectionInfo"
    query: "/ConnectionInfo/Version/String"
    XmlRole{name: "Version"; query: "Version/string()"  }
    XmlRole{name: "Branch"; query: "Branch/string()"  }
    XmlRole{name: "Protocol"; query: "Protocol/string()"  }
    XmlRole{name: "Binary"; query: "Binary/string()"  }
    XmlRole{name: "Binary"; query: "Binary/string()"  }
    XmlRole{name: "Schema"; query: "Schema/string()"  }
}


