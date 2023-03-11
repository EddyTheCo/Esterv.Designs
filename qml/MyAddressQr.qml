import QtQuick.Controls
import QtQuick


Rectangle {
    id:rect_
    required property string addr_
    property string url_
    color:"white"


    Image {
        id:img
        anchors.centerIn:parent
        sourceSize.width: rect_.width-10
        source: "image://qrcodeblack/"+rect_.addr_
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
        text : rect_.addr_
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

            if(rect_.url_.length)
            {
                Qt.openUrlExternally(rect_.url_)
            }

        }
    }
}
