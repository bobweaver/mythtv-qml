#include "scriptlauncher.h"
#include    <QProcess>
#include <QDebug>

ScriptLauncher::ScriptLauncher(QObject *parent) :
    QObject(parent),
    m_process(new QProcess(this))
{
}
void ScriptLauncher::launchScript(const QString &application)
{
    m_process->start(application);
    qDebug() << "launching application" << application;
}

