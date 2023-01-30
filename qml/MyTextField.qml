import QtQuick
import QtQuick.Controls

TextField {
    id: control
    property color bcolD: "#969ea2"
    property color bcolL: "white"
    placeholderTextColor:"#969ea2"
    property string desc:""
    color:"white"
     leftPadding:20


     Label {
         text: control.desc
         visible:(control.desc!="")
         anchors.bottom: control.top
         anchors.left: control.left
         color:"white"

     }
    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 40
        color: "transparent"
        border.color: control.enabled ? control.bcolD : "#969ea2"
        border.width: 1

        radius:15



        MouseArea {
                anchors.fill: parent
                hoverEnabled :true
                onEntered:
                {
                    if(parent.enabled)
                    {
                        parent.border.color=control.bcolL

                    }
                }
                onExited:
                {
                    parent.border.color=control.bcolD

                }

            }
    }

}
