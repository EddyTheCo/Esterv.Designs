import QtQuick
import QtQuick.Controls

Button {
    id: control

    property int roundedScale:CustomStyle.roundedScale
    property int thickScale:CustomStyle.thickScale


    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.checked || control.highlighted ? CustomStyle.frontColor1 :
               control.flat && !control.down ? (control.visualFocus ? CustomStyle.frontColor2 : CustomStyle.frontColor3) : CustomStyle.frontColor1.darker(0.5)
    }

    background: Rectangle {
        implicitWidth: 32
        implicitHeight: 32
        radius: Math.min(width,height)*control.roundedScale/CustomStyle.RoundedScale.FullScale
        visible: !control.flat || control.down || control.checked || control.highlighted ||control.hovered
        color: control.down ? CustomStyle.backColor3:
               (control.enabled && (control.highlighted || control.checked) ? CustomStyle.midColor1 :
                                                                             CustomStyle.backColor3.darker(1.5))
        property int minspace:Math.min(control.leftPadding-control.leftInset,control.rightPadding-control.rightInset,topPadding-control.topInset,bottomPadding-control.bottomInset)
        border.width:  (enabled && control.hovered)?minspace*control.thickScale/CustomStyle.ThickScale.FullScale:0
        border.color: CustomStyle.frontColor1
    }
}
