@AbapCatalog.sqlViewName: 'Z05CUSTASSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 11'
define view Z05_CUSTOMER_WITH_PATH
  with parameters
    p_flights_before : abap.dats @<Environment.systemField: #SYSTEM_DATE
  as select from Z05_ASSOCIATION
{
  key Customid        as id,
    
      _Customer.name,
      _Customer.postcode,
      _Customer.street,
      _Customer.city,
      _Customer.country,
      @Semantics.amount.currencyCode: 'CURRENCY'
      sum( Price )    as Amount,
      Currency,
      avg(Days_Ahead) as Days_Ahead
}
where Flight_Date < $parameters.p_flights_before
group by
  Customid,
  _Customer.name,
  _Customer.street,
  _Customer.postcode,
  _Customer.city,
  _Customer.country,
  Currency
