#ifndef DEVICEINFO_H
#define DEVICEINFO_H
#include <QObject>

class DeviceInfo : public QObject
{
Q_OBJECT
public:
     explicit DeviceInfo(QObject *parent = 0);
//    Q_INVOKABLE  QSizeF mmSize();
//    Q_INVOKABLE QString getSizeMM();
    Q_INVOKABLE  void attached();
    Q_INVOKABLE  QString getCable();

private:
//    qreal size;
    QString cable;
};
#endif // DEVICEINFO_H
