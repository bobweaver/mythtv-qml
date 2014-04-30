import QtQuick 2.0
import  MythTv 1.0
/*!
    \qmltype MythOptionsString
    \inqmlmodule MythTv 0.1
    \ingroup mythtv
    \brief The MythOptionsString displays a Rectangle
    with Gradient and Text.  It also has a Text Input that
    has two signals one for when evter is pressed and the
    other is for when the text is changed.
    \b{This component is under heavy development.}
    Example:
    \qml
    Item {
        CheckBox {
            checked: true
        }
    }
    \endqml
*/
Rectangle{
    /*!
       \preliminary
       The header Text
    */
    property string name: mythIpBackendText.text
    /*!
       \preliminary
       The header text Color
    */
    property string nameColor: mythIpBackendText.color
    /*!
       \preliminary
       When enter is pressed
       \b
       \qml
     MythOptionsString{
         onEnterPressed{
            console.log(qstr("Hello World"))
            }
        }
    }
    \endqml
    */

    ////FIZ ME ? DOC ME
    property real  namepxSize: mythIpBackendText.font.pixelSize
    property string nameEffect: mythIpBackendText.style
    property string nameEffectColor: mythIpBackendText.styleColor
    property string nameWraping: mythIpBackendText.wrapMode
    property double nameMaxLineCount: mythIpBackendText.maximumLineCount
    property bool nameBold: mythIpBackendText.font.bold
    property  string nameWeight: mythIpBackendText.font.weight
    property bool nameItalic: mythIpBackendText.font.italic
    property real nameLetterSpacing: mythIpBackendText.font.letterSpacing
    property bool  nameUnderLined: mythIpBackendText.font.underline

    signal enterPressed()
    /*!
       \preliminary
       Watch's to see if the text is changing
    /*!
       \preliminary
       The header Text
    /b
       \qml
     MythOptionsString{
         onTxtChanged: {
            console.log(qstr(defaultText))
            }
        }
    }
    \endqml
    */
//    signal txtChanged()
    /*!
       \preliminary
       The default Text that is in the Box before the user
       /b enters in anything
    */
    property string defaultText: mythIpBackendButton.text
    property string  inputTextColor: mythIpBackendButton.color
    property int curve: mythIpBackendRec.radius

    id:mythIpBackendRec
    width: parent.width
    height: parent.height
    radius: curve
    border.color: "#55FFFFFF"
    border.width:  borderWidth
    gradient: Gradient {
        GradientStop { position: 0; color: "#12000000"}
        GradientStop { position: 0.5; color: "#44808080"}
        GradientStop { position: 1; color: "#12000000"}
    }
    x: status === Rectangle.Ready ? 0 : 1
    Behavior on x {NumberAnimation{from: 1300; to: 0 ;duration:  1900 ;easing.type: Easing.OutQuint}}

    Text {
        id: mythIpBackendText
        color: [undefined] ? "white" : nameColor
        font.pixelSize: [undefined] ? 18 : namePxSize
        text:  name
        anchors{
            left: mythIpBackendRec.left
            leftMargin: mythIpBackendRec.width / 20
            verticalCenter: mythIpBackendRec.verticalCenter
        }
    }
    Rectangle{
        id: mythIpBackendButtonRec
        height: mythIpBackendRec.height / 3
        width: mythIpBackendRec.width / 4
        radius: 0
        border.color: "#55FFFFFF"
        border.width: 1
        gradient: Gradient {
            GradientStop { position: 0; color: "#12000000"}
            GradientStop { position: 0.5; color: "#44808080"}
            GradientStop { position: 1; color: "#12000000"}
        }
        anchors{
            right: parent.right
            rightMargin: parent.width / 20
            verticalCenter: mythIpBackendRec.verticalCenter
        }
        TextInput{
            id: mythIpBackendButton
            height: mythIpBackendButtonRec.height / 1.4
            color: [undefined] ? "#FFFFFF" :  inputText
            text: [undefined] ?  "default" : defaultText
            onAccepted: enterPressed()
//            onTextChanged: txtChanged()
            anchors{
                bottom: mythIpBackendButtonRec.bottom
                horizontalCenter: mythIpBackendButtonRec.horizontalCenter
            }
        }
    }
}
