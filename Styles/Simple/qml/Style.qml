pragma Singleton
import QtQuick 2.15

QtObject {
    id: control
    property font h1: Qt.font({
            pointSize: 40
        })
    property font h2: Qt.font({
            pixelSize: 30
        })
    property font h3: Qt.font({
            pixelSize: 20
        })
    property font h4: Qt.font({
            pixelSize: 16
        })
    property font p: Qt.font({
            pixelSize: 12
        })

    enum Theme {
        Dark,
        Light
    }

    enum Scale {
        Not,
        ExtraSmall,
        Small,
        Medium,
        Large,
        ExtraLarge,
        Full
    }

    property int roundedScale: Style.Scale.ExtraSmall
    property int thickScale: Style.Scale.ExtraSmall
    property real paddingScale: Style.Scale.Small
    property int theme: Style.Theme.Dark

    /* Dark theme from light to dark */
    /* Light theme from dark to light */
    property color frontColor1: (control.theme) ? "#10141c" : "#fdfdfd" //small areas
    property color frontColor2: (control.theme) ? "#27282a" : "#d9d9d9" //medium areas
    property color frontColor3: (control.theme) ? "#176B87" : "#9e9e9e" //large areas

    Behavior on frontColor1 {
        ColorAnimation {
            duration: 1000
        }
    }
    Behavior on frontColor2 {
        ColorAnimation {
            duration: 1000
        }
    }
    Behavior on frontColor3 {
        ColorAnimation {
            duration: 1000
        }
    }

    property color midColor1: "#F4BF96"
    property color midColor2: "#F4BF96"
    property color midColor3: (control.theme) ? "#b0e5f7" : "#a8a8a8"

    /* from light to dark */
    property color backColor1: (control.theme) ? "#FFF0F5" : "#232D3F" //large areas
    property color backColor2: (control.theme) ? "#FFD1DA" : "#27282a" //medium areas
    property color backColor3: (control.theme) ? "#FBA1B7" : "#10141c" //small areas

    Behavior on backColor1 {
        ColorAnimation {
            duration: 1000
        }
    }
    Behavior on backColor2 {
        ColorAnimation {
            duration: 1000
        }
    }
    Behavior on backColor3 {
        ColorAnimation {
            duration: 1000
        }
    }
}
