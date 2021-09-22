@AbapCatalog.sqlViewName: 'Z05SIMPLE'
 @AbapCatalog.compiler.compareFilter: true
 @AbapCatalog.preserveKey: true
 @AccessControl.authorizationCheck: #CHECK
 @EndUserText.label: 'Simple data definition'
 define view Z05_Simple as select from sbook {
   key carrid as Carrid,
   key connid as Connid,
   key fldate as Fldate,
   key bookid as Bookid,
   customid as Customid,
   class as Class,
   forcuram as Forcuram,
   forcurkey as Forcurkey,
   luggweight as Luggweight,
   wunit as Wunit,
   order_date as OrderDate,
   counter as Counter,
   agencynum as Agencynum
 }
