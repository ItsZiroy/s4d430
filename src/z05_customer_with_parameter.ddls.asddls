@AbapCatalog.sqlViewName: 'Z05CUSTREV2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 11'
define view Z05_CUSTOMER_WITH_PARAMETER
  with parameters
    p_flights_before : abap.dats @<Environment.systemField: #SYSTEM_DATE
  as select from Z05_BOOKING_AND_CUSTOMER
{
  key Customid        as id,
      Name,
      Postcode,
      Street,
      City,
      Country,
      @Semantics.amount.currencyCode: 'CURRENCY'
      sum( Price )    as Amount,
      Currency,
      avg(Days_Ahead) as Days_Ahead
}
where Flight_Date < $parameters.p_flights_before
group by
  Customid,
  Name,
  Street,
  Postcode,
  City,
  Country,
  Currency
