#ifndef MYTHDB_H
#define MYTHDB_H

#include <QQuickItem>

class MythDB : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(MythDB)
    
public:
    MythDB(QQuickItem *parent = 0);
    ~MythDB();
};

QML_DECLARE_TYPE(MythDB)

#endif // MYTHDB_H

