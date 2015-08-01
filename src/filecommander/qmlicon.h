#ifndef QMLICON_H
#define QMLICON_H

#include <QtQuick>

Q_DECLARE_LOGGING_CATEGORY(icon)

class QmlIcon : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QString iconName READ iconName WRITE setIconName NOTIFY iconChanged)
    Q_PROPERTY(QUrl iconSource READ iconSource WRITE setIconSource NOTIFY iconChanged)
public:
    QmlIcon(QQuickItem* parent=0);
    QString iconName() const;
    QUrl iconSource() const;
    void paint(QPainter *painter);
signals:
    void iconChanged();
public slots:
    void setIconName(QString iconName);
    void setIconSource(QUrl iconSource);
private:
    QString m_iconName;
    QUrl m_iconSource;
    QIcon m_icon;
};

#endif // QMLICON_H
