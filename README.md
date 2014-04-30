![My image](http://www.mythtv.org/img/mythtv.png)

## This code is pre-alpha and should be used at your own risk
The goal is to make a frontend wrote in qml by the end of 2013

It is Highly Recomened that you use QT5.1beta for hacking on this code. 
http://download.qt-project.org/development_releases/qt/5.1/5.1.0-beta1/
## For Linux and Windows and mac desktop

You Must have qt5.X or higher in order to use this code for desktop use. 
If you are reading this you have the branch and know how to download from git. 

## Using Qt Creator:
open up the .pro file that is located in the sources tree with qtcreator.  Make sure 
that you configure the kit to be with a qt5.X or higher kit.

Make the build dir where ever you want. shadow builds are supported for desktop
press the run button in qtcreator and watch the project build and run.

## Building with Qmake:

go to the source top dir and run 

make sure that <YOUR GCC/Whatever is Set Correctly> 
        example: on linux linux-g++
 You can also change the debuging option. In fact only use the debuging option if you are on if you like. more on that here.  


## Debuging::
```
        qmake Mythbuntu-QML.pro -r -spec <YOUR GCC/Whatever VERSION> CONFIG+=debug CONFIG+=declarative_debug CONFIG+=qml_debug
```

##No-QML-Debug:
```
        qmake Mythbuntu-QML.pro -r -spec <YOUR GCC/.Whatever Version> CONFIG+=debug
```


## Release Mode with debuging::
```
        qmake Mythbuntu-QML.pro -r -spec <YOUR GCC/Whatever Version> CONFIG+=declarative_debug CONFIG+=qml_debug 
```

## Release Mode with no Qml Debugging::
```
        qmake Mythbuntu-QML.pro -r -spec <YOUR GCC/Whatever Version>
```

## Make the app

```
        make 
```
## Install the app 
```
        make install
```
## For Android

For android One must have Qt5.1beta or higher installed.
http://download.qt-project.org/development_releases/qt/5.1/5.1.0-beta1/
You will also need androids sdk/adt bundle 
http://developer.android.com/sdk/index.html
and there Ndk.
http://developer.android.com/tools/sdk/ndk/index.html

javajdk 6 or higher
http://developer.android.com/sdk/installing/index.html

Install the qt5.1.beta 

Install android sdk/adt
http://developer.android.com/sdk/installing/index.html

Install the android Ndk.


 Open Qtcreator(> 5.1beta) and and go to 
         options --> android  and add the path for the sdk(adt) the ndk , ant , and java

Now open up the android manager 
        start android avd manager
Now add the api verions that you would like to use.api 17 is what it is tested on. 

## Setting up device (skip if you want to use emulator)
unplug usb from phone if attached . Go to 
        settings -> about phone  
and scrool down to "Build Number" and click that 10 times. You should get a dialog that says you are now a developer. Press the back button and go to developer options. 
        Make sure that usb debugging is checked.
Now plug in the device. you should get a notifaction saying that you are connected as a media device. you are now set up

## Building to device
open the Mythbuntu-QML.pro with qtcreator and make sure that the build kit is for android. set the build area whereever.

Go to ""projects"" (left hand side on qtcreator)
go into the “Run” settings for the project. Under “Deploy Configuration”, check the “Use Qt libraries from local device” option. Also select the “Deploy local Qt libraries” radio button

go back to the edit screen and press the run button.


## Using android Emulator

If you do not have a device dont freet you can use the android emulator. Open back up the 
        tools->options->android 
press the add button(under "Start Android AVD Manager"). 
Now name the emulator add the api kit that you want to use.
then make sure that you give it at least 1056mb of sd storage or more.
Then press the Ok Button. 

Now start the Android Emulator (under the "Remove Button that is Under the Addbutton")
wait for it to start. after it is started 

Go back to Qtcreator and Open Mythbuntu-QML.pro with qtcreator and 
        make sure that the build kit is for android.
set the build area whereever.

Before running go into the “Run” settings for your project. Under “Deploy Configuration”,
check the “Use Qt libraries from local device” option.
 Also select the “Deploy local Qt libraries” radio button

Now run the code in qtcreator. 

## Note: If you have a device pluged in it will automaticly push to that device and not the emulator just unplug device if this is the case. 


## Running on Blackberry:
http://qt-project.org/wiki/Setting-up-Qt-Creator-for-BlackBerry-and-QNX

## Running on Rasbery pi:
http://qt-project.org/wiki/RaspberryPi_Beginners_guide

## Running on Wayland:
add install virtual box add a zephyer VM to the machines and comile to that via ssh. 
more about setting up zephyer 
https://wiki.merproject.org/wiki/Zephyr
or
compile the .pro file against a wayland comiler. 

## Running on Mir:
Mir is not out as of yet. When it is released this section will be filed in. 

## Running on Sailfish:
Sailfish is curretly not supported due to the fact that there still using qt4.X

## Running on Megoo:
open the .pro file in qtcreator go to tools->megoo emulator options and set it up. Go back to options->tools->devices and set up a meego profile. comile and build to machine or emulator

## Running on other armel versions: 
compile with qmake using your favoirte arm compiler.

## Running on Ubuntu Touch: 
open the .pro file In Ubuntu SDK kit and build it.then deploy it to the device. There is no debian packaging at this point due to the fact that it is pre-alpha code.

## Running on Iphone: 
Qt5.1Beta support for Iphones is limited to qml 1 at this time. If qt5.1 stable hits and nothing has been changed we will have to backport this code to qml 1.X that would also solve the SailFish

## Running on Windows Phone USE AT YOU OWN RISK:
http://qt-project.org/wiki/Qt-5-on-Windows-8-and-Metro-UI
