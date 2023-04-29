import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts

Popup {
    id: root
    required property string address;
    property string url;
    required property string description;
    property alias qrcode:qrcode_;

    modal: true
    focus: true

    ColumnLayout
    {
        anchors.fill: parent
        spacing:20
        MyTextArea
        {
            Layout.fillHeight:  true
            Layout.fillWidth: true
            Layout.minimumWidth: 300
            Layout.minimumHeight: 150
            Layout.alignment: Qt.AlignTop|Qt.AlignHCenter

            label.visible: false
            textarea.text: root.description
            textarea.readOnly: true
        }

        MyAddressQr
        {
            id:qrcode_
            address:root.address
            url:root.url
            Layout.minimumWidth: 250
            Layout.preferredHeight: width
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
        }
    }



}

