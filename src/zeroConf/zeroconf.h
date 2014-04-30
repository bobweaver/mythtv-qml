#ifndef ZEROCONF_H
#define ZEROCONF_H
#include <QQmlExtensionPlugin>

class ZeroConf : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};
#endif // ZEROCONF_H
