import QtQuick
import QtQuick 2.0
import QtQuick.Controls
import QtQml
import QtQuick.Layouts

Button {
    id: control
    hoverEnabled :true



    background: Rectangle {
        id:back
            implicitWidth: 20
            implicitHeight: 20
            opacity: enabled ? 1 : 0.3
            color: "transparent"

            ShaderEffect {
                id: shader
                property var src: back;
                property color fcolor:CustomStyle.frontColor2
                property real hovered:(control.hovered)?0.15:0.0
                property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
                fragmentShader: "qrc:/esterVtech.com/imports/MyDesigns/frag/close.frag.qsb"
                anchors.centerIn:  back;
                width:back.width
                height:width

                Behavior on hovered { SmoothedAnimation { velocity: 2 }  }
            }
        }





}

