import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Esterv.Styles.Simple

T.TextField {
    id: control

    implicitWidth: implicitBackgroundWidth + leftInset + rightInset
                   || Math.max(contentWidth, placeholder.implicitWidth) + leftPadding + rightPadding
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding,
                             placeholder.implicitHeight + topPadding + bottomPadding)

    padding: 6

    opacity:(control.enabled)?1.0:0.7
    color: Style.frontColor2
    selectionColor: Style.backColor3
    selectedTextColor: Style.frontColor1
    placeholderTextColor: Style.frontColor3
    verticalAlignment: TextInput.AlignVCenter

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

    background: Item {
        implicitWidth: 200
        implicitHeight: 40
        Rectangle
        {
            id:botomline
            width:parent.width
            height:1
            anchors.bottom: parent.bottom
            color:Style.frontColor3
        }
        Rectangle
        {
            width:parent.width*((control.activeFocus)?1.0:0.4)
            Behavior on width { SmoothedAnimation { velocity: 200 } }
            height:4
            anchors.verticalCenter: botomline.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color:Style.frontColor3
            radius:Math.min(width,height);
            visible:control.enabled
        }
    }
}
