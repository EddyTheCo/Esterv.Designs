import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQml

Control
{
    id:control
    property int lenght:4
    property string text
    property string inputMask:"X"
    property double margins:0
    property int echoMode: 0
    signal filled

    implicitWidth:rowlayout.implicitWidth
    implicitHeight:rowlayout.implicitHeight

    onFocusChanged: {
        if(control.focus)repeater.itemAt(0).focus=true;
    }
    function getText() {
        control.text="";
        for (var i = 0; i < repeater.count; i++)  {
            control.text+=repeater.itemAt(i).text;
        }
        control.filled();
    }
    function useClipBoard() {
        stext.inputMask=control.inputMask.repeat(control.lenght);
        stext.selectAll();
        stext.paste();
        if(stext.text!==control.text&&stext.text.length===repeater.count&&stext.acceptableInput)
        {
            pastebutt.visible=true;
        }
    }
    Timer {
        id: timer
        property int cindex:0;
        interval: (control.echoMode===TextInput.PasswordEchoOnEdit)?500:0; running: false; repeat: false
        onTriggered: repeater.itemAt(timer.cindex).focus=true;
    }

    RowLayout {
        id:rowlayout
        anchors.fill: control

        Repeater {
            id:repeater
            model: control.lenght
            delegate: TextField
            {
                required property int index
                inputMask:control.inputMask
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: control.margins
                echoMode:control.echoMode
                font:control.font
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignBottom
                activeFocusOnPress:(index==0)
                activeFocusOnTab :false
                focus: (index==0)
                cursorVisible: false
                onFocusChanged: {
                    timer.stop();
                    if(focus)cursorPosition=0;
                }
                onPressAndHold: control.useClipBoard();
                onTextEdited: {
                    if(repeater.itemAt(index+1)&&acceptableInput)
                    {
                        timer.cindex=index+1;
                        timer.restart();
                    }
                    else
                    {
                        if(index===repeater.count-1&&acceptableInput)
                        {
                            control.getText();
                        }
                    }
                }


            }
        }
    }

    TextInput
    {
        id:stext
        visible:false
    }
    MouseArea {
        anchors.fill: parent
        onClicked:
        {
            timer.stop();
            repeater.itemAt(0).focus=true;
            pastebutt.visible=false;
        }
        onPressAndHold: control.useClipBoard();

    }

    Button
    {
        id:pastebutt
        anchors.centerIn: parent
        visible:false
        text: qsTr("Paste")
        onClicked:
        {
            var ccount=0;
            for (var i = 0; i < repeater.count; i++)  {
                repeater.itemAt(i).text=stext.text.charAt(i);
                if(repeater.itemAt(i).acceptableInput)
                    ccount++;

            }
            if(ccount===repeater.count)
                control.getText();

        }
        Timer {
            id: btimer
            interval: 5000; running: false; repeat: false
            onTriggered: pastebutt.visible=false;
        }
        onVisibleChanged:
        {
            if(pastebutt.visible)btimer.restart();
        }

    }
}
