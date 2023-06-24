import QtQuick
import QtQuick 2.0
import QtQuick.Controls
import QtQml
import QtQuick.Layouts

Button {
    id: control

    property real velocity:3.0

    background: Rectangle {
        id:back
            implicitWidth: 20
            implicitHeight: 20
            opacity: enabled ? 1 : 0.3
            color: "transparent"

            CloseShadder {
                id: shader
                src: back;
                anchors.centerIn:  back;
                width:back.width
                height:width
                fcolor:CustomStyle.frontColor2
                Behavior on time { SmoothedAnimation { velocity: control.velocity } }
            }
        }





}

