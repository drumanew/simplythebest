#ifndef SIMPLYTHEBESTFTP_H
#define SIMPLYTHEBESTFTP_H
#include <QObject>
#include "qftp.h"
#include <QtQml>

class simplyTheBestFtp : public QFtp
{
    Q_OBJECT

public:
    simplyTheBestFtp(QObject* qmlForm);
    void listAll();
private:
    QObject *m_qmlForm;
    QList<QUrlInfo> serverFiles;
    QFile *file;

    int loginCmdId;
    int cdCmdId;
    int downloadCmdId;
public slots:
    void connectToServer(const QString &serverName);
    void disconnectFromServer();
    void cdDir(const QString &dir);
    void download(const QString &pwd, const QString &file);

    void processStateChanged(int);
    void processListInfo(QUrlInfo);
    void processCommandFinished(int, bool);
    void processReadyRead();
};

#endif // SIMPLYTHEBESTFTP_H
