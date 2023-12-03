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
        property var src:control.background
        property color fcolor:(control.highlighted||control.flat)&&control.enabled?Style.frontColor1:(control.enabled?Style.frontColor2:Style.frontColor3)
        property real iTime:1.5
        property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
        fragmentShader: "qrc:/esterVtech.com/imports/Styles/Simple/frag/"+control.shaderIcon+".frag.qsb"
    }

}
