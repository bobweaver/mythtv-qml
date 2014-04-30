import QtQuick 2.0
ListModel {
    ListElement {
         text: "Use Default Profile"
       type:"not"
     }
     ListElement {
         text: "Record only this showing"
           type: "single"
     }
     ListElement {
         text: "Record Every Time"
        type: "all"
     }
     ListElement {
         text: "Record Daily in this Time Slot"
         type: "daily"
     }
     ListElement {
         text:"Record Weekly in this Time Slot"
         type: "weekly"
     }
}
