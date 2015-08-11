===========
Hello World
===========

.. note::

    - Hello World Example
    - Project File
    - Main CPP
    - Main QML
    - Resource Files
    - Why shadow builds

The hello world example shows a button inside a window. When the button is clicked it will exit the application. 

The code for the user interface is rather simple and the focus lies on the infrastructure around. The example acts as a simple demontration for future more complex applications.

Building Blocks
===============

A typical QML based application consist of a project file, some C++ code, QML/JS code and a resource file. The project defines the build process for projects across platforms. The C++ code provides the application bootstraping and extension to the QML/JS scripting environment. The QML/JS provides the user interface code and to some extend also application logic. The resource file finally allows to pack the scripting parts of the application into the application binary for easier deployment.

Project File
============

The project file is a standard qmake based project. It allows to define the project ingredients and the build process in a platform independent way together with platform specifics if required.

For this simple project we want to build an application and set the template to app to indicate to the qmake to use the application template for the makefile generation. The app template is set by default so we could skip this.

With the QT line we manage the Qt dependencies our application requires. Implicitly the QtCore module and the QtGui module are linked due to our template selection. As we want to make a QML application using QtQuick we need to add these both Qt modules. The last one the widget library is optional. The QtQuick controls we are using require for native control rendering the widgets module. If this is not linked to your application they fall back to the default control style called "cleanlooks".

We use only one C++ file the main.cpp to bootstrap into the QML/JS environment. These are listed as SOURCES and later headers as HEADERS.

The RESOURCES variable defines the list of resource files bound to the binary. These resource files are like a virtual filesystem where the application can request files from for example icons or QML files.


.. code-block:: sh

    template = app

    QT += qml quick widgets

    SOURCES += main.cpp

    RESOURCES += helloworld.qrc

To build the application you need to pick the qmake executable from your Qt installation and run it inside the folder.

::

    $ qmake

It will create a makefile under Linux/Mac and Windows(MingW). This makefile can then be used to build the application.

::

    $ make

Your exectuable will then be present inside your folder as helloworld or helloworld.exe and under mac as helloworld.app bundle. Now you can launche the application

::

    $ ./helloworld

And for Mac

::

    $ open helloworld.app

Sure managing the project file and adding source files as also managing the resource files are much easier using QtCreator. And this we will cover in the next section.



C++ Code
========

.. code-block:: cpp

    #include <QtWidgets>
    #include <QtQml>

    int main(int argc, char** argv)
    {
        QApplication app(argc, argv);
        QQmlApplicationEngine engine(QUrl(QStringLiteral("qrc:/main.qml")));
        return app.exec();
    }

QML/JS Code
===========

.. code-block:: qml

    import QtQuick 2.4
    import QtQuick.Window 2.2
    import QtQuick.Controls 1.3

    Window {
        width: 800
        height: 600
        title: 'Hello World'
        visible: true

        Button {
            anchors.centerIn: parent
            text: 'Click to Exit'
            onClicked: Qt.quit()
        }
    }

Resource File
=============

.. code-block:: xml

    <RCC>
        <qresource prefix="/">
            <file>main.qml</file>
        </qresource>
    </RCC>
