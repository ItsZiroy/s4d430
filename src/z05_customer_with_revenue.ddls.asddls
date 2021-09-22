@AbapCatalog.sqlViewName: 'Z05CUSTREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer with revenue'
define view Z05_CUSTOMER_WITH_REVENUE
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
group by
  Customid,
  Name,
  Street,
  Postcode,
  City,
  Country,
  Currency
  

