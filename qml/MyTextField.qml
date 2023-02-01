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
        Label {
            text: control.desc
            visible:(control.desc!="")
            color:bcolL
            Layout.preferredHeight: 50
            Layout.maximumHeight: 75
            Layout.fillHeight:  true
            Layout.preferredWidth: 200
            Layout.minimumWidth: 100
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
            Layout.preferredWidth: 360
            Layout.minimumWidth: 100
            Layout.maximumWidth: 500
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft

            placeholderTextColor:"#969ea2"

            color:bcolL
            leftPadding:20
            background: Rectangle {
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
    }
}



