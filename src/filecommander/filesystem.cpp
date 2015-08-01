#include "filesystem.h"

#include <QtGui>

FileSystem::FileSystem(QObject *parent)
    : QObject(parent)
    //    , m_workingDirectory(QDir::home())
{
    qCDebug(filesystem) << "FileSystem(): ";
}

QObject *FileSystem::qmlSingleton(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    FileSystem *object = new FileSystem();
    return object;
}

QVariantList FileSystem::entryList(const QString &path, const QString &filter)
{
    QDir dir(path);
    QStringList nameFilters;
    nameFilters.append(QString("*%1*").arg(filter));
    dir.setNameFilters(nameFilters);
    dir.setFilter(QDir::AllEntries|QDir::NoDot);
    QFileInfoList infos = dir.entryInfoList();
    QVariantList data;
    foreach(const QFileInfo& info, infos) {
        const QVariantMap& entry = toMap(info);
        data.append(entry);
    }
    return data;
}

QVariantMap FileSystem::info(const QString &path)
{
    return toMap(QFileInfo(path));
}

QStringList FileSystem::location(const QString &name)
{
    Q_UNUSED(name);
    return QStandardPaths::standardLocations(QStandardPaths::HomeLocation);
}

QVariantMap FileSystem::toMap(const QFileInfo& info)
{
    QVariantMap map;
    map.insert("path", info.filePath());
    map.insert("name", info.fileName());
    map.insert("extension", info.suffix());
    map.insert("size", info.size());
    map.insert("modified", info.lastModified());
    map.insert("isDir", info.isDir());
    map.insert("isFile", info.isFile());
    return map;
}

QString FileSystem::cdUp(const QString& path)
{
    QDir dir(path);
    dir.cdUp();
    return dir.absolutePath();
}

QString FileSystem::cd(const QString &path, const QString &name)
{
    QDir dir(path);
    dir.cd(name);
    return dir.absolutePath();
}

void FileSystem::open(const QString &path)
{
    QDesktopServices::openUrl(QUrl::fromLocalFile(path));
}

QString FileSystem::read(const QString &path)
{
    qCDebug(filesystem) << "read " << path;
    QFile file(path);
    if(!file.open(QFile::ReadOnly)) {
        return QString();
    }
    QTextStream stream(&file);
    return stream.readAll();
}







//QString FileSystem::workingDirectory() const
//{
//    return m_workingDirectory.absolutePath();
//}

//void FileSystem::setWorkingDirectory(QString path)
//{
//    qCDebug(filesystem) << "setWorkingDirectory: " << path;
//    QDir dir(QDir(path).canonicalPath());
//    if (m_workingDirectory.canonicalPath() == dir.canonicalPath()) {
//        return;
//    }

//    m_workingDirectory = dir;
//    emit directoryChanged();
//}

//QVariantList FileSystem::entryList()
//{
//    qCDebug(filesystem) << "entryList()";
//    QFileInfoList infos = m_workingDirectory.entryInfoList(QDir::AllEntries|QDir::NoDot);
//    QVariantList data;
//    foreach(const QFileInfo& info, infos) {
//        QMimeType type = m_mimeDatabase.mimeTypeForFile(info.fileName());
//        QVariantMap entry;
//        entry.insert("path", info.filePath());
//        entry.insert("name", info.fileName());
//        entry.insert("extension", info.suffix());
//        entry.insert("size", info.size());
//        entry.insert("modified", info.lastModified());
//        entry.insert("isDir", info.isDir());
//        entry.insert("isFile", info.isFile());
//        entry.insert("icon", type.iconName());
//        data.append(entry);
//    }
//    return data;
//}

//QString FileSystem::filter() const
//{
//    QString name = m_workingDirectory.nameFilters().value(0);
//    if(name.startsWith('*')) {
//        name.remove(0, 1);
//    }
//    if(name.endsWith('*')) {
//        name.chop(1);
//    }
//    return name;
//}

//void FileSystem::open(const QString &path)
//{
//    qCDebug(filesystem) << "open: " << path;
//    QFileInfo info(path);
//    if(info.isDir()) {
//        setWorkingDirectory(path);
//    } else if(info.isFile()) {

//    }
//}

//void FileSystem::cdUp()
//{
//    m_workingDirectory.cdUp();
//    emit directoryChanged();
//}

//void FileSystem::setFilter(QString filter)
//{
//    filter = QString("*%1*").arg(filter);
//    qCDebug(filesystem) << "setFilter: " << filter;
//    QStringList filters;
//    filters << filter;
//    m_workingDirectory.setNameFilters(filters);
//    emit directoryChanged();
//}
