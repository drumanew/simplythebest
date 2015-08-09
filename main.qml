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
    signal download(string pwd, string file)

    function clearServerFiles() {
        serverFilesListModel.clear();
    }

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

    GridView
    {
        width: parent.width
        height: parent.height
        visible: true

        Image{
            id: background
            source: "icons/bg3.jpg"
            width: parent.width
            height: parent.height
             }
    }
            Rectangle {
                id: rectangleup
                x: 0
                y: -30
                width: parent.width*0.99
                height: 100
                radius: 10
                opacity: 0.6
                border.width: 0
                border.color: "#000000"
            }
            /*Rectangle {
                id: rectanglelog
                x: 70
                y: 70
                width: 490
                height: 33
                opacity: 0.7
                radius: 5
                border.width: 1
                border.color: "#000000"
            }*/
            Rectangle {
                id: rectanglecon
                x: serverName.x + serverName.width + parent.width*0.03125
                y: -30
                width: 100
                height: 122
                opacity: 0.6
                color: "#808080"
                border.width: 1
                border.color: "#000000"
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.opacity = 1
                    }
                    onClicked: {
                        serverFilesListModel.clear();
                        mainWindow.connectToServer(serverNameText);
                    }
                    onExited: {
                        parent.opacity = 0.6
                    }
                }
            }
            Rectangle {
                id: rectanglediscon
                x: rectanglecon.x + rectanglecon.width
                y: -30
                width: 108
                height: 122
                opacity: 0.6
                color: "#808080"
                border.width: 1
                border.color: "#000000"
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.opacity = 1
                    onClicked: {

                        mainWindow.disconnectFromServer()
                        serverFilesListModel.clear()
                    }

                    onExited: parent.opacity = 0.6
                }
            }
            Rectangle {
                id: rectangleyourfiles
                x: mainWindow.width*0.1525
                y: rectangledown.y
                width: parent.width*0.36125
                height: 29
                opacity: 0.9
                radius: 10
                color: "#808080"
                border.width: 1
                border.color: "#000000"
            }

            Rectangle {
                id: rectangleserverfiles
                x: rectangleyourfiles.x + mainWindow.width*0.48625
                y: rectangledown.y
                width: parent.width
                height: 29
                opacity: 0.9
                radius: 10
                color: "#808080"
                border.width: 1
                border.color: "#000000"
            }
            Rectangle {
                id: rectangleupload
                x: clientFiles.x
                y: 200
                width: mainWindow.width*0.425
                height: 85
                opacity: 0.6
                color: "#808080"
                border.width: 1
                border.color: "#000000"
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered:
                        parent.opacity = 1

                    onExited: {
                        parent.opacity = 0.6
                    }
                }
            }
            Rectangle {
                id: rectangledownload
                x: rectangleserverfiles.x - mainWindow.width*0.1
                y: 323
                width: mainWindow.width
                height: 85
                opacity: 0.6
                color: "#808080"
                border.width: 1
                border.color: "#000000"
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered:
                        parent.opacity = 1

                    onExited: {
                        parent.opacity = 0.6
                    }
                }
            }
            Rectangle {
                id: rectangledown
                x: mainWindow.width*0.1525
                y: 100
                width: parent.width
                height: 385
                color: "#ffffff"
                radius: 10
                opacity: 0.6
                border.width: 1
                border.color: "#000000"
            }
            Rectangle {
                id: rectanglelog
                x: 0
                y: rectangledown.y + rectangledown.height + 8
                width: parent.width*0.99
                height: mainWindow.height
                radius: 10
                opacity: 0.6
                border.width: 1
                border.color: "#000000"
            }

    ListView {
        id: clientFiles
        objectName: "clientFiles"
        x: rectangledown.x + 13
        y: rectangleyourfiles.y + 37
        width: 250
        height: 310
        cacheBuffer: 319
        model: folderModel
        delegate: clientFileDelegate
    }
    ListView {
        id: serverFiles
        objectName: "serverFiles"
        x: rectangleserverfiles.x
        y: rectangleyourfiles.y + 37
        width: 250
        height: 210
        cacheBuffer: 319
        model: serverFilesListModel
        delegate: serverFileDelegate
    }
    Label {
        id: ftpserverlab
        x: 11
        y: 28
        height: 25
        width: 124
        text: qsTr("FTP server:")
        font.bold: true
        font.pointSize: 12
        font.family: "Courier"
    }
    TextField {
        id: serverName
        objectName: "serverName"
        x: ftpserverlab.x + ftpserverlab.width
        y: 28
        width: parent.width*0.51625
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
            x: 100
            y: 80
            width: 427
            height: 25
            text: qsTr("Unconnected.")
            font.family: "Arial"
            font.italic: true
            font.pointSize: 11
        }
        Label {
            id: yourfileslab
            x: rectangleyourfiles.x
            y: rectangleyourfiles.y
            width: rectangleyourfiles.width
            height: rectangleyourfiles.height
            text: qsTr("Your files")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignHCenter
            font.family: "Courier"
            font.pointSize: 12
            font.italic: false
            font.bold: true
        }
        Label {
            id: serverfileslab
            x: rectangleserverfiles.x
            y: rectangleserverfiles.y
            width: rectangleserverfiles.width
            height: rectangleserverfiles.height
            text: qsTr("Server files")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignHCenter
            font.family: "Courier"
            font.italic: false
            font.bold: true
            font.pointSize: 12
            z:1
        }
        Rectangle {
            id: connect
            x: rectanglecon.x
            y: -30
            width: 100
            height: 122
            color: "#00000000"

            Image{
                id: connectIcon
                y: 40
                width: 69
                height: 69
                opacity: 1
                anchors.horizontalCenterOffset: 2
                source: "icons/network.png"
                anchors.horizontalCenter: parent.horizontalCenter

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered:
                        parent.source = "icons/networkOnHover.png"
                    onClicked: {
                        parent.source = "icons/networkOnClick.png"
                        serverFilesListModel.clear();
                        mainWindow.connectToServer(serverNameText);
                    }
                    onExited:
                        parent.source = "icons/network.png"
                }
            }
        }
        Rectangle {
            id: disconnect
            x: rectanglediscon.x
            y: -30
            width: 108
            height: 122
            color: "#00000000"
            Image{
                id: disconnectIcon
                y: 40
                width: 64
                height: 64
                opacity: 1
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
            x: rectangleupload.x + rectangleupload.width - 80
            y: rectangleupload.y + 14
            width: 66
            height: 51
            color: "#00000000"
            z: 1
            Image{
                id: uploadIcon
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
            x: rectangledownload.x + 3
            y: rectangledownload.y
            width: 66
            height: 51
            color: "#00000000"
            z: 1
            Image{
                id: downloadIcon
                width: 64
                height: 64
                anchors.horizontalCenterOffset: 1
                source: "icons/downloadDocument.png"
                anchors.horizontalCenter: parent.horizontalCenter
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.source = "icons/downloadDocumentOnHover.png"
                    onClicked: {
                        parent.source = "icons/downloadDocumentOnClick.png"
                        var file = serverFiles.currentItem.children[1].text;
                        var pwd = folderModel.folder;
                        mainWindow.download(pwd, file);
                    }
                    onExited: parent.source = "icons/downloadDocument.png"
                }
            }
        }
        Label {
            id: connectlab
            x: connect.x
            y: 72
            width: connect.width
            text: qsTr("Connect")
            horizontalAlignment: Text.AlignHCenter
            font.family: "Courier"
            font.pointSize: 12
            font.italic: false
            font.bold: true
        }
        Label {
            id: disconnectlab
            x: disconnect.x
            y: 72
            width: disconnect.width
            text: qsTr("Disconnect")
            horizontalAlignment: Text.AlignHCenter
            font.family: "Courier"
            font.pointSize: 12
            font.italic: false
            font.bold: true
        }
        Label {
            id: uploadlab
            x: upload.x
            y: upload.y - 14
            text: qsTr("Upload")
            font.italic: false
            font.pointSize: 12
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.family: "Courier"
        }
        Label {
            id: downloadlab
            x: download.x
            y: download.y + 67
            text: qsTr("Download")
            font.italic: false
            font.pointSize: 12
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.family: "Courier"
        }




    FolderListModel {
        id: folderModel
        folder: Qt.platform.os === "linux" ? "/home/" : "file:///"
        showDirs: true
        showDotAndDotDot: true
        Component.onCompleted: {
            console.log(Qt.platform.os)
        }
    }

    ListModel {
        id: serverFilesListModel
        objectName: "serverFilesListModel"
    }

    Component {
        id: clientFileDelegate
        Rectangle {
            width: mainWindow.width*0.3125
            height: 25
            radius: 5
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#ffe78f"
                }
                GradientStop {
                    position: 1
                    color: clientFiles.currentIndex === index ? "#a1e476" : "#f2dc61"
                }
            }
            Image{
                id: filesIcon
                x: 0;
                width: 25
                anchors.horizontalCenterOffset: 2;
                source: fileIsDir ? "icons/kdedocumentopen.ico" : "icons/files.ico";
            }
            Text { id: nameClientText; x: filesIcon.x + filesIcon.width; width: 215; text: " " + fileName }
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
            id: bodyRect
            width: mainWindow.width*0.3125
            height: 25
            radius: 5
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#ffe78f"
                }
                GradientStop {
                    position: 1
                    color: serverFiles.currentIndex === index ? "#a1e476" : "#f2dc61"
                }
            }
            Image{
                id: filesIcon
                x: 0;
                width:25;
                anchors.horizontalCenterOffset: 2;
                source: fileIsDir ? "icons/kdedocumentopen.ico" : "icons/files.ico";
            }

            Text { id: nameServerText; x: 25; width: 215; text: fileName }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    serverFiles.currentIndex = index
                }
                onDoubleClicked: {
                    var name = fileName;
                    if (fileIsDir) {
                        mainWindow.cdDir(name);
                    }
                }
            }

        }
    }
}
