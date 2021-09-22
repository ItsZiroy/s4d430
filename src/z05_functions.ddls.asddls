@AbapCatalog.sqlViewName: 'Z05FUNC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog: {
    buffering: { status: #ACTIVE, type: #GENERIC, numberOfKeyFields: 4 }
}
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Annotation test'
define view Z05_FUNCTIONS
  as select from sbook   as b
    inner join   scustom as c on  b.customid  =  c.id
                              and b.cancelled <> 'X'
{
  key    carrid                                          as Carrier,
  key    connid                                          as Connection_ID,
  key    fldate                                          as Flight_Date,
  key    bookid                                          as Booking_ID,
         customid                                        as Customid,
         case class
            when 'Y' then 'Economy'
            when 'C' then 'Business'
            when 'F' then 'First'
            else ''
         end                                             as Class,
         @Semantics.amount.currencyCode: 'CURRENCY'
         currency_conversion(
            amount => b.forcuram,
            source_currency => b.forcurkey,
            target_currency => cast('USD' as abap.cuky),
            exchange_rate_type => 'M',
            exchange_rate_date => b.order_date )         as price,
         @Semantics.currencyCode: true
         cast('USD' as abap.cuky)                        as Currency,
         @Semantics.quantity.unitOfMeasure: 'WEIGHT_UNIT'
         b.luggweight                                    as Luggage_Weight,
         @Semantics.unitOfMeasure: true
         wunit                                           as Weight_Unit,
         order_date                                      as OrderDate,
         dats_days_between(order_date, fldate)           as Days_Ahead,
         counter                                         as Counter,
         agencynum                                       as Agencynum,
         concat_with_space(c.form, c.name, 1)            as Name,
         c.street                                        as Street,
         c.city                                          as City,
         c.postcode                                      as Postcode,
         c.country                                       as Country,
         @EndUserText.quickInfo: 'Customer Discount Factor'
         division(cast(c.discount as abap.int4), 100, 2) as Discount
}
