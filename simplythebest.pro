TEMPLATE = app

QT += qml quick widgets gui

SOURCES += \
    main.cpp \
    qftp.cpp \
    qurlinfo.cpp \
    simplythebestftp.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    qftp.h \
    qurlinfo.h \
    simplythebestftp.h

DISTFILES += \
    icons/Disconnect.ico \
    icons/document.ico \
    icons/left.ico \
    icons/network.ico \
    icons/right.ico
