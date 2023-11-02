import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T
import QtQrDec

T.TextField
{
    id: control
    property alias description: label_.text
    property alias labelfont: label_.font
    property bool  qrfill:false

    signal fillqr();
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset
                   || Math.max(contentWidth, placeholder.implicitWidth) + leftPadding + rightPadding,label_.implicitWidth)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding,
                             placeholder.implicitHeight + topPadding + bottomPadding)

    selectByMouse:true
    color:CustomStyle.frontColor1
    placeholderTextColor:CustomStyle.midColor1
    topPadding: label_.height
    PlaceholderText {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)-((qrscan.visible)?qrscan.width:0)-2*bckrect.border.width
        height: control.height - (control.topPadding + control.bottomPadding)
        text: control.placeholderText
        font: control.font
        color: control.placeholderTextColor
        verticalAlignment: control.verticalAlignment
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
        elide: Text.ElideRight
        renderType: control.renderType
    }
    Rectangle {
        id:qrscan
        implicitWidth: font.pixelSize
        implicitHeight: font.pixelSize
        anchors.left: placeholder.right
        anchors.verticalCenter: placeholder.verticalCenter
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
    background: Item{
        MyLabel {
            id:label_
            elide: Text.ElideRight
            width:control.width
        }
        Rectangle
        {
            id: bckrect
            y:control.topPadding
            width:parent.width
            height:parent.height-label_.height
            radius:Math.min(bckrect.width,bckrect.height)*0.12
            border.width: 1 // TextControlBorderThemeThickness
            border.color: !control.enabled ? CustomStyle.midColor1 :
                                             control.activeFocus ? CustomStyle.frontColor2 :
                                                                   control.hovered ? CustomStyle.frontColor1 : CustomStyle.frontColor3
            color: control.enabled ? CustomStyle.backColor1 : CustomStyle.midColor1

        }
    }




}



