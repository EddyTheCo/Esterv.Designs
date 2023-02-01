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

        Text
        {
            id:notice_
            text: popup.descr_
            color:"white"
            font.pointSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.minimumHeight: 75
            Layout.maximumHeight: 150
            Layout.preferredWidth: 400
            Layout.minimumWidth: 300
            Layout.maximumWidth: 500
            Layout.fillHeight:  true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            wrapMode:Text.WordWrap
        }

        MyAddressQr
        {
            color:'lightyellow'
            addr_:popup.addr_
            url_:popup.url_
            Layout.preferredWidth: 300
            Layout.minimumWidth: 100
            Layout.maximumWidth: 500
            Layout.preferredHeight: width
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
        }
    }



}

