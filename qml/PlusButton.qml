import QtQuick
import QtQuick 2.0
import QtQuick.Controls
import QtQml
import QtQuick.Layouts

MyButton {
    id: control
    property real states: 1.0
    property real velocity:3.0

    onClicked:
    {
        shader.time=Math.floor(shader.time+1.0/states);
    }

    contentItem:
        RowLayout
    {
        anchors.fill: parent
        Rectangle
        {
            id:rectan
            color:"transparent"
            Layout.fillHeight:  true
            Layout.fillWidth: true
            Layout.minimumWidth: Math.min(parent.width,parent.height)
            Layout.preferredHeight: width
            Layout.alignment: Qt.AlignCenter
            ShaderEffect {
                id: shader
                property var src: rectan;

                property color fcolor:CustomStyle.midColor1
                property real time:0.0;
                property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
                fragmentShader: "qrc:/esterVtech.com/imports/MyDesigns/frag/plus.frag.qsb"
                Behavior on time { SmoothedAnimation { velocity: control.velocity } }
                anchors.fill: rectan;

            }
        }
        Text
        {
            visible:parent.width>parent.height+implicitWidth
            Layout.fillHeight:  true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
            text:control.text
            font: control.font
            elide: Text.ElideRight
            horizontalAlignment : Text.AlignLeft
            verticalAlignment : Text.AlignVCenter
            color:CustomStyle.frontColor1
        }
    }


}

