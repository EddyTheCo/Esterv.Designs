import QtQuick
import QtQuick.Controls


GroupBox {
    id:control
    property string description
    property color backColor: "transparent"
    background: Rectangle {
        color: backColor
        border.color: "#969ea2"
        radius: 5
    }
    label: MyLabel {
            x: control.leftPadding
            width: control.availableWidth
            text: control.description

            elide: Text.ElideRight
            font.bold:true
        }

}
