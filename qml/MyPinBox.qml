import QtQuick 2.0
import QtQuick.Layouts

MyFrame
{
    id:pinrect
    property  alias pin:numbers_

        TextInput {
            id:numbers_
            anchors.fill: parent
            anchors.centerIn: parent
            font.letterSpacing :20
            font.pointSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color:"white"
            inputMask: "99999"
            text: "12345"
        }

}






