import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQml

Control
{
    id:control
    property string text
    property string inputMask:"XXXX"
    property double margins:0
    property int echoMode: 0
    property int inputMethodHints: Qt.ImhDigitsOnly

    implicitWidth:rowlayout.implicitWidth
    implicitHeight:rowlayout.implicitHeight
    focus:true


    onFocusChanged: {
        if(control.focus)repeater.itemAt(0).focus=true;
    }
    function getText() {
        stext.text="";
        for (var i = 0; i < repeater.count; i++)  {
            stext.text+=repeater.itemAt(i).text;
        }
        if(stext.text!==control.text&&stext.text.length===repeater.count&&stext.acceptableInput)
        {
            control.text=stext.text;
            control.textChanged();
        }

    }
    function setText(vtext) {
        stext.inputMask=control.inputMask.repeat(control.lenght);

        if(vtext==="")
        {
            stext.selectAll();
            stext.paste();
        }
        else
        {
            stext.text=vtext;
        }
        return (stext.text!==control.text&&stext.text.length===repeater.count&&stext.acceptableInput)
    }
    function useStext(){
        var ccount=0;
        for (var i = 0; i < repeater.count; i++)  {
            repeater.itemAt(i).text=stext.text.charAt(i);
            if(repeater.itemAt(i).acceptableInput)
                ccount++;

        }
        if(ccount===repeater.count)
            control.getText();
    }

    function useClipBoard() {

        if(control.setText(""))
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
            model: control.inputMask.length
            delegate: TextField
            {
                id:tdel
                required property int index
                inputMask:control.inputMask.charAt(tdel.index)
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: control.margins
                echoMode:control.echoMode
                inputMethodHints:control.inputMethodHints
                font:control.font
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignBottom
                cursorVisible: false


                Keys.onPressed: (event)=> {
                                    if (event.key === Qt.Key_Backspace) {
                                        if(tdel.cursorPosition===0&&tdel.index)
                                        {
                                            repeater.itemAt(index-1).focus=true;
                                        }
                                    }
                                    if (event.matches(StandardKey.Paste))
                                    {
                                        if(control.setText(""))
                                        {
                                            control.useStext();
                                        }

                                        event.accepted = true;
                                    }
                                }


                onFocusChanged: {
                    timer.stop();
                    if(tdel.focus)tdel.cursorPosition=0;
                }
                onPressAndHold: control.useClipBoard();

                onTextEdited: {

                    if(tdel.acceptableInput)
                    {

                        if(repeater.itemAt(index+1))
                        {
                            timer.cindex=index+1;
                            timer.restart();
                        }
                        control.getText();
                    }

                }


            }
        }
    }

    TextInput
    {
        id:stext
        visible:false
        inputMask: control.inputMask
    }

    Button
    {
        id:pastebutt
        anchors.centerIn: parent
        visible:false
        text: qsTr("Paste")
        onClicked: control.useStext();
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
