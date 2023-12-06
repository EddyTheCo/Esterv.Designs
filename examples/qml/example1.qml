
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Esterv.Styles.Simple
import Esterv.CustomControls

ApplicationWindow {
    visible: true
    id:window

    background:Rectangle
    {
        color:Style.backColor1
    }

    GridLayout
    {
        anchors.fill:parent
        columns:4


        Button
        {
            text:"Button"
            font.pixelSize: 20
        }
        Button
        {
            text:"Button"
            enabled: false
            font.pixelSize: 20
        }
        Button
        {
            text:"Button"
            font.pixelSize: 20
            flat:true
        }
        Button
        {
            text:"Button"
            font.pixelSize: 30
        }
        Button
        {
            text:"Button"
            font.pixelSize: 60
            highlighted: true
        }
        PrevButton
        {
            Layout.maximumWidth: 100
            Layout.maximumHeight: 100
            Layout.fillHeight: true
            Layout.fillWidth: true
            flat:true
        }
        NextButton
        {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 100
            Layout.maximumHeight: 100
            highlighted: true
        }
        PrevButton
        {
            Layout.maximumWidth: 100
            Layout.maximumHeight: 100
            Layout.fillHeight: true
            Layout.fillWidth: true
            flat:true
            enabled: false
        }
        NextButton
        {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 100
            Layout.maximumHeight: 100
            highlighted: true
            enabled: false
        }
        PrevButton
        {
            shaderIcon:"filledArrowHead"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 50
            Layout.maximumHeight: 50
            highlighted: true
        }

        NextButton
        {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 50
            Layout.maximumHeight: 50
            shaderIcon:"filledArrowHead"
            flat:true
        }
        PrevButton
        {
            shaderIcon:"filledArrowHead"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 50
            Layout.maximumHeight: 50
            highlighted: true
            enabled:false
        }

        NextButton
        {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 50
            Layout.maximumHeight: 50
            shaderIcon:"filledArrowHead"
            flat:true
            enabled: false
        }


        ThemeSwitch
        {

        }
        CloseButton
        {
            Layout.preferredHeight: 100
            Layout.preferredWidth: 100
        }
        CloseButton
        {
            flat:true
            Layout.preferredHeight: 50
            Layout.preferredWidth: 50
        }
        CloseButton
        {
            enabled:false
            Layout.preferredHeight: 50
            Layout.preferredWidth: 50
        }
        CloseButton
        {
            enabled:false
            flat:true
            Layout.preferredHeight: 100
            Layout.preferredWidth: 100
        }
        Switch
        {
            text:"MySwitch"
        }
    }


}
