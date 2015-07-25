import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: applicationWindow1
    title: qsTr("Hello World")
    width: 800
    height: 640
    visible: true

    Row {
        id: row1
        x: 135
        y: 162
        width: 250
        height: 400
    }

    Row {
        id: row2
        x: 429
        y: 162
        width: 250
        height: 400
    }

    Label {
        id: label1
        x: 11
        y: 28
        height: 25
        text: qsTr("FTP server:")
        font.bold: true
        font.pointSize: 12
        font.family: "Courier"
    }

    TextEdit {
        Rectangle {
            id: rectangle1
            x: 0
            y: 1
            width: 238
            height: 24
            color: "#ffffff"
            layer.enabled: true
        }
        id: textEdit1
        x: 135
        y: 28
        width: 222
        height: 25
        text: qsTr("Text Edit")
        textFormat: Text.RichText
        font.bold: true
        font.family: "Courier"
        font.pointSize: 12
    }

    Label {
        id: label2
        x: 135
        y: 71
        width: 365
        height: 25
        text: qsTr("Label")
        font.bold: true
        font.family: "Courier"
        font.pointSize: 12
    }

    Label {
        id: label3
        x: 135
        y: 116
        width: 250
        height: 25
        text: qsTr("Your files")
        horizontalAlignment: Text.AlignHCenter
        font.family: "Courier"
        font.pointSize: 12
        font.italic: false
        font.bold: true
    }

    Label {
        id: label4
        x: 429
        y: 116
        width: 250
        height: 25
        text: qsTr("Server files")
        horizontalAlignment: Text.AlignHCenter
        font.family: "Courier"
        font.bold: true
        font.pointSize: 12
    }

    ToolButton {
        id: toolButton1
        x: 411
        y: 15
        tooltip: "Connect to server"
        checkable: true
        scale: 2
        iconSource: "file:///C:%5CQt Projects%5Cicons%5Csync.png"
    }







}
