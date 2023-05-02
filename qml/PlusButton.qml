import QtQuick
import QtQuick 2.0
import QtQuick.Controls
import QtQml
import QtQuick.Layouts

Button {
    id: control
    property real states: 1.0
    property real velocity:3.0

    onClicked:
    {
        shader.time+=1.0/states;
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
            PlusShadder {
                id: shader
                src: rectan;
                anchors.fill: rectan;
                Behavior on time { SmoothedAnimation { velocity: control.velocity } }
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
        }
    }


}

