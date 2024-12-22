pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Templates as T
import Esterv.Styles.Simple
import QtQuick.Controls

T.ComboBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitContentHeight + topPadding + bottomPadding, implicitIndicatorHeight + topPadding + bottomPadding)

    leftPadding: padding + (!control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)
    rightPadding: padding + (control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)

    delegate: ItemDelegate {
        required property var model
        required property int index

        width: ListView.view.width
        text: model[control.textRole]
        font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
    }

    indicator: Rectangle {
        implicitWidth: 32
        implicitHeight: 32
        x: control.mirrored ? control.padding : control.width - width - control.padding
        y: control.topPadding + (control.availableHeight - height) / 2
        color: control.down ? (Style.theme) ? Style.backColor3.darker(1.1) : Style.backColor3.lighter(1.1) : (control.highlighted ? Style.backColor3.darker(1.1) : Style.backColor3)

        ShaderEffect {
            width: Math.min(parent.width, parent.height) * 0.5
            height: width
            anchors.bottom: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            property var src: parent
            property color fcolor: (control.highlighted || control.flat) && control.enabled ? Style.frontColor1 : (control.enabled ? Style.frontColor2 : Style.frontColor3)
            property real iTime: control.popup.visible ? 0.0 : 1.0
            Behavior on iTime {
                SmoothedAnimation {
                    velocity: 3.0
                }
            }
            property var pixelStep: Qt.vector2d(1 / src.width, 1 / src.height)
            fragmentShader: "qrc:/esterVtech.com/imports/Designs/frag/hollowArrowHead.frag.qsb"
        }
        ShaderEffect {
            width: Math.min(parent.width, parent.height) * 0.5
            height: width
            anchors.top: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            property var src: parent
            property color fcolor: (control.highlighted || control.flat) && control.enabled ? Style.frontColor1 : (control.enabled ? Style.frontColor2 : Style.frontColor3)
            property real iTime: control.popup.visible ? 1.0 : 0.0
            Behavior on iTime {
                SmoothedAnimation {
                    velocity: 3.0
                }
            }
            property var pixelStep: Qt.vector2d(1 / src.width, 1 / src.height)
            fragmentShader: "qrc:/esterVtech.com/imports/Designs/frag/hollowArrowHead.frag.qsb"
        }
        opacity: enabled ? 1 : 0.3
    }

    contentItem: T.TextField {
        leftPadding: !control.mirrored ? 12 : control.editable && activeFocus ? 3 : 1
        rightPadding: control.mirrored ? 12 : control.editable && activeFocus ? 3 : 1
        topPadding: 6 - control.padding
        bottomPadding: 6 - control.padding

        text: control.editable ? control.editText : control.displayText

        enabled: control.editable
        autoScroll: control.editable
        readOnly: control.down
        inputMethodHints: control.inputMethodHints
        validator: control.validator
        selectByMouse: control.selectTextByMouse

        color: Style.frontColor2
        selectionColor: Style.backColor3
        selectedTextColor: Style.frontColor1
        placeholderTextColor: Style.frontColor3
        verticalAlignment: Text.AlignVCenter

        background: Item {
            implicitWidth: 200
            implicitHeight: 40
            Rectangle {
                id: botomline
                width: parent.width
                height: 1
                anchors.bottom: parent.bottom
                color: Style.frontColor3
            }
            Rectangle {
                width: parent.width * ((control.activeFocus) ? 1.0 : 0.4)
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

    background: Rectangle {
        implicitWidth: 140
        implicitHeight: 40

        color: "transparent"
        visible: !control.flat || control.down
    }

    popup: T.Popup {
        y: control.height
        width: control.width
        height: Math.min(contentItem.implicitHeight, control.Window.height - topMargin - bottomMargin)
        topMargin: 6
        bottomMargin: 6

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0

            Rectangle {
                z: 10
                width: parent.width
                height: parent.height
                color: "transparent"
                border.color: Style.frontColor1
            }

            T.ScrollIndicator.vertical: ScrollIndicator {}
        }

        background: Rectangle {
            color: Style.backColor3
        }
    }
}
