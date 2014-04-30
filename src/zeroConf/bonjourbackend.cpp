#include <QtNetwork>
#include "bonjourbackend.h"
#include "bonjourservicebrowser.h"
#include "bonjourserviceresolver.h"
#include <QDebug>
#include <QHostInfo>
BonjourBackend::BonjourBackend(QObject *parent)
    : QObject(parent), bonjourResolver(0)
{
    BonjourServiceBrowser *bonjourBrowser = new BonjourServiceBrowser(this);
     setenv("AVAHI_COMPAT_NOWARN","1",1);
    connect(bonjourBrowser, SIGNAL(currentBonjourRecordsChanged(const QList<BonjourRecord> &)),
            this, SLOT(updateString(const QList<BonjourRecord> &)));
    bonjourBrowser->browseForServiceType(QLatin1String("_mythbackend-master._tcp"));
}
void BonjourBackend::updateString(const QList<BonjourRecord> &list)
{
         foreach (BonjourRecord record, list) {
        qDebug() << "\n DEBUG \n"<< record.registeredType  << "\n";
        qDebug() << "\n DEBUG \n"<< record.serviceName  << "\n";
        qDebug() << "\n DEBUG \n"<< record.replyDomain  << "\n";
        
//        QStringList sd;
//        sd = record.serviceName;
        backend.append(record.serviceName.toLatin1());
    }
}
QString BonjourBackend::getString() const
{
    return backend;
}

QString BonjourBackend::service() const
{
    return m_Service;
}
void BonjourBackend::setService(const QString &service)
{
    m_Service = service;
}
