#ifndef MYTHSERVICESAPI_PLUGIN_H
#define MYTHSERVICESAPI_PLUGIN_H

#include <QQmlExtensionPlugin>

class MythServicesApiPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")
    
public:
    void registerTypes(const char *uri);
};

#endif // MYTHSERVICESAPI_PLUGIN_H

