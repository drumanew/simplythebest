#ifndef SIMPLYTHEBESTFTP_H
#define SIMPLYTHEBESTFTP_H
#include <QObject>
#include "qftp.h"
//#include <QQmlApplicationEngine>
#include <QtQml>

class simplyTheBestFtp : public QFtp
{
    Q_OBJECT

public:
    simplyTheBestFtp(QObject* qmlForm);
private:
    QObject *m_qmlForm;
};

#endif // SIMPLYTHEBESTFTP_H
