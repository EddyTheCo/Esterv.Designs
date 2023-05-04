import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item
{
    id: control
    property alias label: label_
    property alias textfield: tex_
    ColumnLayout
    {
        spacing:0
        anchors.fill: parent
        MyLabel {
            id:label_
            Layout.fillHeight:  true
            Layout.fillWidth: true
        }
        TextField {
            id: tex_

            Layout.fillHeight:  true
            Layout.fillWidth: true
            leftPadding:10
            selectByMouse:true

            background: Rectangle {
                implicitWidth: 60 // TextControlThemeMinWidth - 4 (border)
                implicitHeight: 28 // TextControlThemeMinHeight - 4 (border)
                radius:Math.min(width,height)*0.1
                border.width: 1 // TextControlBorderThemeThickness
                border.color: !control.enabled ? CustomStyle.midColor1 :
                               control.activeFocus ? CustomStyle.frontColor2 :
                               control.hovered ? CustomStyle.frontColor1 : CustomStyle.frontColor3
                color: control.enabled ? CustomStyle.backColor1 : CustomStyle.midColor1
            }
        }
    }
}



