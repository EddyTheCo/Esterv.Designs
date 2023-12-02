import QtQuick


Button {
    id: control
    roundedScale:CustomStyle.Scale.Full
    property string shaderIcon:"hollowArrowHead"

    contentItem: ShaderEffect
    {
        implicitWidth: 32
        implicitHeight: 32
        opacity:(control.down)?0.7:1.0
        property var src:control.background
        property color fcolor:(control.highlighted||control.flat)&&control.enabled?CustomStyle.frontColor1:(control.enabled?CustomStyle.frontColor2:CustomStyle.frontColor3)
        property real iTime:0.5
        property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
        fragmentShader: "qrc:/esterVtech.com/imports/MyDesigns/frag/"+control.shaderIcon+".frag.qsb"
    }

}
