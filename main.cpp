#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QMessageBox>
#include <QTextDocument>
#include "simplythebestftp.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QObject *rootObject = engine.rootObjects().first();

    if (!rootObject) {
        QMessageBox::information(0, "Debug", "Root Object not found");
    } else {
        simplyTheBestFtp *ftp = new simplyTheBestFtp(rootObject);
    }

    return app.exec();
}
