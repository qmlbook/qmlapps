#include "filemanager.h"

FileManager::FileManager(QObject *parent) : QObject(parent)
{

}

FileSystem *FileManager::getFileSystem(const QString &name)
{
    if(name.isEmpty()) {
        return nullptr;
    }
    if(!m_fileSystems.contains(name)) {
        FileSystem* fs = new FileSystem(this);
        m_fileSystems.insert(name, fs);
    }
    return m_fileSystems.value(name);
}


