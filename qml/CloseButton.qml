import QtQuick
import QtQuick 2.0
import QtQuick.Controls
import QtQml
import QtQuick.Layouts

Rectangle {
    id: control
    color:"transparent"
    property real velocity:3.0
    signal close()

    MouseArea {
        anchors.fill: parent
        hoverEnabled :true
        onEntered: shader.time=1.0;
        onExited: shader.time=0.0;
        onClicked: control.close()
    }

    CloseShadder {
        id: shader
        src: control;
        anchors.centerIn:  control;
        width:control.width
        height:width
        fcolor:CustomStyle.frontColor2
        Behavior on time { SmoothedAnimation { velocity: control.velocity } }
    }

}

