import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Esterv.Styles.Simple

T.DelayButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 6
    horizontalPadding: padding + 2

    transition: Transition {
        NumberAnimation {
            duration: control.delay * (control.pressed ? 1.0 - control.progress : 0.3 * control.progress)
        }
    }

    contentItem: ItemGroup {
        ClippedText {
            clip: control.progress > 0
            clipX: -control.leftPadding + control.progress * control.width
            clipWidth: (1.0 - control.progress) * control.width
            visible: control.progress < 1

            text: control.text
            font: control.font
            opacity: enabled ? 1 : 0.3
            color: Style.frontColor2
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        ClippedText {
            clip: control.progress > 0
            clipX: -control.leftPadding
            clipWidth: control.progress * control.width
            visible: control.progress > 0

            text: control.text
            font: control.font
            opacity: enabled ? 1 : 0.3
            color: Style.frontColor1
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        color: Color.blend(Style.backColor3, Style.backColor2, control.down ? 0.5 : 0.0)
        border.color: Style.frontColor3
        property int minspace:
            Math.min(control.leftPadding-control.leftInset,control.rightPadding-control.rightInset,
                     control.topPadding-control.topInset,control.bottomPadding-control.bottomInset)
        border.width: (control.enabled && control.hovered&&!control.down)?minspace*Style.thickScale/Style.Scale.Full:0

        PaddedRectangle {
            padding: control.visualFocus ? 2 : 0
            width: control.progress * parent.width
            height: parent.height
            color: Color.blend(Style.backColor2, Style.backColor1, control.down ? 0.5 : 0.0)
        }
        radius: Math.min(width,height)*Style.roundedScale/Style.Scale.Full
    }
}
