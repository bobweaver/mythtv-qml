#include "deviceinfo.h"
#include <QScreen>
#include <QObject>
#include <QDebug>
#include  <QtGui>
DeviceInfo::DeviceInfo(QObject *parent) :
        QObject(parent)
{
}
//QSizeF DeviceInfo::mmSize(){
//    QScreen mm;
//    size = mm.physicalSize();
//}
//qreal DeviceInfo::getSizeMM(){
//    return size;
//}
void DeviceInfo::attached(){
//   cable.append(QScreen::name());
   qDebug() << "Number of screens:" << QGuiApplication::screens().size();
   qDebug() << "Primary screen:" << QGuiApplication::primaryScreen()->name();
   foreach (QScreen *screen, QGuiApplication::screens()) {
       qDebug() << "Information for screen:" << screen->name();
       qDebug() << "  Available geometry:" << screen->availableGeometry().x() << screen->availableGeometry().y() << screen->availableGeometry().width() << "x" << screen->availableGeometry().height();
       qDebug() << "  Available size:" << screen->availableSize().width() << "x" << screen->availableSize().height();
       qDebug() << "  Available virtual geometry:" << screen->availableVirtualGeometry().x() << screen->availableVirtualGeometry().y() << screen->availableVirtualGeometry().width() << "x" << screen->availableVirtualGeometry().height();
       qDebug() << "  Available virtual size:" << screen->availableVirtualSize().width() << "x" << screen->availableVirtualSize().height();
       qDebug() << "  Depth:" << screen->depth() << "bits";
       qDebug() << "  Geometry:" << screen->geometry().x() << screen->geometry().y() << screen->geometry().width() << "x" << screen->geometry().height();
       qDebug() << "  Logical DPI:" << screen->logicalDotsPerInch();
       qDebug() << "  Logical DPI X:" << screen->logicalDotsPerInchX();
       qDebug() << "  Logical DPI Y:" << screen->logicalDotsPerInchY();
//       qDebug() << "  Orientation:" << Orientation(screen->orientation());
       qDebug() << "  Physical DPI:" << screen->physicalDotsPerInch();
       qDebug() << "  Physical DPI X:" << screen->physicalDotsPerInchX();
       qDebug() << "  Physical DPI Y:" << screen->physicalDotsPerInchY();
       qDebug() << "  Physical size:" << screen->physicalSize().width() << "x" << screen->physicalSize().height() << "mm";
//       qDebug() << "  Primary orientation:" << Orientation(screen->primaryOrientation());
       qDebug() << "  Refresh rate:" << screen->refreshRate() << "Hz";
       qDebug() << "  Size:" << screen->size().width() << "x" << screen->size().height();
       qDebug() << "  Virtual geometry:" << screen->virtualGeometry().x() << screen->virtualGeometry().y() << screen->virtualGeometry().width() << "x" << screen->virtualGeometry().height();
       qDebug() << "  Virtual size:" << screen->virtualSize().width() << "x" << screen->virtualSize().height();
   }
}
QString DeviceInfo::getCable(){
    return cable;
}
