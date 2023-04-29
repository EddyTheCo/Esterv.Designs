import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

GroupBox {
    id:control
    property string description;
    property alias collapsed:shader.time;
    property real velocity:3.0



    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)*shader.time


    label: RowLayout{
        Rectangle
        {
            id:arrow_
            x: control.leftPadding
            width: label_.contentHeight
            height:label_.contentHeight
            color:"transparent"
            ArrowShadder
            {
                id:shader
                src:arrow_
                anchors.fill: arrow_;
                Behavior on time { SmoothedAnimation { velocity: control.velocity } }
            }
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    if(shader.time>0.5)
                    shader.time=0.0;
                    else
                    shader.time=1.0;
                }
            }

        }

        MyLabel {
            id:label_
            x: arrow_.right
            width: control.availableWidth-height
            text: control.description
            elide: Text.ElideRight
            font.bold:true
        }
    }

}
