#include <QtGui>
#include <QtQml>
#include <QtWidgets>

#include "core.h"
#include "filesystem.h"
#include "qmlicon.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<QmlIcon>("org.qmlbook.filecommander", 1, 0, "Icon");
    qmlRegisterSingletonType<FileSystem>("org.qmlbook.filecommander", 1, 0, "FileSystem", FileSystem::qmlSingleton);
    qmlRegisterSingletonType<Core>("org.qmlbook.filecommander", 1, 0, "Core", Core::singleton);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
