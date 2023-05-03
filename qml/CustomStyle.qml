pragma Singleton
import QtQuick 2.15

QtObject {
    property font h1:
    Qt.font({
        pixelSize:50
    })
    property font h2:
    Qt.font({
        pixelSize:30
    })
    property font h3:
    Qt.font({
        pixelSize:15
    })

    property color frontColor1: "white"
    property color frontColor2: "#1998ff"
    property color frontColor3: "#1998ff"

    property color backColor1: "#10141c"
    property color backColor2: "#00050d"
    property color backColor3: "#00050d"
    property color backColor4: "#00050d"

    property Rectangle background1;
    property Rectangle background2;
    property Rectangle background3;
    property Rectangle background4;


}
