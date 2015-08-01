#ifndef CORE_H
#define CORE_H

#include <QtCore>
#include <QtQml>

class FileSystem;

class Core : public QObject
{
    Q_OBJECT
public:
    explicit Core(QObject *parent = 0);
    static QObject* singleton(QQmlEngine *engine, QJSEngine *scriptEngine);


private:
};

#endif // CORE_H
