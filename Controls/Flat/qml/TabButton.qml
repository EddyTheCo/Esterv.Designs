import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Esterv.Styles.Simple

T.TabButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitContentHeight + topPadding + bottomPadding)

    padding: 6
    spacing: 6

    icon.width: 24
    icon.height: 24
    icon.color: checked ? Style.frontColor2 : Style.frontColor3

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.checked ? Style.frontColor2 : Style.frontColor3
    }

    background: Rectangle {
        implicitHeight: 40
        color: Color.blend(control.checked ? Style.backColor2 : Style.backColor3, Style.frontColor3, control.down ? 0.5 : 0.0)
    }
}
