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
    property alias readOnly: tex_.readOnly
    property alias wrapMode: tex_.wrapMode
    property bool  qrfill:false

    signal fillByQr()
    signal editingFinished()

    implicitWidth: tex_.implicitWidth
    implicitHeight: label_.implicitHeight+tex_.implicitHeight

    MyLabel {
        id:label_
        anchors.top:control.top
        anchors.left: control.left
        anchors.bottomMargin:  10
    }

    ScrollView {
        id:scrl
        anchors.top: label_.bottom
        anchors.left: control.left
        width:control.width
        height: control.height-label_.height
        TextArea {
            id:tex_
            color:CustomStyle.frontColor1
            placeholderTextColor:CustomStyle.midColor1
            background: Rectangle {
                id:bckrect
                radius:Math.min(width,height)*0.05
                border.width: 1 // TextControlBorderThemeThickness
                border.color: !control.enabled ? CustomStyle.midColor1 :
                                                 control.activeFocus ? CustomStyle.frontColor2 :
                                                                       control.hovered ? CustomStyle.frontColor1 : CustomStyle.frontColor3
                color: control.enabled ? CustomStyle.backColor1 : CustomStyle.midColor1
            }
            onEditingFinished: control.editingFinished()
        }


    }
    Rectangle {
        id:qrscan
        implicitWidth: tex_.font.pixelSize
        implicitHeight: tex_.font.pixelSize
        anchors.right: parent.right
        anchors.verticalCenter: scrl.verticalCenter
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
            onClicked: { control.fillByQr();}
        }
    }



}

