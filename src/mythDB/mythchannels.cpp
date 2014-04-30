#include "mythchannels.h"
#include <QtSql>
#include <QDebug>
#include <QObject>
#include "mythsql.h"
MythChannels::MythChannels(QObject *parent) :
    QObject(parent)
{
}
void MythChannels::getChannels(const QString &m_ChannelID)
{
//MythSql mdb;
//mdb.createConnection();
    QSqlQuery model;
        if (!model.prepare("SELECT * FROM program WHERE chanid=:channelID")) {
            qDebug() << model.lastError().text();
        } else {
            model.bindValue(":channelID",m_ChannelID);
            if (model.exec()) {
                while(model.next()){
                   
//                    QDateTime desc = model.value("starttime").toDateTime();
//QAbstractListModel theModel;
//theModel.
                    //                    QList<QDateTime> k ;
//                    k << desc;
//                    qSort(k);
                    
//                    foreach (QDateTime s, k ) {
//                        qDebug() << s << "\n    " << k ;
//                    }
//                    dbMod = new QSqlQueryModel();
//                    dbMod->setQuery();
                }
            } else {
                qDebug() << model.lastError().text();
            }
        }
    }
void MythChannels::channelModel()
{
                        dbMod = new QSqlQueryModel();
                        dbMod->setQuery("SELECT * FROM program");
}
