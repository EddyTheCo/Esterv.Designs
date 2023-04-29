import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item
{
    id: control
    property alias label: label_
    property alias textarea: tex_

    ColumnLayout
    {
        spacing:0
        anchors.fill: parent
        MyLabel {
            id:label_
            Layout.fillHeight:  true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
        }
        ScrollView {
            id:scrl

            Layout.fillHeight:  true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
            TextArea {
                id:tex_
            }
        }

    }


}

