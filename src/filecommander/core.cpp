#include "core.h"
#include "filesystem.h"

Core::Core(QObject *parent) :
    QObject(parent)
{
}

QObject *Core::singleton(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    Core *object = new Core();
    return object;
}
