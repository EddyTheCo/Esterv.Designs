import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Text
{
    id: control
    required property var jsob;
    property bool change:true
    text: (!jsob.default&&change)?(jsob.shortValue.value+ " "+jsob.shortValue.unit):jsob.largeValue.value+ " "+jsob.largeValue.unit;
    MouseArea {
        anchors.fill: parent
        onClicked:
        {
            control.change=!control.change;
        }
    }
}



