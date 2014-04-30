#include "mythsql.h"
#include <QObject>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QDebug>
MythSql::MythSql(QObject *parent) :
    QObject(parent)
{
}
QString MythSql::hostName() const
{
    return m_HostName;
}
void MythSql::setHostName(const QString &hostName)
{
    m_HostName = hostName;
}

QString MythSql::databaseName() const
{
    return m_DbName;
}
void MythSql::setdatabaseName(const QString &databaseName)
{
    m_DbName = databaseName;
}
QString MythSql::user() const
{
    return m_User;
}
void MythSql::setUser(const QString &user)
{
    m_User = user;
}

QString MythSql::password() const
{
    return m_Password;
}
void MythSql::setPassword(const QString &password)
{
    m_Password = password;
}

void MythSql::createConnection()
{
    QSqlDatabase  db = QSqlDatabase::addDatabase(QLatin1String("QMYSQL") );
    db.setHostName(m_HostName);
    db.setDatabaseName(m_DbName);
    db.setUserName(m_User);
    db.setPassword(m_Password);
    db.setPort(3306);
    if (!db.open())
    {
        qDebug() << db.lastError().text();
        getBack.append("Database Error");
    }
    else
        qDebug() << "what is going on here ? ";
 }
void MythSql::insertRecordedArtwork(const QString &m_initref,const QString &m_season,const QString &m_host,const QString &m_coverart,const QString &m_fanart, const QString &m_banner)
{
    QSqlQuery qry;
    qry.prepare("INSERT INTO recordedartwork (inetref, season, host,coverart,fanart,banner)VALUES ( :initref,:season,:host,:coverart,:fanart,:banner)");
    qry.bindValue(":initref", m_initref);
    qry.bindValue(":season", m_season);
    qry.bindValue(":host", m_host);
    qry.bindValue(":coverart", m_coverart);
    qry.bindValue(":fanart", m_fanart);
    qry.bindValue(":banner", m_banner);
    if(qry.exec())
    {
        qDebug() << "Inserted Data";
    }
    else {
        qDebug() << "SOMETHING WHEN WRONG";
    }
}

//void MythSql::killConnecition(){
//    db.close();
//}

QString MythSql::getString()
{
    return getBack ;
}
