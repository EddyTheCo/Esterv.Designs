#include "esterv/utils/about.hpp"
#include <QCoreApplication>

using namespace Esterv::Utils;

int main(int argc, char *argv[]) {
  QCoreApplication app(argc, argv);

  qDebug() << "name:" << AboutThis::instance()->name();
  qDebug() << "version:" << AboutThis::instance()->version();
  qDebug() << "buildArch:" << AboutThis::instance()->buildArch();
  qDebug() << "buildTime:" << AboutThis::instance()->buildTime().toString();

  return app.exec();
}
