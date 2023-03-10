import QtQuick 2.0
import QtQuick.Layouts

ColumnLayout
{
    id:pinrect
    property  string pin:numbers_.text
    property alias description: pintext
    spacing:2
    Text
    {
        id:pintext
        font.pointSize:20
        color:"white"
        text:""
        Layout.fillHeight:  true
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignCenter
        horizontalAlignment: Text.AlignHCenter
    }
    TextInput {
        id:numbers_
        Layout.fillHeight:  true
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignCenter
        font.letterSpacing :20
        font.pointSize: 28
        horizontalAlignment: Text.AlignHCenter
        color:"white"
        inputMask: "99999"
        text: "12345"
    }

}




