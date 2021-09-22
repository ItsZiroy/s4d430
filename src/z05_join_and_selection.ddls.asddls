@AbapCatalog.sqlViewName: 'Z05JOIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Join and selection test'
define view Z05_JOIN_AND_SELECTION
  as select from sbook   as b
    inner join   scustom as c on  b.customid  = c.id
                              and b.cancelled <> 'X'
{
  key carrid     as Carrier,
  key connid     as Connection_ID,
  key fldate     as Flight_Date,
  key bookid     as Booking_ID,
      customid   as Customid,
      class      as Class,
      forcuram   as Amount,
      forcurkey  as Currency,
      b.luggweight as Luggage_Weight,
      wunit      as Weight_Unit,
      order_date as OrderDate,
      counter    as Counter,
      agencynum  as Agencynum,
      c.name     as Name,
      c.street   as Street,
      c.city     as City,
      c.postcode as Postcode,
      c.country  as Country
}
