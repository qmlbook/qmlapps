#ifndef FILESYSTEM_H
#define FILESYSTEM_H

#include <QtCore>
#include <QtQml>

#include "common.h"

class FileSystem : public QObject
{
    Q_OBJECT
public:
    explicit FileSystem(QObject *parent = 0);
    static QObject* qmlSingleton(QQmlEngine *engine, QJSEngine *scriptEngine);
    Q_INVOKABLE QVariantList entryList(const QString& path, const QString &filter);
    Q_INVOKABLE QVariantMap info(const QString& path);
    Q_INVOKABLE QStringList location(const QString& name=QString("home"));
    Q_INVOKABLE QString cdUp(const QString &path);
    Q_INVOKABLE QString cd(const QString& path, const QString& name);
    Q_INVOKABLE void open(const QString& path);
    Q_INVOKABLE QString read(const QString& path);
private:
    QVariantMap toMap(const QFileInfo &info);
};



#endif // FILESYSTEM_H
