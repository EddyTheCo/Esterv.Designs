import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Esterv.Styles.Simple
import Esterv.AboutEstervDesigns
import Esterv.CustomControls

ApplicationWindow {
    id: window
    visible: true

    background: Rectangle {
        color: Style.backColor1
    }

    ColumnLayout {
        anchors.fill: parent
        About {
            Layout.fillHeight: true
            Layout.fillWidth: true
            logo: "https://eddytheco.github.io/Esterv.Crypto.NFTWallet/img/esterlogo.png"
            description: "This a custom Control that uses CMake variables \nto show information about the application"
        }
    }
}
