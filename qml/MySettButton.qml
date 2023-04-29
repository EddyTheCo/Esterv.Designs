import QtQuick
import QtQuick 2.0
import QtQuick.Controls
import QtQml

Button {
    id: control

    property bool animate: false
    property color frontcolor:shader1.fcolor

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
        property var src: control.background;
        property color fcolor: "#ffffff"
        property real time:0.0
        property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
        anchors.fill: control;
        fragmentShader: "qrc:/esterVtech.com/imports/MyDesigns/frag/mySettButton.frag.qsb"

    }

}
