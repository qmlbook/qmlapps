#ifndef FILEMANAGER_H
#define FILEMANAGER_H

#include <QtCore>
#include "filesystem.h"

class FileManager : public QObject
{
    Q_OBJECT
public:
    explicit FileManager(QObject *parent = 0);
    Q_INVOKABLE FileSystem* getFileSystem(const QString& name);
private:
    QHash<QString,FileSystem*> m_fileSystems;
};

#endif // FILEMANAGER_H
