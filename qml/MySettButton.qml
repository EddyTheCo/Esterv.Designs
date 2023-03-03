import QtQuick
import QtQuick 2.0
import QtQuick.Controls
import QtQml

Button {
    id: control


    property alias frontcolor: shader1.fcolor
	property alias itime:shader1.time
	property alias itimer:timer
    required property Rectangle rect_;
    property bool animate: false
    background: control.rect_;

    onAnimateChanged: {
               (control.animate)?timer.start():timer.stop();

            }
        Timer {
            id:timer
                interval: 50;  repeat: true
                onTriggered:
                {
                    shader1.time+=0.05;
                }
            }

    ShaderEffect {
        id: shader1
        property var src: control.rect_;
        property color fcolor: "#ffffff"
        property real time:0.0
        property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
        anchors.fill: control;

        fragmentShader: "qrc:/esterVtech.com/imports/MyDesigns/frag/mySettButton.frag.qsb"

    }

}
