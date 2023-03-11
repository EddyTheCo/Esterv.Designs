import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts

Popup {
    id: popup
    required property string addr_
    property string url_
    required property string descr_
    modal: true
    focus: true
    background:Rectangle
    {
        color:"#0f171e"
        border.width: 2
        border.color: "white"
        radius:8
    }
    ColumnLayout
    {
        anchors.fill: parent

        TextEdit
        {
            id:notice_
            text: popup.descr_
            color:"white"
            readOnly: true
            selectByMouse: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.maximumWidth: 350
            Layout.fillHeight:  true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
            wrapMode:Text.WrapAnywhere
        }

        MyAddressQr
        {
            id:qrcode
            color:'lightyellow'
            addr_:popup.addr_
            url_:popup.url_
            Layout.maximumWidth: 200
            Layout.preferredHeight: width
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
        }
    }



}

