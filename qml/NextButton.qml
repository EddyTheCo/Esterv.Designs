import QtQuick
import QtQuick.Controls

MyButton {
    id: control
    roundedScale:CustomStyle.RoundedScale.FullScale
    property bool horizontal : true
    property bool first : true
    property bool filled: true


    Item
    {
        id:arrow_
        width:control.width-control.leftPadding-control.rightPadding
        height:control.height-control.topPadding-control.bottomPadding
        x:parent.leftPadding
        y:parent.topPadding

        ShaderEffect
        {
            id:shader
            property var src:arrow_
            property color fcolor:CustomStyle.frontColor2
            anchors.fill: arrow_;
            property real iTime:(control.horizontal)?((control.first)?0.5:1.5):((control.first)?0.0:1.0);
            Behavior on iTime { SmoothedAnimation { velocity: 2.0 } }
            property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
            fragmentShader: "qrc:/esterVtech.com/imports/MyDesigns/frag/"+((control.filled)?"filledArrowHead.frag.qsb":"hollowArrowHead.frag.qsb")
        }
    }
}
