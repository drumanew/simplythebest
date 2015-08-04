#include "simplythebestftp.h"

simplyTheBestFtp::simplyTheBestFtp(QObject *qmlForm)
{
    this->m_qmlForm = qmlForm;

    connect(this->m_qmlForm, SIGNAL(connectToServer(QString)), this, SLOT(connectToServer(QString)));
    connect(this->m_qmlForm, SIGNAL(disconnectFromServer()), this, SLOT(disconnectFromServer()));
    connect(this->m_qmlForm, SIGNAL(cdDir(QString)), this, SLOT(cdDir(QString)));
    connect(this->m_qmlForm, SIGNAL(download(QString)), this, SLOT(download(QString)));

    connect(this, SIGNAL(stateChanged(int)), this, SLOT(processStateChanged(int)));
    connect(this, SIGNAL(listInfo(QUrlInfo)), this, SLOT(processListInfo(QUrlInfo)));
    connect(this, SIGNAL(commandFinished(int,bool)), this, SLOT(processCommandFinished(int,bool)));
}

void simplyTheBestFtp::listAll() {
    QVariant returnedValue;
    QMetaObject::invokeMethod(this->m_qmlForm, "addServerFile",
                              Q_RETURN_ARG(QVariant, returnedValue),
                              Q_ARG(QVariant, "."),
                              Q_ARG(QVariant, true));
    QMetaObject::invokeMethod(this->m_qmlForm, "addServerFile",
                              Q_RETURN_ARG(QVariant, returnedValue),
                              Q_ARG(QVariant, ".."),
                              Q_ARG(QVariant, true));
    this->list();
}

void simplyTheBestFtp::connectToServer(const QString &serverName) {
    if (this->state() == QFtp::Unconnected) {
        this->connectToHost(serverName);
        this->login();
        this->listAll();
    }
}

void simplyTheBestFtp::disconnectFromServer() {
    if (this->state() != QFtp::Unconnected) {
        this->serverFiles.clear();
        this->close();
    }
}

void simplyTheBestFtp::cdDir(const QString &dir) {
    qDebug() << "cd " + dir;
    this->cdCmdId = this->cd(dir);
}

void simplyTheBestFtp::download(const QString &file) {
    qDebug() << "get " + file;
}

void simplyTheBestFtp::processCommandFinished(int cmd, bool error) {
    if (this->cdCmdId == cmd) {
        if (!error) {
            this->listAll();
        } else {
            qDebug() << "CD: error";
        }
    }
}

void simplyTheBestFtp::processStateChanged(int state) {
    QString strState = "";

    switch (state) {
    case QFtp::Unconnected:
        strState = "Unconnected.";
        break;
    case QFtp::HostLookup:
        strState = "Host lookup...";
        break;
    case QFtp::Connecting:
        strState = "Connecting...";
        break;
    case QFtp::Connected:
        strState = "Connected.";
        break;
    case QFtp::LoggedIn:
        strState = "Logged in.";
        break;
    case QFtp::Closing:
        strState = "Closing...";
        break;
    default:
        break;
    };

    this->m_qmlForm->setProperty("state", strState);
}

void simplyTheBestFtp::processListInfo(QUrlInfo entry) {
    QString entryType = (entry.isDir() ? "dir: " : "file ");
    qDebug() << "New entry: " + entryType + entry.name();
    this->serverFiles.push_back(entry);
    QVariant returnedValue;
    QMetaObject::invokeMethod(this->m_qmlForm, "addServerFile",
                              Q_RETURN_ARG(QVariant, returnedValue),
                              Q_ARG(QVariant, entry.name()),
                              Q_ARG(QVariant, entry.isDir()));
}
