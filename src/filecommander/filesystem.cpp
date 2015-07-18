#include "filesystem.h"

FileSystem::FileSystem(QObject *parent)
    : QObject(parent)
    , m_workingDirectory(QDir::homePath())
{
}

QString FileSystem::workingDirectory() const
{
    return m_workingDirectory;
}

void FileSystem::setWorkingDirectory(QString arg)
{
    if (m_workingDirectory == arg)
        return;

    m_workingDirectory = arg;
    emit workingDirectoryChanged(arg);
}

QStringList FileSystem::entryList()
{
    QDir cwd(m_workingDirectory);
    return cwd.entryList();
}

QVariantList FileSystem::entryInfoList()
{
    QDir cwd(m_workingDirectory);
    QFileInfoList infos = cwd.entryInfoList();
    QVariantList data;
    foreach(const QFileInfo& info, infos) {
        QVariantMap entry;
        entry.insert("path", info.filePath());
        entry.insert("name", info.fileName());
        entry.insert("extension", info.suffix());
        entry.insert("size", info.size());
        entry.insert("modified", info.lastModified());
        data.append(entry);
    }
    return data;
}

QVariantMap FileSystem::fileInfo(const QString &path)
{
    QVariantMap data;
    QFileInfo info(path);

    data.insert("extension", info.suffix());
    data.insert("size", info.size());
    data.insert("modified", info.lastModified());
    return data;
}
