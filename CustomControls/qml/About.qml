import QtQuick.Layouts
import QtQuick.Controls
import QtQuick
import Esterv.CustomControls

Item {
    id: control
    property string description
    property url logo
    property string version
    property string name

    RowLayout {
        anchors.fill: parent
        Item {
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumWidth: parent.width * 0.4

            Image {
                id: logo
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                width: parent.width * 0.95
                //height:parent.height*0.95
                fillMode: Image.PreserveAspectFit
                source: control.logo
                visible: control.logo.toString().length
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumWidth: 100
            Label {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text:((control.name.length)?control.name:AboutThis.name) + " " + ((control.version.length)?control.version:AboutThis.version)
                fontSizeMode: Text.Fit
                font.pointSize: 250
                font.bold: true
            }
            Label {
                Layout.fillWidth: true
                Layout.fillHeight: true
                fontSizeMode: Text.Fit
                font.pointSize: 250
                text: qsTr("Based on ") + AboutThis.buildArch
            }
            Label {
                Layout.fillWidth: true
                Layout.fillHeight: true
                fontSizeMode: Text.Fit
                font.pointSize: 250
                text: qsTr("Built on ") + AboutThis.buildTime
            }
            Label {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr(control.description)
                fontSizeMode: Text.Fit
                font.pointSize: 250
                visible: control.description.toString().length
            }
        }
    }
}
