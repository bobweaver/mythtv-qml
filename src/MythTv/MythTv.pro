TEMPLATE = lib
TARGET = MythTv
QT += qml quick
CONFIG += qt plugin
TARGET =  $$qtLibraryTarget($$TARGET)
uri = MythTv
# Qml Files
QML = $$system(ls *.qml)
JS = $$system(ls *.js)

# make found deployables visible in Qt Creator
OTHER_FILES +=  \
            $$QML \
            $$JS \
            qmldir

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}
qmldir.files = qmldir
plugins_qmltypes.path = $$installPath
plugins_qmltypes.files = plugins.qmltypes
plugins_qmltypes.extra = $$[QT_INSTALL_BINS]/qmlplugindump -notrelocatable Unity2d 1.0 ../../ > $(INSTALL_ROOT)/$$installPath/plugins.qmltypes

unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)

    qml_files.path = $$installPath
    qml_files.files = $$QML

    js_files.path = $$installPath
    js_files.files = $$JS

    qmldir.path = $$installPath
    target.path = $$installPath

    INSTALLS += target \
                             qmldir \
                             qml_files \
                              js_files
}
