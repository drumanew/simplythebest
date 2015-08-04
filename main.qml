import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import Qt.labs.folderlistmodel 2.1

ApplicationWindow {
    signal connectToServer(string server)
    signal disconnectFromServer()
    signal cdDir(string dir)

    function addServerFile(name, isDir) {
        serverFilesListModel.append({ fileName: name, fileIsDir: isDir })
    }

    property alias serverNameText: serverName.text
    property alias state: statusLabel.text

    id: mainWindow
    objectName: "mainWindow"
    title: qsTr("simplythebest FTP client")
    width: 800
    height: 640
    visible: true
    color: "#edd2a4"
    opacity: 1

    Rectangle {
        width: 800
        height: 640
        visible: true
        gradient: Gradient {
            GradientStop { position: 0; color: "#edd2a4" }
            GradientStop { position: 0.997; color: "#96d76c" }
        }
        ListView {
            id: clientFiles
            objectName: "clientFiles"
            x: 135
            y: 179
            width: 250
            height: 400
            cacheBuffer: 319

            model: folderModel
            delegate: clientFileDelegate
        }
        ListView {
            id: serverFiles
            objectName: "serverFiles"
            x: 481
            y: 179
            width: 250
            height: 400
            cacheBuffer: 319
            model: serverFilesListModel
            delegate: serverFileDelegate
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
        TextField {
            id: serverName
            objectName: "serverName"
            x: 135
            y: 28
            width: 413
            height: 25
            text: "ftp.plgn.ru"
            z: 2
            font.bold: true
            font.family: "Courier"
            font.pointSize: 12
            style: TextFieldStyle {
                background:
                    Rectangle {
                        gradient: Gradient {
                            GradientStop {
                                position: 0
                                color: "#c7f4ab"
                            }
                            GradientStop {
                                position: 1
                                color: "#a1e476"
                            }
                        }
                    }
            }

        }
        Label {
            id: statusLabel
            x: 135
            y: 83
            width: 427
            height: 25
            text: qsTr("Unconnected.")
            font.bold: true
            font.family: "Courier"
            font.pointSize: 12
        }
        Label {
            id: label3
            x: 135
            y: 133
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
            x: 481
            y: 133
            width: 250
            height: 25
            text: qsTr("Server files")
            horizontalAlignment: Text.AlignHCenter
            font.family: "Courier"
            font.bold: true
            font.pointSize: 12
        }
        Rectangle {
            id: connect
            x: 592
            y: 15
            width: 64
            height: 51
            color: "#00000000"
            z: 1
            Image{
                id: connectIcon
                y: -6
                width: 64
                height: 64
                anchors.horizontalCenterOffset: 2
                source: "icons/network.png"
                anchors.horizontalCenter: parent.horizontalCenter
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.source = "icons/networkOnHover.png"
                    onClicked: {
                        mainWindow.connectToServer(serverNameText);
                        parent.source = "icons/networkOnClick.png"
                    }
                    onExited: parent.source = "icons/network.png"
                }
            }

        }
        Rectangle {
            id: disconnect
            x: 695
            y: 15
            width: 66
            height: 51
            color: "#00000000"
            z: 1
            Image{
                id: disconnectIcon
                y: -6
                width: 64
                height: 64
                anchors.horizontalCenterOffset: 1
                source: "icons/disconnect.png"
                anchors.horizontalCenter: parent.horizontalCenter
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.source = "icons/disconnectOnHover.png"
                    onClicked: {
                        parent.source = "icons/disconnectOnClick.png"
                        mainWindow.disconnectFromServer()
                        serverFilesListModel.clear()
                    }
                    onExited: parent.source = "icons/disconnect.png"
                }
            }
        }
        Rectangle {
            id: upload
            x: 401
            y: 295
            width: 66
            height: 51
            color: "#00000000"
            z: 1
            Image{
                id: uploadIcon
                y: -6
                width: 64
                height: 64
                anchors.horizontalCenterOffset: 1
                source: "icons/uploadDocument.png"
                anchors.horizontalCenter: parent.horizontalCenter
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.source = "icons/uploadDocumentOnHover.png"
                    onClicked: parent.source = "icons/uploadDocumentOnClick.png"
                    onExited: parent.source = "icons/uploadDocument.png"
                }
            }
        }
        Rectangle {
            id: download
            x: 401
            y: 400
            width: 66
            height: 51
            color: "#00000000"

            z: 1

            Image{
                id: downloadIcon
                y: -6
                width: 64
                height: 64
                anchors.horizontalCenterOffset: 1
                source: "icons/downloadDocument.png"
                anchors.horizontalCenter: parent.horizontalCenter
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered:
                        parent.source = "icons/downloadDocumentOnHover.png"
                    onClicked: {
                        parent.source = "icons/downloadDocumentOnClick.png"
                    }
                    onExited: parent.source = "icons/downloadDocument.png"
            }
            }


        }
        Label {
            id: label5
            x: 592
            y: 72
            text: qsTr("Connect")
            horizontalAlignment: Text.AlignHCenter
            font.family: "Courier"
            font.pointSize: 12
            font.italic: false
            font.bold: true
        }
        Label {
            id: label6
            x: 680
            y: 72
            text: qsTr("Disconnect")
            horizontalAlignment: Text.AlignHCenter
            font.family: "Courier"
            font.pointSize: 12
            font.italic: false
            font.bold: true
        }
        Label {
            id: label7
            x: 404
            y: 271
            text: qsTr("Upload")
            font.italic: false
            font.pointSize: 12
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.family: "Courier"
        }
        Label {
            id: label8
            x: 394
            y: 457
            text: qsTr("Download")
            font.italic: false
            font.pointSize: 12
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.family: "Courier"
        }

    }

    FolderListModel {
        id: folderModel
        folder: "/home/mkhotko"
        showDirs: true
        showDotAndDotDot: true
    }

    ListModel {
        id: serverFilesListModel
        objectName: "serverFilesListModel"
    }

    Component {
        id: clientFileDelegate
        Rectangle {
            width: 250
            height: 25
            radius: 5
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#edd2a4"
                }
                GradientStop {
                    position: 1
                    color: clientFiles.currentIndex === index ? "#a1e476" : "#ffa474"
                }
            }
            Text { x: 0; width:25; text: fileIsDir ? "d" : "f" }
            Text { x: 25; width: 215; text: fileName }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    clientFiles.currentIndex = index
                }
                onDoubleClicked: {
                    if (fileIsDir) {
                        folderModel.folder = fileURL
                    }
                }
            }

        }
    }

    Component {
        id: serverFileDelegate
        Rectangle {
            width: 250
            height: 25
            radius: 5
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#edd2a4"
                }
                GradientStop {
                    position: 1
                    color: serverFiles.currentIndex === index ? "#a1e476" : "#ffa474"
                }
            }
            Text { x: 0; width:25; text: fileIsDir ? "d" : "f" }
            Text { x: 25; width: 215; text: fileName }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    serverFiles.currentIndex = index
                }
                onDoubleClicked: {
                    var name = fileName;
                    if (fileIsDir) {
                        serverFilesListModel.clear();
                        mainWindow.cdDir(name);
                    }
                }
            }

        }
    }
}
