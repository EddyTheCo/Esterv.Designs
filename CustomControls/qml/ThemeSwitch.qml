import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import Esterv.Styles.Simple

T.Switch {
    id: control

    implicitWidth: control.text ? 192 : 64
    implicitHeight: 32

    indicator: Rectangle {
        width: control.availableWidth * (control.text ? 0.3 : 1.0)
        height: width * 0.5

        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        radius: Math.min(width, height)

        color: Style.backColor3

        Rectangle {
            x: Math.max(0, Math.min(parent.width - width, control.visualPosition * parent.width - (width / 2)))
            y: (parent.height - height) / 2
            width: Math.min(parent.width, parent.height)
            height: width
            radius: width
            color: "transparent"

            Behavior on x {
                enabled: !control.down
                SmoothedAnimation {
                    velocity: 100
                }
            }
            ShaderEffect {
                id: shader
                width: Math.min(parent.height, parent.width)
                height: width
                anchors.centerIn: parent
                property var src: parent
                property color fcolor: Style.frontColor1
                property real iTime: control.checked ? 1.0 : 0.0
                Behavior on iTime {
                    SmoothedAnimation {
                        velocity: 0.9
                    }
                }
                property var pixelStep: Qt.vector2d(1 / src.width, 1 / src.height)
                fragmentShader: "qrc:/esterVtech.com/imports/Designs/frag/sunTomoon.frag.qsb"
            }
        }
    }

    contentItem: CheckLabel {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: control.font
        color: Style.frontColor3
    }
    onCheckedChanged: {
        Style.theme = (Style.theme === Style.Theme.Dark) ? Style.Theme.Light : Style.Theme.Dark;
    }
}
