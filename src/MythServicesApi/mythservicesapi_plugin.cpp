#include "mythservicesapi_plugin.h"
#include "mythservicesapi.h"

#include <qqml.h>

void MythServicesApiPlugin::registerTypes(const char *uri)
{
    // @uri MythServicesApi
    qmlRegisterType<MythServicesApi>(uri, 1, 0, "MythServicesApi");
}


