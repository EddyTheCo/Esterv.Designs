import QtQuick
import QtQuick.Controls

TextArea {
    id: control


    property string desc:""
    color:"white"
    leftPadding:20


     MyLabel {
         text: control.desc
         visible:(control.desc!="")
         anchors.bottom: control.top
         anchors.left: control.left
     }
}
