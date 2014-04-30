/****************************************************************************
** Meta object code from reading C++ file 'mythsql.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.0.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../mythsql.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mythsql.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.0.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_MythSql_t {
    QByteArrayData data[15];
    char stringdata[150];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_MythSql_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_MythSql_t qt_meta_stringdata_MythSql = {
    {
QT_MOC_LITERAL(0, 0, 7),
QT_MOC_LITERAL(1, 8, 16),
QT_MOC_LITERAL(2, 25, 0),
QT_MOC_LITERAL(3, 26, 21),
QT_MOC_LITERAL(4, 48, 9),
QT_MOC_LITERAL(5, 58, 8),
QT_MOC_LITERAL(6, 67, 6),
QT_MOC_LITERAL(7, 74, 10),
QT_MOC_LITERAL(8, 85, 8),
QT_MOC_LITERAL(9, 94, 8),
QT_MOC_LITERAL(10, 103, 9),
QT_MOC_LITERAL(11, 113, 8),
QT_MOC_LITERAL(12, 122, 12),
QT_MOC_LITERAL(13, 135, 4),
QT_MOC_LITERAL(14, 140, 8)
    },
    "MythSql\0createConnection\0\0"
    "insertRecordedArtwork\0m_initref\0"
    "m_season\0m_host\0m_coverart\0m_fanart\0"
    "m_banner\0getString\0hostName\0databaseName\0"
    "user\0password\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MythSql[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       4,   44, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   29,    2, 0x02,
       3,    6,   30,    2, 0x02,
      10,    0,   43,    2, 0x02,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString,    4,    5,    6,    7,    8,    9,
    QMetaType::QString,

 // properties: name, type, flags
      11, QMetaType::QString, 0x00095103,
      12, QMetaType::QString, 0x00095003,
      13, QMetaType::QString, 0x00095103,
      14, QMetaType::QString, 0x00095103,

       0        // eod
};

void MythSql::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        MythSql *_t = static_cast<MythSql *>(_o);
        switch (_id) {
        case 0: _t->createConnection(); break;
        case 1: _t->insertRecordedArtwork((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QString(*)>(_a[4])),(*reinterpret_cast< const QString(*)>(_a[5])),(*reinterpret_cast< const QString(*)>(_a[6]))); break;
        case 2: { QString _r = _t->getString();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        default: ;
        }
    }
}

const QMetaObject MythSql::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_MythSql.data,
      qt_meta_data_MythSql,  qt_static_metacall, 0, 0}
};


const QMetaObject *MythSql::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MythSql::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MythSql.stringdata))
        return static_cast<void*>(const_cast< MythSql*>(this));
    return QObject::qt_metacast(_clname);
}

int MythSql::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 3;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = hostName(); break;
        case 1: *reinterpret_cast< QString*>(_v) = databaseName(); break;
        case 2: *reinterpret_cast< QString*>(_v) = user(); break;
        case 3: *reinterpret_cast< QString*>(_v) = password(); break;
        }
        _id -= 4;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setHostName(*reinterpret_cast< QString*>(_v)); break;
        case 1: setdatabaseName(*reinterpret_cast< QString*>(_v)); break;
        case 2: setUser(*reinterpret_cast< QString*>(_v)); break;
        case 3: setPassword(*reinterpret_cast< QString*>(_v)); break;
        }
        _id -= 4;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 4;
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
