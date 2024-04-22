import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Esterv.Styles.Simple

T.TextArea {
    id: control

    implicitWidth: Math.max(contentWidth + leftPadding + rightPadding, implicitBackgroundWidth + leftInset + rightInset, placeholder.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(contentHeight + topPadding + bottomPadding, implicitBackgroundHeight + topInset + bottomInset, placeholder.implicitHeight + topPadding + bottomPadding)

    padding: 6
    leftPadding: padding + 4

    opacity: (control.enabled) ? 1.0 : 0.7
    color: Style.frontColor2
    selectionColor: Style.backColor3
    selectedTextColor: Style.frontColor1
    placeholderTextColor: Style.frontColor3

    PlaceholderText {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)

        text: control.placeholderText
        font: control.font
        color: control.placeholderTextColor
        verticalAlignment: control.verticalAlignment
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
        elide: Text.ElideRight
        renderType: control.renderType
    }
    property int minspace: Math.min(control.leftPadding - control.leftInset, control.rightPadding - control.rightInset, control.topPadding - control.topInset, control.bottomPadding - control.bottomInset)
    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 100
        color: Style.backColor3
        radius: Math.min(width, height) * 0.4 * Style.roundedScale / Style.Scale.Full
        Rectangle {
            id: botomline
            width: (parent.width - parent.radius) * 0.8
            height: 1
            anchors.verticalCenter: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            color: Style.frontColor3
        }
        Rectangle {
            width: (parent.width - parent.radius) * 0.8 * ((control.activeFocus) ? 1.0 : 0.4)
            Behavior on width {
                SmoothedAnimation {
                    velocity: 200
                }
            }
            height: 4
            anchors.verticalCenter: botomline.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: Style.frontColor3
            radius: Math.min(width, height)
            visible: control.enabled
        }
    }
}
