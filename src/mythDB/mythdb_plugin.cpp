#include "mythdb_plugin.h"
#include "mythdb.h"
#include "mythsql.h"
#include "mythchannels.h"
#include "sqlquerymodel.h"
#include <qqml.h>
#include <QtQml>
void MythDBPlugin::registerTypes(const char *uri)
{
//    MythChannels *model1 = new MythChannels(0);
//        model1->setQuery("SELECT * FROM table WHERE column='value'");
//        MythChannels *model2 = new MythChannels(0);
//        model2->setQuery("SELECT * FROM anothertable WHERE anothercolumn='value'");

    // @uri MythDB
    qmlRegisterType<MythDB>(uri, 1, 0, "MythDB");
    qmlRegisterType<MythSql>(uri, 1,0,"MythSql");
    qmlRegisterType<MythChannels>(uri,1,0,"MythChannels");
    qmlRegisterType<SqlQueryModel>(uri,1,0,"SqlQueryModel");
}


