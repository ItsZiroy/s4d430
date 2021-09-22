@AbapCatalog.sqlViewName: 'Z05CUSTOM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Annotation test'
define view Z05_CUSTOMER
  as select from scustom as c
{
  key id,
      concat_with_space(c.form, c.name, 1)            as name,
      street                                          as street,
      city                                            as city,
      postcode                                        as postcode,
      country                                         as country,
      @EndUserText.quickInfo: 'Customer Discount Factor'
      division(cast(c.discount as abap.int4), 100, 2) as Discount
}
