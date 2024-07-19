#pragma once
#include <QDateTime>
#include <QObject>
#include <QString>
#include <QUrl>

#if defined(USE_QML)
#include <QtQml>
#endif

#include <QtCore/QtGlobal>
#if defined(WINDOWS_ABOUT)
#define ABOUT_EXPORT Q_DECL_EXPORT
#else
#define ABOUT_EXPORT Q_DECL_IMPORT
#endif

namespace esterv::CustomControls {

class ABOUT_EXPORT AboutThis : public QObject
{
    QString m_version;
    QString m_name;
    const QString m_buildArch;
    const QDateTime m_buildTime;
    static AboutThis *m_instance;

    Q_OBJECT
#if defined(USE_QML)
    Q_PROPERTY(QString version READ version WRITE setVersion NOTIFY changed)
    Q_PROPERTY(QString name MEMBER m_name NOTIFY changed)
    Q_PROPERTY(QString buildArch READ buildArch CONSTANT)
    Q_PROPERTY(QDateTime buildTime READ buildTime CONSTANT)
    QML_ELEMENT
    QML_SINGLETON
#endif

    AboutThis(QObject *parent = nullptr);

public:
    static AboutThis *instance()
    {
        if (!m_instance) {
            m_instance = new AboutThis();
        }
        return m_instance;
    };
#if defined(USE_QML)
    static AboutThis *create(QQmlEngine *qmlEngine, QJSEngine *jsEngine) { return instance(); }
#endif
    QString version() const { return m_version; }
    QString name() const { return m_name; }
    QString buildArch() const { return m_buildArch; }
    QDateTime buildTime() const { return m_buildTime; }

    void setName(const QString name)
    {
        if (name != m_name) {
            m_name = name;
            emit changed();
        }
    }
    void setVersion(const QString version)
    {
        if (version != m_version) {
            m_version = version;
            emit changed();
        }
    }

signals:
    void changed();
};

}; // namespace esterv::CustomControls
