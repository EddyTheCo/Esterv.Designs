import QtQuick.Controls
import QtQuick


ShaderEffect {
    id: shader
    required property var src;
    property color fcolor: "#ffffff"
    property real time:0.0;
    property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
    fragmentShader: "qrc:/esterVtech.com/imports/MyDesigns/frag/close.frag.qsb"
}
