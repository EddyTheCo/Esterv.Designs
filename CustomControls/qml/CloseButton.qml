import QtQuick
import QtQuick.Controls
import Esterv.Styles.Simple

RoundButton {
    id: control
    hoverEnabled :Maria.hoover
    contentItem: ShaderEffect
    {
        implicitWidth: 32
        implicitHeight: 32
        property var src:control.background
        property color fcolor:(control.highlighted||control.flat)&&control.enabled?Style.frontColor1:(control.enabled?Style.frontColor2:Style.frontColor3)
        property real iTime:(control.hovered&&control.enabled)?0.15:0.0
        Behavior on iTime { SmoothedAnimation { velocity: 0.9 }  }
        property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
        fragmentShader: "qrc:/esterVtech.com/imports/Designs/frag/close.frag.qsb"
    }





}

