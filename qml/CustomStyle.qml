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

    property color frontColor1: "white"
    property color frontColor2: "#1998ff"
    property color frontColor3: "#a8a8a8"

    property color midColor1: "#a8a8a8"
    property color midColor2: "#a8a8a8"
    property color midColor3: "#a8a8a8"

    property color backColor1: "#10141c"
    property color backColor2: "#00050d"
    property color backColor3: "#0568fd"


    property Rectangle background1;
    property Rectangle background2;
    property Rectangle background3;
    property Rectangle background4;


}
