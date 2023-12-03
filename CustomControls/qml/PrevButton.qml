import QtQuick
import QtQuick.Controls
import Esterv.Styles.Simple

Button {
    id: control

    property string shaderIcon:"hollowArrowHead"

    contentItem: ShaderEffect
    {
        implicitWidth: 32
        implicitHeight: 32
        opacity:(control.down)?0.7:1.0
        property var src:control.background
        property color fcolor:(control.highlighted||control.flat)&&control.enabled?Style.frontColor1:(control.enabled?Style.frontColor2:Style.frontColor3)
        property real iTime:0.5
        property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
        fragmentShader: "qrc:/esterVtech.com/imports/Designs/frag/"+control.shaderIcon+".frag.qsb"
    }

}
