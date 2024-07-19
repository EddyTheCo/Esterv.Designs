#include "about.hpp"

namespace esterv::CustomControls {
AboutThis *AboutThis::m_instance = nullptr;
AboutThis::AboutThis(QObject *parent)
    : QObject(parent)
    , m_buildTime{QDateTime::fromString(QString(__DATE__).simplified() + " " + QString(__TIME__),
                                        "MMM d yyyy HH:mm:ss")}
    , m_buildArch{CMAKE_ARCH}
    , m_version{CMAKE_PROJECT_VERSION}
    , m_name{CMAKE_PROJECT_NAME}
{}

} // namespace esterv::CustomControls
