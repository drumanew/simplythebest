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
private:
    QObject *m_qmlForm;
public slots:
    void connectToServer(const QString &serverName);
    void disconnectFromServer();

    void processStateChanged(int);
    void processListInfo(QUrlInfo);
};

#endif // SIMPLYTHEBESTFTP_H
