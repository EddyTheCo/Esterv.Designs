import QtQuick
import QtQuick.Controls

Button {
    id: control
    background: Rectangle {
        implicitWidth: 32
        implicitHeight: 32
        radius: Math.min(width,height)*0.15
        visible: !control.flat || control.down || control.checked || control.highlighted
        color: control.down ? CustomStyle.backColor3:
               (control.enabled && (control.highlighted || control.checked) ? CustomStyle.midColor1 :
                                                                             CustomStyle.backColor3.darker(1.5))

        Rectangle {
            width: parent.width
            height: parent.height
            color: "transparent"
            visible: enabled && control.hovered
            border.width: 1 // ButtonBorderThemeThickness
            border.color: CustomStyle.frontColor1
            radius: parent.radius
        }
    }
}
