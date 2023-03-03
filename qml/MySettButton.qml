import QtQuick
import QtQuick 2.0
import QtQuick.Controls

Button {
    id: control


    property alias frontcolor: shader1.fcolor
    required property Rectangle rect_;
    property bool animate: false
    background: rect_;

    onAnimateChanged: {
               (control.animate)?timer.start():timer.stop();
            }

    ShaderEffect {
        id: shader1
        property var src: rect_;
        property color fcolor: "#ffffff"
        property real time:0.0
        property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
        anchors.fill: control;
        Timer {
            id:timer
                interval: 50;  repeat: true
                onTriggered:
                {
                    shader1.time+=0.05;
                }
            }

        fragmentShader: "qrc:/esterVtech.com/imports/MyDesigns/frag/mySettButton.frag.qsb"

    }

}
