@AbapCatalog.sqlViewName: 'Z05AUTH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog: {
    buffering: { status: #ACTIVE, type: #GENERIC, numberOfKeyFields: 4 }
}
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Annotation test'
define view Z05_AUTHORIZATIONS
  as select from Z05_BOOKING as b
  association [1..1] to Z05_CUSTOMER as _Customer on $projection.Customid = _Customer.id
  association[1] to spfli as _Connection on b.carrid = _Connection.carrid and b.connid = _Connection.connid
  association [*] to sflight as _Flights on b.carrid = _Flights.carrid and b.connid = _Flights.connid
{
  key    b.carrid     as Carrier,
  key    b.connid     as Connection_ID,
  key    b.fldate     as Flight_Date,
  key    b.bookid     as Booking_ID,
         b.customid   as Customid,
         b.class      as Class,
         b.price      as Price,
         b.currency   as Currency,
         b.order_date as OrderDate,
         b.days_ahead as Days_Ahead,
         // c.name       as Name,
         // c.street     as Street,
         // c.city       as City,
         // c.postcode   as Postcode,
         // c.country    as Country,
         // c.Discount   as Discount
         _Customer,
         _Connection,
         _Flights,
         avg(_Flights.seatsocc as abap.dec( 16, 2 )) as avg_seats_occ
}   
group by
    carrid,
    b.connid,
    b.fldate,
    b.customid,
    b.class,
    b.bookid,
    b.price,
    b.currency,
    b.order_date,
    b.days_ahead

