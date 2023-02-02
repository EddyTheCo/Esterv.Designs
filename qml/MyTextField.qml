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
        anchors.centerIn: control
        Label {
            text: control.desc
            visible:(control.desc!="")
            color:bcolL
            Layout.preferredHeight: 25
            Layout.maximumHeight: 75
            Layout.minimumHeight: 25
            Layout.fillHeight:  true
            Layout.minimumWidth: 50
            Layout.maximumWidth: 200
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft
        }
        TextField {
            id: tex
            Layout.preferredHeight: 50
            Layout.maximumHeight: 75
            Layout.minimumHeight: 45
            Layout.fillHeight:  true
            Layout.maximumWidth: 500
            Layout.preferredWidth: control.width*0.95
            Layout.minimumWidth: 50
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft
            placeholderTextColor:"#969ea2"

            color:bcolL
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



