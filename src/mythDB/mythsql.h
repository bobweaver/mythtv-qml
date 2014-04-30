#ifndef MYTHSQL_H
#define MYTHSQL_H
#include <QObject>
class MythSql : public QObject
       {
     Q_OBJECT
public:
    explicit MythSql(QObject *parent = 0);
    Q_PROPERTY( QString         hostName                 READ hostName                 WRITE setHostName                 )
    Q_PROPERTY( QString         databaseName                 READ databaseName                 WRITE setdatabaseName                 )
    Q_PROPERTY( QString         user                 READ user                 WRITE setUser                 )
    Q_PROPERTY( QString         password                 READ password                 WRITE setPassword                 )
    QString hostName() const;
    void setHostName(const QString &hostName);
    QString databaseName() const;
    void setdatabaseName(const QString &databaseName);
    QString user() const;
    void setUser(const QString &user);
    QString password() const;
    void setPassword(const QString &password);
    Q_INVOKABLE void createConnection();
    Q_INVOKABLE void insertRecordedArtwork(const QString &m_initref,const QString &m_season,const QString &m_host,const QString &m_coverart,const QString &m_fanart, const QString &m_banner);
    Q_INVOKABLE QString getString();

private:
    QString getBack;
    QString m_HostName;
    QString m_DbName;
    QString m_User;
    QString m_Password;
};
#endif // MYTHSQL_H
