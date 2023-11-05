import QtQuick
import QtQuick.Controls
import QtQuick.Layouts



ColumnLayout
{
    id: control
    property alias label: label_
    property alias textfield: tex_

    property bool  qrfill:false

    signal fillqr();
    MyLabel {
        id:label_
    }
    Item
    {
        Layout.fillHeight:  true
        Layout.fillWidth: true
        implicitHeight: tex_.implicitHeight
        implicitWidth: tex_.implicitWidth
        Rectangle {
                id:qrscan
                implicitWidth: font.pixelSize
                implicitHeight: font.pixelSize
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                color: "transparent"
                visible: control.qrfill&&!control.text&&control.enabled
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
                    onClicked: {
                        control.fillqr();
                    }
                }
            }

        TextField {
            id: tex_
            anchors.fill: parent
            leftPadding:10
            selectByMouse:true
            color:CustomStyle.frontColor1
            placeholderTextColor:CustomStyle.midColor1

            background: Rectangle {
                radius:Math.min(width,height)*0.1
                border.width: 1 // TextControlBorderThemeThickness
                border.color: !control.enabled ? CustomStyle.midColor1 :
                                                 control.activeFocus ? CustomStyle.frontColor2 :
                                                                       control.hovered ? CustomStyle.frontColor1 : CustomStyle.frontColor3
                color: control.enabled ? CustomStyle.backColor1 : CustomStyle.midColor1
            }
        }
    }

}

