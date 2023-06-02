pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Popup {
    id: popup

    property int numElements:2
    closePolicy: Popup.NoAutoClose
    Timer {
        id:timer
        interval: 5000;
        onTriggered: popup.close();
    }
    modal:false
    dim:false
    focus:false
    exit: Transition {
        NumberAnimation { property: "opacity"; from: 1.0; to: 0.0 ;duration: 250}
    }
    enter: Transition {
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 ;duration: 250}
    }
    function show(obj)
    {
        timer.restart();
        popup.opacity=1.0;
        popup.open();
        messageModel.insert(0,(obj));
    }
    Behavior on opacity { SmoothedAnimation { velocity: 5.0 } }
    background: Rectangle {
        color:"transparent"
    }


    ListView {
        id:listview
        anchors.fill: parent
        model: messageModel
        clip:true
        add: Transition {
            NumberAnimation { property: "x"; from: listview.width*0.15; duration: 300 }
            NumberAnimation { property: "opacity"; from: 0.3; to: 1.0; duration: 300 }
        }
        remove: Transition {
                NumberAnimation { property: "opacity"; to: 0.3; duration: 300 }
                NumberAnimation { properties: "x"; to: listview.width*0.15; duration: 200 }
        }
        delegate:
            Rectangle
        {
            id:rectang
            radius:Math.min(width,height)*0.07
            color:CustomStyle.frontColor1


            required property string message;
            required property int index;
            width: listview.width;
            height: (listview.height/popup.numElements>tex.contentHeight)?70:(listview.height/popup.numElements);
            RowLayout
            {
                anchors.fill: parent
                Text
                {
                    id:tex
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter|Qt.AlignLeft
                    text: qsTr(rectang.message)
                    elide: Text.ElideRight
                    font:CustomStyle.h4
                    padding : 5
                    wrapMode: Text.WordWrap
                    verticalAlignment:Text.AlignVCenter
                    horizontalAlignment : Text.AlignLeft
                    color:CustomStyle.backColor1
                }
                Button
                {
                    id:control
                    Layout.fillWidth: true
                    Layout.maximumWidth: 50
                    Layout.alignment: Qt.AlignVCenter|Qt.AlignRight
                    text:"X"
                    contentItem: Text {
                            text: control.text
                            font: control.font
                            opacity: enabled ? 1.0 : 0.3
                            color: control.down ? CustomStyle.frontColor1 : CustomStyle.backColor1
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                    onClicked:
                    {
                        timer.restart();
                        rectang.ListView.view.model.remove(rectang.index);
                        if(!rectang.ListView.view.model.count)popup.close();
                    }
                    background: Rectangle{color:"transparent"}
                    Behavior on opacity { SmoothedAnimation { velocity: 2.0 } }

                }
            }

        }

    }
    ListModel {
        id: messageModel
    }

}

