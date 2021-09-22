@AbapCatalog.sqlViewName: 'Z05BOOKCUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog: {
    buffering: { status: #ACTIVE, type: #GENERIC, numberOfKeyFields: 4 }
}
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Annotation test'
define view Z05_BOOKING_AND_CUSTOMER
  as select from Z05_BOOKING  as b
    inner join   Z05_CUSTOMER as c on b.customid = c.id
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
         c.name       as Name,
         c.street     as Street,
         c.city       as City,
         c.postcode   as Postcode,
         c.country    as Country,
         c.Discount   as Discount
}
