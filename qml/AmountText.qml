import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Text
{
    id: control
    required property var jsob;
    property bool change:true
    color:CustomStyle.frontColor1
    text: (Object.keys(jsob).length === 0)?'':((!jsob.default&&change)?(jsob.shortValue.value+ '<font color=\"'+CustomStyle.frontColor2+'\">'+jsob.shortValue.unit+'</font>'):
                                   jsob.largeValue.value+ '<font color=\"'+CustomStyle.frontColor2+'\">'+jsob.largeValue.unit+'</font>');

    MouseArea {
        anchors.fill: parent
        onClicked:
        {
            control.change=!control.change;
        }
    }
}



