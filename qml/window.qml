import QtQuick.Controls
import QtQuick

ApplicationWindow {
    visible: true
    width:700
    height:700

    background: Rectangle {
            color:"#1e1e1e"
        }

    MySettButton
    {
        radius:5
        border.color:"#ffffff"
        border.width:1

        width:150
        height:100
    }
}
