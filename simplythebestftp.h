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

    QMap<QString, QUrlInfo> serverFiles;

    QString currentHost;
    QString username;
    QString serverDir;
    quint16 port;
    QFile    file;
    quint64  got_bytes;
    quint64  total_bytes;
    bool     isDownloading;
    bool     isUploading;

    int loginCmdId;
    int cdCmdId;
    int downloadCmdId;
    int uploadCmdId;

    void log(const QString &);
    void updateDownloadProgress();
    void updateUploadProgress();
    void abortDownload();
    void abortUpload();
    void downloadFinished();
    void uploadFinished();

public slots:
    void connectToServer(const QString &serverName, const QString & user= QString(), const QString& password = QString(), const QString& port = "21");
    void disconnectFromServer();
    void cdDir(const QString &dir);
    void download(const QString &pwd, const QString &file);
    void upload(const QString &pwd, const QString &file);

    void processStateChanged(int);
    void processListInfo(QUrlInfo);
    void processCommandFinished(int, bool);
    void processReadyRead();
    void processProgress(qint64,qint64);
};

#endif // SIMPLYTHEBESTFTP_H
