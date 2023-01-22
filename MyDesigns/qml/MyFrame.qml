import QtQuick
import QtQuick.Controls


GroupBox {
    id:control
    property string description
    background: Rectangle {
        color: "transparent"
        border.color: "#969ea2"
        radius: 5
    }
    label: Label {
            x: control.leftPadding
            width: control.availableWidth
            text: control.description
            color: "#969ea2"
            elide: Text.ElideRight
            font.bold:true
        }

}
