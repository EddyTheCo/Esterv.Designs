import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item
{
    id: control
    property color bcolD: "#969ea2"
    property color bcolL: "white"
    property string desc:""
    property alias tfield:tex
    property alias placeholderText: tex.placeholderText
    ColumnLayout
    {
        spacing:0
        anchors.fill: parent
        Label {
            text: control.desc
            visible:(control.desc!="")
            color:control.bcolL

            Layout.fillHeight:  true
            Layout.fillWidth: true
        }
        TextField {
            id: tex

            Layout.fillHeight:  true
            Layout.fillWidth: true
            placeholderTextColor:"#969ea2"
            color:control.bcolL
            leftPadding:20
            selectByMouse:true
            background: Rectangle {
                color: "transparent"
                border.color: control.enabled ? control.bcolD : "#969ea2"
                border.width: 1

                radius:10



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
    }
}



