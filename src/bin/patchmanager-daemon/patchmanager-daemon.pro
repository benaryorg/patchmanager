TEMPLATE = app
TARGET = patchmanager

QT = core dbus

# DBus
system(qdbusxml2cpp dbus/org.SfietKonstantin.patchmanager.xml -i patchmanagerobject.h -a adaptor)

HEADERS += \
    adaptor.h \
    patchmanagerobject.h

SOURCES += \
    main.cpp \
    adaptor.cpp \
    patchmanagerobject.cpp

OTHER_FILES += dbus/org.SfietKonstantin.patchmanager.xml \
    dbus/org.SfietKonstantin.patchmanager.service \
    dbus/org.SfietKonstantin.patchmanager.conf

target.path = /usr/sbin
INSTALLS += target

# DBus service
dbusService.files = dbus/org.SfietKonstantin.patchmanager.service
dbusService.path = /usr/share/dbus-1/system-services/
INSTALLS += dbusService

# DBus interface
dbusInterface.files = dbus/org.SfietKonstantin.patchmanager.xml
dbusInterface.path = /usr/share/dbus-1/interfaces/
INSTALLS += dbusInterface

# DBus config
dbusConf.files = dbus/org.SfietKonstantin.patchmanager.conf
dbusConf.path = /etc/dbus-1/system.d/
INSTALLS += dbusConf

# Tools
tools.files = check-package.sh
tools.path = /usr/share/patchmanager/tools
INSTALLS += tools
