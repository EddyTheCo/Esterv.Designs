
import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Esterv.Styles.Simple

T.ToolTip {
    id: control

    x: parent ? (parent.width - implicitWidth) / 2 : 0
    y: -implicitHeight - 3

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    margins: 6
    padding: 6*Style.paddingScale

    closePolicy: T.Popup.CloseOnEscape | T.Popup.CloseOnPressOutsideParent | T.Popup.CloseOnReleaseOutsideParent

    contentItem: Text {
        text: control.text
        font: control.font
        wrapMode: Text.Wrap
        color: Style.frontColor3
    }

    background: Rectangle {
        color: Style.backColor2
        radius: Math.min(width,height)*Style.roundedScale/Style.Scale.Full
    }
}
