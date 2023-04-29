import QtQuick.Controls
import QtQuick


Rectangle {
    id:root
    required property string address
    property string url

    Image {
        id:img
        anchors.centerIn:parent
        sourceSize.width: root.width-10
         source: "image://qrcodeblack/"+root.address
    }
    ToolTip
    {
        id:tooltip
        visible: false
        text:qsTr("Copy")
    }
    TextEdit{
        id: textEdit
        visible: false
        text : root.address
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled :true
        onEntered: tooltip.visible=!tooltip.visible
        onExited: tooltip.visible=!tooltip.visible
        onClicked:
        {

            textEdit.selectAll()
            textEdit.copy()
            if(root.url_.length)
            {
                Qt.openUrlExternally(root.url_)
            }
        }
    }
}
