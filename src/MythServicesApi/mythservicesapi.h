#ifndef MYTHSERVICESAPI_H
#define MYTHSERVICESAPI_H

#include <QQuickItem>

class MythServicesApi : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(MythServicesApi)
    
public:
    MythServicesApi(QQuickItem *parent = 0);
    ~MythServicesApi();
};

QML_DECLARE_TYPE(MythServicesApi)

#endif // MYTHSERVICESAPI_H

