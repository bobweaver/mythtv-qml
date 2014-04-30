# Add more folders to ship with the application, here
folder_01.source = qml/Mythbuntu-QML
folder_01.target = qml
script.source =  scripts/
script.target +=
DEPLOYMENTFOLDERS = folder_01 \
                                                   script \

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp

include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    TODO \
    README.md \
    scripts/* \
    android/version.xml \
    android/AndroidManifest.xml \
    android/libjava.so \
    android/java.pro \
    android/READ-THIS-BEFORE-MANUALLY-ADDING-FILES-TO-PACKAGE.txt \
    android/src/org/qtproject/qt5/android/bindings/QtActivity.java \
    android/src/org/qtproject/qt5/android/bindings/QtApplication.java \
    android/src/org/kde/necessitas/ministro/IMinistroCallback.aidl \
    android/src/org/kde/necessitas/ministro/IMinistro.aidl \
    android/Makefile \
    android/res/values-it/strings.xml \
    android/res/values-rs/strings.xml \
    android/res/values-nl/strings.xml \
    android/res/layout/splash.xml \
    android/res/values-ru/strings.xml \
    android/res/values-fr/strings.xml \
    android/res/values-ro/strings.xml \
    android/res/values-el/strings.xml \
    android/res/values-es/strings.xml \
    android/res/values/strings.xml \
    android/res/values/libs.xml \
    android/res/values-de/strings.xml \
    android/res/values-zh-rTW/strings.xml \
    android/res/values-ms/strings.xml \
    android/res/values-zh-rCN/strings.xml \
    android/res/values-et/strings.xml \
    android/res/values-pt-rBR/strings.xml \
    android/res/values-ja/strings.xml \
    android/res/values-fa/strings.xml \
    android/res/values-nb/strings.xml \
    android/res/values-pl/strings.xml \
    android/res/values-id/strings.xml \
    qml/Mythbuntu-QML/common/CoverFlow/example/Main.qml \
    qml/Mythbuntu-QML/common/MythFadeAnimation.qml \
    qml/Mythbuntu-QML/themes/Mythbuntu/InfoCenter/Info.qml \
    qml/Mythbuntu-QML/themes/Mythbuntu/InfoCenter/models/MythDBInfo.qml \
    qml/Mythbuntu-QML/common/FileOpen.qml \
    desktopfiles/*.desktop \
    qml/Mythbuntu-QML/common/jsonpath.js \
    qml/Mythbuntu-QML/common/models/PreRecordedModel.qml \
    qml/Mythbuntu-QML/themes/Mythbuntu/MediaLibs/MythbuntuGridViewVideos.qml \
    qml/Mythbuntu-QML/common/MythRemoteImgButton.qml \
    qml/Mythbuntu-QML/common/MythRemoteTextAll.qml \
    qml/Mythbuntu-QML/themes/Mythbuntu/Recordings/NewGuide/Channels.qml \
    qml/Mythbuntu-QML/themes/UbuntuSDK/GridVideo.qml

HEADERS +=

