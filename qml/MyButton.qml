import QtQuick
import QtQuick.Controls

Button {
    id: control


    contentItem: Text {
        text: control.text
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "white" : "#969ea2"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        fontSizeMode:Text.Fit
        font.bold:true
    }

    background: Rectangle {
        opacity: enabled ? 1 : 0.3
        border.color: control.down ? "#17a81a" : "#21be2b"
        border.width: 1
        radius: 5
        color:"transparent"
    }
}
