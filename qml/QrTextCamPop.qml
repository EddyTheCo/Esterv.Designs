import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts
import MyDesigns
import QtQrDec

Popup
{
    id:popup_
    property alias description:tfield.description;
    property alias placeholderText:tfield.placeholderText;

    signal clicked(string data);

    onClosed: qrscanner.stop();
    onOpened:{
        tfield.text="";
        qrscanner.visible=false;
    }

    background: Rectangle
    {
        id:bck
        color:CustomStyle.backColor1
        border.width:1
        border.color:CustomStyle.frontColor1
        radius:Math.min(width,height)*0.05
    }
    ColumnLayout
    {
        anchors.fill: parent
        MyTextField
        {
            id:tfield
            Layout.alignment: Qt.AlignHCenter
            Layout.margins:  20
            Layout.fillWidth: true
            Layout.maximumWidth:250
            focus:true
            qrfill:true
            onFillqr:
            {
                qrscanner.start();
                qrscanner.visible=true;

            }
        }
        QrCam
        {
            id:qrscanner
            Layout.alignment: Qt.AlignCenter
            Layout.margins:  5
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumWidth:100
            Layout.minimumHeight: 200
            Layout.maximumWidth:  300
            visible:false
            showClose:true
            onGotdata: (data)=> {
                           qrscanner.stop();
                           qrscanner.visible=false;
                           tfield.text=data;
                       }
        }
        MyButton
        {
            id:send
            Layout.alignment: Qt.AlignRight
            Layout.margins:  15
            enabled: tfield.text
            onClicked:
            {
                popup_.close();
                popup_.clicked(tfield.text);
            }
            text:qsTr("Ok")
        }

    }
}
