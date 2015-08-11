#include <QtWidgets>
#include <QtQml>

int main(int argc, char** argv)
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}