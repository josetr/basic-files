import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    width: 360
    height: 240
    visible: true
    title: "Basic Files"

    ListView {
        anchors.fill: parent
        model: ["todo", "doing", "done"]
        delegate: Label {
            required property string modelData
            text: modelData.toUpperCase()
            padding: 12
        }
    }
}
