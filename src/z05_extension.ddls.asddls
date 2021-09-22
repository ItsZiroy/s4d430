@AbapCatalog.sqlViewAppendName: 'Z05EXTENSION'
@EndUserText.label: 'Übung 14'
extend view Z05_EXTENDED with Z05_EXTENSION
association[1] to spfli as _connection on b.carrid = _connection.carrid and b.connid = _connection.connid {
    b.class as class,
    b.counter as Counter,
    _connection
}
