import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item
{
    id: control
    property alias description: label_.text
    property alias text: tex_.text
    property alias placeholderText: tex_.placeholderText
    property alias textfont: tex_.font
    property alias labelfont: label_.font
    property alias background: tex_.background
    property bool  qrfill:false

    signal fillByQr()

    implicitWidth: tex_.implicitWidth
    implicitHeight: label_.implicitHeight+tex_.implicitHeight

    MyLabel {
        id:label_
        anchors.top:control.top
        anchors.left: control.left
        anchors.bottomMargin:  10
    }
    TextField {
        id: tex_
        anchors.top: label_.bottom
        anchors.left: control.left
        width:control.width
        leftPadding:10
        selectByMouse:true
        color:CustomStyle.frontColor1
        placeholderTextColor:CustomStyle.midColor1
        background: Rectangle {
            id: bckrect
            radius:Math.min(width,height)*0.12
            border.width: 1 // TextControlBorderThemeThickness
            border.color: !control.enabled ? CustomStyle.midColor1 :
                                             control.activeFocus ? CustomStyle.frontColor2 :
                                                                   control.hovered ? CustomStyle.frontColor1 : CustomStyle.frontColor3
            color: control.enabled ? CustomStyle.backColor1 : CustomStyle.midColor1
        }
        Rectangle {
            id:qrscan
            implicitWidth: 0.8*tex_.height
            implicitHeight: 0.8*tex_.height
            anchors.right: tex_.right
            anchors.verticalCenter: parent.verticalCenter
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
                onClicked: { control.fillByQr();}
            }
        }
    }

}



