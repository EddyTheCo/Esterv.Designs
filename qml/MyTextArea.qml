import QtQuick
import QtQuick.Controls
import QtQuick.Layouts



ColumnLayout
{
    id: control
    property alias label: label_
    property alias textarea: tex_
    property bool  qrfill:false

    signal fillqr()

    spacing:0
    MyLabel {
        id:label_
    }
    Item
    {
        id:box
        Layout.fillHeight:  true
        Layout.fillWidth: true
        implicitHeight: tex_.implicitHeight
        implicitWidth: tex_.implicitWidth
        ScrollView {
            id:scrl

            anchors.fill: parent
            TextArea {
                id:tex_
                color:CustomStyle.frontColor1
                placeholderTextColor:CustomStyle.midColor1
                background: Rectangle {
                    radius:Math.min(width,height)*0.05
                    border.width: 1 // TextControlBorderThemeThickness
                    border.color: !control.enabled ? CustomStyle.midColor1 :
                                                     control.activeFocus ? CustomStyle.frontColor2 :
                                                                           control.hovered ? CustomStyle.frontColor1 : CustomStyle.frontColor3
                    color: control.enabled ? CustomStyle.backColor1 : CustomStyle.midColor1
                }
            }
        }
        Rectangle {
                id:qrscan
                implicitWidth: tex_.font.pixelSize
                implicitHeight: tex_.font.pixelSize
                anchors.right: box.right
                anchors.verticalCenter: box.verticalCenter
                opacity: enabled ? 1 : 0.3
                color: "transparent"
                visible: control.qrfill&&!tex_.text&&control.enabled
                ShaderEffect {
                    id: shader
                    property var src: qrscan;
                    property color fcolor:CustomStyle.frontColor2
                    property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
                    fragmentShader: "qrc:/esterVtech.com/imports/MyDesigns/frag/qrscanner.frag.qsb"
                    anchors.fill: qrscan
                }
                MouseArea {
                    anchors.fill: qrscan
                    onClicked: { control.fillqr();}
                }

            }
    }




}
