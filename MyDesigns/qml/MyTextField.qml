import QtQuick
import QtQuick.Controls

TextField {
    id: control
    property color bcolD: "#969ea2"
    property color bcolL: "white"
    placeholderTextColor:"#969ea2"
    color:"white"
     leftPadding:20
    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 40
        color: "transparent"
        border.color: control.enabled ? bcolD : "#969ea2"
        border.width: 1

        radius:15
        MouseArea {
                anchors.fill: parent
                hoverEnabled :true
                onEntered:
                {
                    if(parent.enabled)
                    {
                        parent.border.color=bcolL

                    }
                }
                onExited:
                {
                    parent.border.color=bcolD

                }

            }
    }

}
