import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Esterv.Styles.Simple
import Esterv.CustomControls

ApplicationWindow {
    id: window
    visible: true

    background: Rectangle {
        color: Style.backColor1
    }
    GridLayout {
        anchors.fill: parent
        columns: 4

        ThemeSwitch {}
        PinPad {
            id: pinPad
            font.pointSize: 20
            margins: 10
            inputMask: "DDDD"
        }

        Button {
            text: pinPad.text
            font.pixelSize: 20
        }
        PrevButton {
            Layout.maximumWidth: 100
            Layout.maximumHeight: 100
            Layout.fillHeight: true
            Layout.fillWidth: true
            flat: true
        }
        NextButton {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 100
            Layout.maximumHeight: 100
            highlighted: true
        }
        PrevButton {
            Layout.maximumWidth: 100
            Layout.maximumHeight: 100
            Layout.fillHeight: true
            Layout.fillWidth: true
            flat: true
            enabled: false
        }
        NextButton {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 100
            Layout.maximumHeight: 100
            highlighted: true
            enabled: false
        }
        PrevButton {
            shaderIcon: "filledArrowHead"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 50
            Layout.maximumHeight: 50
            highlighted: true
        }

        NextButton {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 50
            Layout.maximumHeight: 50
            shaderIcon: "filledArrowHead"
            flat: true
        }
        PrevButton {
            shaderIcon: "filledArrowHead"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 50
            Layout.maximumHeight: 50
            highlighted: true
            enabled: false
        }

        NextButton {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 50
            Layout.maximumHeight: 50
            shaderIcon: "filledArrowHead"
            flat: true
            enabled: false
        }

        CloseButton {
            Layout.preferredHeight: 100
            Layout.preferredWidth: 100
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("This tool tip is shown ")
        }
        CloseButton {
            flat: true
            Layout.preferredHeight: 50
            Layout.preferredWidth: 50
        }
        CloseButton {
            enabled: false
            Layout.preferredHeight: 50
            Layout.preferredWidth: 50
        }
        CloseButton {
            enabled: false
            flat: true
            Layout.preferredHeight: 100
            Layout.preferredWidth: 100
        }
    }
}
