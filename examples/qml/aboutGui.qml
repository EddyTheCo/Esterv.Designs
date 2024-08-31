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
        ThemeSwitch {
            Layout.alignment: Qt.AlignCenter
        }
        About {
            Layout.fillHeight: true
            Layout.fillWidth: true
            logo: "https://eddytheco.github.io/NftMinter/img/esterlogo.png"
            description: "Esto es una prueva the una descripcion\nEsto es otra linea en la description"
        }
    }
}
