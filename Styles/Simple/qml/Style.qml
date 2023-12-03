pragma Singleton
import QtQuick 2.15

QtObject {
    property font h1:
    Qt.font({
                pointSize:40
            })
    property font h2:
    Qt.font({
                pixelSize: 30
            })
    property font h3:
    Qt.font({
                pixelSize:15
            })
    property font h4:
    Qt.font({
                pixelSize:12
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

    property int roundedScale: Style.Scale.Medium;
    property int thickScale: Style.Scale.ExtraSmall;
    property int paddingScale: Style.Scale.Medium;
    property int theme: Style.Theme.Dark

    /* Dark theme from light to dark */
    /* Light theme from dark to light */
    property color frontColor1: (Style.theme)?"#10141c":"#fdfdfd" //large areas
    property color frontColor2: (Style.theme)?"#27282a":"#d9d9d9" //medium areas
    property color frontColor3: (Style.theme)?"#176B87":"#9e9e9e" //small areas

    Behavior on frontColor1 { ColorAnimation { duration: 1000 } }
    Behavior on frontColor2 { ColorAnimation { duration: 1000 } }
    Behavior on frontColor3 { ColorAnimation { duration: 1000 } }


    property color midColor1: "#fdfdfd"
    property color midColor2: "#F4BF96"
    property color midColor3: (Style.theme)?"#b0e5f7":"#a8a8a8"


    /* from light to dark */
    property color backColor1: (Style.theme)?"#FFF0F5":"#232D3F" //large areas
    property color backColor2: (Style.theme)?"#FFD1DA":"#27282a" //medium areas
    property color backColor3: (Style.theme)?"#FBA1B7":"#10141c" //small areas


    Behavior on backColor1 { ColorAnimation { duration: 1000 } }
    Behavior on backColor2 { ColorAnimation { duration: 1000 } }
    Behavior on backColor3 { ColorAnimation { duration: 1000 } }



    /*Backgrounds rectangle to use for controls. Higher index = higher z */

    property Rectangle background1;
    property Rectangle background2;
    property Rectangle background3;

}


