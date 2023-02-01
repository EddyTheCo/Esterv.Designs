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
        Label {
            text: control.desc
            visible:(control.desc!="")
            color:bcolL
            Layout.preferredHeight: 25
            Layout.maximumHeight: 75
            Layout.fillHeight:  true
            Layout.preferredWidth: 200
            Layout.minimumWidth: 100
            Layout.maximumWidth: 200
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft
        }
        ScrollView {
            id:scrl
            Layout.preferredHeight: 200
            Layout.maximumHeight: 700
            Layout.minimumHeight: 150
            Layout.fillHeight:  true
            Layout.preferredWidth: 360
            Layout.minimumWidth: 200
            Layout.maximumWidth: 700
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft

            TextArea {
                id:tex
                color:bcolL
                leftPadding:20
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

