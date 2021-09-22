@AbapCatalog.sqlViewName: 'Z05BOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog: {
    buffering: { status: #ACTIVE, type: #GENERIC, numberOfKeyFields: 4 }
}
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Annotation test'
define view Z05_BOOKING
  as select from sbook as b 
{
  key    carrid,
  key    connid,
  key    fldate,
  key    bookid,
         customid,
         case class
            when 'Y' then 'Economy'
            when 'C' then 'Business'
            when 'F' then 'First'
            else ''
         end                                     as class,

         @Semantics.amount.currencyCode: 'CURRENCY'
         currency_conversion(
            amount => b.forcuram,
            source_currency => b.forcurkey,
            target_currency => cast('USD' as abap.cuky),
            exchange_rate_type => 'M',
            exchange_rate_date => b.order_date ) as price,
         @Semantics.currencyCode: true
         cast('USD' as abap.cuky)                as currency,
         @Semantics.quantity.unitOfMeasure: 'WUNIT'
         luggweight,
         @Semantics.unitOfMeasure: true
         wunit,
         order_date,
         dats_days_between(order_date, fldate)   as days_ahead,
         counter,
         agencynum
}
where
  b.cancelled <> 'X'
