#ifndef BONJOURBACKEND_h
#define BONJOURBACKEND_h
#include <QString>
#include <QTcpSocket>
#include "bonjourrecord.h"
class BonjourServiceBrowser;
class BonjourServiceResolver;
class QHostInfo;
class BonjourBackend : public QObject
{
    Q_OBJECT
    public slots:
   void updateString(const QList<BonjourRecord> &list);
public:
    explicit BonjourBackend(QObject *parent = 0);
   Q_PROPERTY( QString  service READ service WRITE setService )
   QString service() const;
   void setService(const QString &service);
   Q_INVOKABLE QString getString() const;
private:
    quint16 blockSize;
    BonjourServiceBrowser *bonjourBrowser;
    BonjourServiceResolver *bonjourResolver;
    QString backend;
    QString m_Service;
};
#endif
