#include "qmlicon.h"

Q_LOGGING_CATEGORY(icon, "icon")

QmlIcon::QmlIcon(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
//    setFlag(QQuickItem::ItemHasContents, true);
}

QString QmlIcon::iconName() const
{
    return m_iconName;
}

QUrl QmlIcon::iconSource() const
{
    return m_iconSource;
}

void QmlIcon::paint(QPainter *painter)
{
    qCDebug(icon) << "paint: bounding rect: " << contentsBoundingRect() << " isNull" << m_icon.isNull();
    if(m_icon.isNull()) {
        return;
    }
    m_icon.paint(painter, contentsBoundingRect().toRect());
}

void QmlIcon::setIconName(QString iconName)
{
    qCDebug(icon) << "setIconName: " << iconName;
    if (m_iconName == iconName) {
        return;
    }
    m_iconName = iconName;
    m_icon = QIcon::fromTheme("edit", QIcon(m_iconSource.toLocalFile()));
    qCDebug(icon) << "isNull" << m_icon.isNull();
    emit iconChanged();
}

void QmlIcon::setIconSource(QUrl iconSource)
{
    if (m_iconSource == iconSource) {
        return;
    }
    m_icon.addFile(iconSource.toLocalFile());

    m_iconSource = iconSource;
    emit iconChanged();
}


