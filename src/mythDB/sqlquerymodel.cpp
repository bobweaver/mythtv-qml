#include "sqlquerymodel.h"
#include <QSqlRecord>
#include <QSqlField>
#include <QDebug>

SqlQueryModel::SqlQueryModel(QObject *parent) :
    QSqlQueryModel(parent)
{
}

QString SqlQueryModel::queryString() const
{
    return m_queryString;
}
void SqlQueryModel::setQueryString(const QString &queryString)
{
    m_queryString = queryString;
}

void SqlQueryModel::setQuery(const QSqlQuery &queryString)
{
    QSqlQueryModel::setQuery(queryString);
    generateRoleNames();

}

void SqlQueryModel::generateRoleNames()
{
    QHash<int, QByteArray> roles;
    for( int i = 0; i < record().count(); i++) {
        roles[Qt::UserRole + i + 1] = record().fieldName(i);
    }
//    setRoleNames(roleNames);
}

QVariant SqlQueryModel::data(const QModelIndex &index, int role) const
{
    QVariant value = QSqlQueryModel::data(index, role);
    if(role < Qt::UserRole)
    {
        value = QSqlQueryModel::data(index, role);
    }
    else
    {
        int columnIdx = role - Qt::UserRole - 1;
        QModelIndex modelIndex = this->index(index.row(), columnIdx);
        value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
    }
    return value;

    qDebug() << value;
}
void SqlQueryModel::makeModel(const QString &queryString)
{
    SqlQueryModel *model1 = new SqlQueryModel(0);
    model1->setQuery(queryString);
}
