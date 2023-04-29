import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item
{
    id: control
    property alias label: label_
    property alias textfield: tex_
    ColumnLayout
    {
        spacing:0
        anchors.fill: parent
        MyLabel {
            id:label_
            Layout.fillHeight:  true
            Layout.fillWidth: true
        }
        TextField {
            id: tex_

            Layout.fillHeight:  true
            Layout.fillWidth: true
            leftPadding:10
            selectByMouse:true
        }
    }
}



