@AbapCatalog.sqlViewName: 'Z05ANNO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog: {
    buffering: { status: #ACTIVE, type: #GENERIC, numberOfKeyFields: 4 }
}
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Annotation test'
define view Z05_ANNOTATIONS
  as select from sbook   as b
    inner join   scustom as c on  b.customid  =  c.id
                              and b.cancelled <> 'X'
{
  key    carrid       as Carrier,
  key    connid       as Connection_ID,
  key    fldate       as Flight_Date,
  key       bookid       as Booking_ID,
         customid     as Customid,
         class        as Class,
         @Semantics.amount.currencyCode: 'CURRENCY'
         forcuram     as Amount,
         @Semantics.currencyCode: true
         forcurkey    as Currency,
         @Semantics.quantity.unitOfMeasure: 'WEIGHT_UNIT'
         b.luggweight as Luggage_Weight,
         @Semantics.unitOfMeasure: true
         wunit        as Weight_Unit,
         order_date   as OrderDate,
         counter      as Counter,
         agencynum    as Agencynum,
         c.name       as Name,
         c.street     as Street,
         c.city       as City,
         c.postcode   as Postcode,
         c.country    as Country
}
