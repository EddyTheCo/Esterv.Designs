import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import QtQuick.Controls.Basic

T.Button {
    id: control
    property int roundedScale:CustomStyle.roundedScale
    property int thickScale:CustomStyle.thickScale
    property int paddingScale:CustomStyle.paddingScale

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: Math.min(contentItem.implicitWidth,contentItem.implicitHeight)*control.paddingScale/CustomStyle.Scale.Full

    opacity:(control.enabled)?1.0:0.7
    icon.width: 24
    icon.height: 24
    icon.color: control.checked || control.highlighted ? control.palette.brightText :
                control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : control.palette.buttonText
    contentItem:IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        opacity:(control.down)?0.7:1.0
        icon: control.icon
        text: control.text
        font: control.font
        color: (control.highlighted||control.flat)&&control.enabled?CustomStyle.frontColor1:(control.enabled?CustomStyle.frontColor2:CustomStyle.frontColor3)
    }

    background: Rectangle{
        implicitWidth: 32
        implicitHeight: 32
        visible: (!control.flat||(control.hovered&&control.enabled)) || control.down || control.checked || control.highlighted
        color: control.down ? (CustomStyle.theme)?CustomStyle.backColor3.darker(1.1):CustomStyle.backColor3.lighter(1.1):
               (control.highlighted || control.checked ? CustomStyle.backColor3.darker(1.1) :
               CustomStyle.backColor3)
        property int minspace:
            Math.min(control.leftPadding-control.leftInset,control.rightPadding-control.rightInset,
                     control.topPadding-control.topInset,control.bottomPadding-control.bottomInset)
        border.width: (control.enabled && control.hovered&&!control.down&&!control.flat )?minspace*0.4*control.thickScale/CustomStyle.Scale.Full:0
        border.color: CustomStyle.frontColor3
        radius: Math.min(width,height)*control.roundedScale/CustomStyle.Scale.Full

    }


}
