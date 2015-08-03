#include "simplythebestftp.h"

simplyTheBestFtp::simplyTheBestFtp(QObject *qmlForm)
{
    this->m_qmlForm = qmlForm;
    this->m_qmlForm->findChild<QObject*>("serverName")->setProperty("text", "ftp://ftp.plgn.ru");
}

