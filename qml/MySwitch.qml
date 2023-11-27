import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

Switch {
    id: control
    property bool filled: true

    contentItem: Label {
        id:label
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.checked ? CustomStyle.frontColor1 : CustomStyle.midColor2
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        x: control.leftPadding
        rightPadding: control.indicator.width + control.spacing
    }

    indicator: Item {
        id:indi
        implicitWidth: 48
        implicitHeight: 48
        x: control.contentItem.width-indi.width
        anchors.verticalCenter:  control.contentItem.verticalCenter

        width:label.font.pixelSize
        height:indi.width

        ShaderEffect
        {
            id:shader
            property var src:indi
            property color fcolor: CustomStyle.frontColor2
            anchors.fill: indi;
            property real iTime:control.position;
            Behavior on iTime { SmoothedAnimation { velocity: 2.0} }
            property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
            fragmentShader: "qrc:/esterVtech.com/imports/MyDesigns/frag/"+((control.filled)?"filledArrowHead.frag.qsb":"hollowArrowHead.frag.qsb")
        }

    }


}
