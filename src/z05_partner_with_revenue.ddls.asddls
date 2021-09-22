@AbapCatalog.sqlViewName: 'Z05PARTREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'übung 10'
define view Z05_PARTNER_WITH_REVENUE
  as select from Z05_CUSTOMER_WITH_REVENUE
{
  key id,
      'PARTNER' as Typ,
      Name,
      Postcode,
      Street,
      City,
      Country,
      Amount,
      Currency,
      Days_Ahead
}
union select from S4d430_Agency_With_Revenue
{
  id,
  'AGENCY' as Typ,
  name     as Name,
  postcode as Postcode,
  street   as Street,
  city     as City,
  country  as Country,
  amount   as Amount,
  currency as Currency,
  days_ahead
}
