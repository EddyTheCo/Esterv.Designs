import QtQuick
import QtQuick 2.0
import QtQuick.Controls
import QtQml
import QtQuick.Layouts

MyButton {
    id: control
    property bool animate: false

    onAnimateChanged: {
        (control.animate)?timer.start():timer.stop();
    }
    Timer {
        id:timer
        interval: 50;  repeat: true
        onTriggered:
        {
            shader.time+=0.05;
        }
    }

    contentItem:
        RowLayout
        {
            anchors.fill: parent
            Rectangle
            {
                id:rectan
                color:"transparent"
                Layout.fillHeight:  true
                Layout.fillWidth: true
                Layout.minimumWidth: Math.min(parent.width,parent.height)
                Layout.preferredHeight: width
                Layout.alignment: Qt.AlignCenter
                SettWheelShadder {
                    id: shader
                    src: rectan;
                    fcolor:CustomStyle.midColor1
                    anchors.fill: rectan;

                }
            }
            Text
            {
                visible:parent.width>parent.height+implicitWidth
                Layout.fillHeight:  true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter
                text:control.text
                font: control.font
                color:CustomStyle.frontColor1
                elide: Text.ElideRight
                horizontalAlignment : Text.AlignLeft
                verticalAlignment : Text.AlignVCenter
            }
        }


}

