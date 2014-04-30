import QtQuick 2.0
import  QtQuick.XmlListModel 2.0
Item{
  id: menuItem
  property variant  gV
  XmlListModel{
      id: menuModel
      source: "https://raw.github.com/MythTV-Themes/LCARS/master/menu-ui.xml"
      query: "//*"
      XmlRole{name: "menuName"; query: "@name/string()"}
 onStatusChanged: {
     if (status === XmlListModel.Ready){
          gV = menuModel.get(0).menuName
         console.log(count)//get(0).menuName)
         console.log(gV)
     }
     if (status === XmlListModel.Loading){console.log("loading")}
     if (status === XmlListModel.Error){console.log(errorString())}
 }
  }
}
