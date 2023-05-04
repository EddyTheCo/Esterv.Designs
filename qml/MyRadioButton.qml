import QtQuick
import QtQuick.Controls

RadioButton {
    id: control

    indicator: Rectangle {
        implicitWidth: 20
        implicitHeight: 20
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 13
        border.color: control.down ? CustomStyle.frontColor2 : CustomStyle.midColor1
        color:"transparent"

        Rectangle {
            width: 10
            height: 10
            x: 5
            y: 5
            radius: 4
            color: control.down ? CustomStyle.midColor1 : CustomStyle.frontColor2
            visible: control.checked
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        fontSizeMode:Text.Fit
        color: CustomStyle.midColor1
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }

}
