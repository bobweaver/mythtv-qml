#ifndef SORTGUIDE_H
#define SORTGUIDE_H
#include <QObject>
class QStringListModel;
class QSortFilterProxyModel;
class SortGuide : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString searchPredicate READ searchPredicate WRITE setSearchPredicate NOTIFY searchPredicateChanged)
    Q_INVOKABLE void getModel(const QStringList &title );
    Q_INVOKABLE QString searchPredicate() const;
public:
    explicit SortGuide(QObject *parent = 0);
public slots:
    void setSearchPredicate(const QString & nSearchPredicate);
signals:
    void searchPredicateChanged(const QString & nSearchPredicate);

private:
    QStringListModel* m_model;
    QSortFilterProxyModel* m_filter;
    QString m_searchPredicate;
};

#endif // SORTGUIDE_H
