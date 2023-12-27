import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Esterv.Styles.Simple

T.RoundButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 2*Style.paddingScale

    icon.width: 24
    icon.height: 24
    icon.color: control.checked || control.highlighted ? control.palette.brightText :
                control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : control.palette.buttonText

    contentItem:IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        icon: control.icon
        text: control.text
        font: control.font
        color:(control.highlighted||control.flat)&&control.enabled?Style.frontColor1:(control.enabled?Style.frontColor2:Style.frontColor3)
    }

    background: Rectangle{
        implicitWidth: 32
        implicitHeight: 32
        opacity:(control.enabled)?1.0:0.3
        visible: (!control.flat||(control.hovered&&control.enabled)) || control.down || control.checked || control.highlighted
        color: control.down ? (Style.theme)?Style.backColor3.darker(1.1):Style.backColor3.lighter(1.1):
               (control.highlighted || control.checked ? Style.backColor3.darker(1.1) :
               Style.backColor3)
        property int minspace:
            Math.min(control.leftPadding-control.leftInset,control.rightPadding-control.rightInset,
                     control.topPadding-control.topInset,control.bottomPadding-control.bottomInset)
        border.width: (control.enabled && control.hovered&&!control.down&&!control.flat )?minspace*0.4*Style.thickScale/Style.Scale.Full:0
        border.color: Style.frontColor3
        radius: control.radius
    }


}
