import QtQuick.Controls
import QtQuick
import CustomStyle 1.0

ShaderEffect {
    id: shader
    required property var src;
    property color fcolor: CustomStyle.backColor1
    property int radius:10;
    property real deviation:0.0;
    property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
    fragmentShader: "qrc:/esterVtech.com/imports/MyDesigns/frag/gausianBlur.frag.qsb"
}
