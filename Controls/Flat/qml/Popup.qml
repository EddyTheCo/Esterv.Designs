pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Esterv.Styles.Simple

T.Popup {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    padding: 6*Style.paddingScale

    background: Rectangle {
        color: Style.backColor2
        radius: Math.min(width,height)*0.1*Style.roundedScale/Style.Scale.Full
    }

    T.Overlay.modal: Rectangle {
        color: Color.transparent(control.palette.shadow, 0.5)
    }

    T.Overlay.modeless: Rectangle {
        color: Color.transparent(control.palette.shadow, 0.12)
    }
}
