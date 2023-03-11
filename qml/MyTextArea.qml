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
    property string placeholderText:""

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
            Layout.maximumHeight: 50
            Layout.alignment: Qt.AlignCenter
        }
        ScrollView {
            id:scrl

            Layout.fillHeight:  true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
            TextArea {
                id:tex
                color:control.bcolL
                leftPadding:20
                selectByMouse:true
                placeholderTextColor:"#969ea2"
                placeholderText:control.placeholderText
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


}

