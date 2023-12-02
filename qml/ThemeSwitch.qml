import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.Switch {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    background: Item
    {
        implicitWidth: 100
        implicitHeight: 100

        ShaderEffect
        {
            id:shader
            width:Math.min(parent.height,parent.width)
            height:width
            anchors.centerIn: parent
            property var src:parent
            property color fcolor:CustomStyle.frontColor1
            property real iTime:control.checked?0.0:1.0
            Behavior on iTime { SmoothedAnimation { velocity: 0.9 } }
            property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
            fragmentShader: "qrc:/esterVtech.com/imports/MyDesigns/frag/sunTomoon.frag.qsb"
        }

    }
    onCheckedChanged:
    {
        CustomStyle.theme=(CustomStyle.theme===CustomStyle.Theme.Dark)?CustomStyle.Theme.Light:CustomStyle.Theme.Dark;
    }

}
