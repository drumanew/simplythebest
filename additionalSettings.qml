import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import Qt.labs.folderlistmodel 2.1

ApplicationWindow{
    id: additionalSettings
    objectName: "additionalSettings"
    title: qsTr("Additional settings")
    width: 400
    height: 200
    visible: true
    color: "#edd2a4"
    opacity: 1

Component.onCompleted: {
    additionalSettings.show();
    portnum.text = mainWindow.port;
    loginname.text = mainWindow.username;
    passwordname.text = mainWindow.password;
}

Label {
    id: port
    x: 10
    y: additionalSettings.height*0.2
    height: additionalSettings.height*0.2 - 4
    width: 105
    text: qsTr("Port:")
    font.bold: true
    font.pointSize: 12
    font.family: "Courier"
    horizontalAlignment: Text.AlignLeft
    verticalAlignment: Text.AlignVCenter
}
Label {
    id: login
    x: 10
    y: additionalSettings.height*0.4
    height: port.height
    width: 105
    text: qsTr("Login:")
    font.bold: true
    font.pointSize: 12
    font.family: "Courier"
    horizontalAlignment: Text.AlignLeft
    verticalAlignment: Text.AlignVCenter
}
Label {
    id: pass
    x: 10
    y: additionalSettings.height*0.6
    height: port.height
    width: 105
    text: qsTr("Password:")
    font.bold: true
    font.pointSize: 12
    font.family: "Courier"
    horizontalAlignment: Text.AlignLeft
    verticalAlignment: Text.AlignVCenter
}
TextField {
    id: portnum
    objectName: "portnum"
    x: port.x + port.width
    y: port.y
    width: parent.width*0.95 - port.width
    height: port.height
    text: "21"
    z: 2
    font.bold: true
    font.family: "Courier"
    font.pointSize: 12
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
}
TextField {
    id: loginname
    objectName: "loginname"
    x: port.x + port.width
    y: login.y
    width: parent.width*0.95 - port.width
    height: port.height
    z: 2
    font.bold: true
    font.family: "Courier"
    font.pointSize: 12
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
}
TextField {
    id: passwordname
    objectName: "passwordnamename"
    x: port.x + port.width
    y: pass.y
    width: parent.width*0.95 - port.width
    height: port.height
    z: 2
    font.bold: true
    font.family: "Courier"
    font.pointSize: 12
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
}

Rectangle {
    id: button
    x: 100
    y: 167
    width: 200
    height: 23
    color: "#ffffff"
    opacity : 0.6
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered:
            parent.opacity = 1
        onExited: {
            parent.opacity = 0.6
        }
        onClicked: {
            mainWindow.username = loginname.text;
            mainWindow.password = passwordname.text;
            mainWindow.port = portnum.text;
            mainWindow.settingsActive = false;
            additionalSettings.close();
        }
    }
}
Label {
    id: buttonok
    x: button.x
    y: button.y
    width: button.width
    height: button.height
    text: qsTr("OK")
    font.bold: true
    font.pointSize: 12
    font.family: "Courier"
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
}

}

