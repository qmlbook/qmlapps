#include <QtGui>
#include <QtQml>

#include "core.h"
#include "filesystem.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<FileSystem>("org.qmlbook.filecommander", 1, 0, "FileSystem");
    qmlRegisterSingletonType<Core>("org.qmlbook.filecommander", 1, 0, "Core", Core::singleton);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
