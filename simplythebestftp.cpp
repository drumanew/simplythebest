#include "simplythebestftp.h"

simplyTheBestFtp::simplyTheBestFtp(QObject *qmlForm)
{
    this->m_qmlForm = qmlForm;

    connect(this->m_qmlForm, SIGNAL(connectToServer(QString)), this, SLOT(connectToServer(QString)));
    connect(this->m_qmlForm, SIGNAL(disconnectFromServer()), this, SLOT(disconnectFromServer()));

    connect(this, SIGNAL(stateChanged(int)), this, SLOT(processStateChanged(int)));
    connect(this, SIGNAL(listInfo(QUrlInfo)), this, SLOT(processListInfo(QUrlInfo)));
}

void simplyTheBestFtp::connectToServer(const QString &serverName) {
    qDebug() << "Connect to: " + serverName;
    this->connectToHost(serverName);
    this->login();
    this->list();
}

void simplyTheBestFtp::disconnectFromServer() {
    qDebug() << "Disconnected";
}

void simplyTheBestFtp::processStateChanged(int state) {
    switch (state) {
    case QFtp::Unconnected:
        qDebug() << "FTP: Unconnected...";
        break;
    case QFtp::HostLookup:
        qDebug() << "FTP: Host lookup...";
        break;
    case QFtp::Connecting:
        qDebug() << "FTP: Connecting...";
        break;
    case QFtp::Connected:
        qDebug() << "FTP: Connected...";
        break;
    case QFtp::LoggedIn:
        qDebug() << "FTP: Logged in...";
        break;
    case QFtp::Closing:
        qDebug() << "FTP: Closing...";
        break;
    default:
        break;
    }
}

void simplyTheBestFtp::processListInfo(QUrlInfo entry) {
    QString entryType = (entry.isDir() ? "dir: " : "file ");
    qDebug() << "New entry: " + entryType + entry.name();
    this->serverFiles.push_back(entry);
    QVariant returnedValue;
    QMetaObject::invokeMethod(this->m_qmlForm, "addServerFile",
                              Q_RETURN_ARG(QVariant, returnedValue),
                              Q_ARG(QVariant, entry.name()));
}
