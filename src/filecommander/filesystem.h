#ifndef FILESYSTEM_H
#define FILESYSTEM_H

#include <QtCore>

class FileSystem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString workingDirectory READ workingDirectory WRITE setWorkingDirectory NOTIFY workingDirectoryChanged)
public:
    explicit FileSystem(QObject *parent = 0);
    QString workingDirectory() const;
    void setWorkingDirectory(QString arg);
    Q_INVOKABLE QStringList entryList();
    Q_INVOKABLE QVariantList entryInfoList();
    Q_INVOKABLE QVariantMap fileInfo(const QString &path);
signals:
    void workingDirectoryChanged(QString arg);
private:
    QString m_workingDirectory;
};

#endif // FILESYSTEM_H
