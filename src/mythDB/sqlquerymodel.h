#include <QSqlQueryModel>

class SqlQueryModel : public QSqlQueryModel
{
    Q_OBJECT
    void generateRoleNames();
public:
    explicit SqlQueryModel(QObject *parent = 0);

    Q_PROPERTY( QString queryString READ queryString WRITE setQueryString)
    QString queryString() const;
    void setQueryString(const QString &queryString);
    Q_INVOKABLE void setQuery(const QString &queryString, const QSqlDatabase &db = QSqlDatabase());
    Q_INVOKABLE void setQuery(const QSqlQuery &queryString);
    Q_INVOKABLE QVariant data(const QModelIndex &index, int role) const;
    Q_INVOKABLE void makeModel(const QString &queryString);
private:
    QString m_queryString;
};
