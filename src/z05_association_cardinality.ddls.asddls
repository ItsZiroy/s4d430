@AbapCatalog.sqlViewName: 'Z05_ASSOCARD'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo: Cardinality of Associations'
define view Z05_ASSOCIATION_CARDINALITY as select 
  from spfli as c
    association[1..1]  to scarr as _Carrier
                       on $projection.carrid = _Carrier.carrid
                       
    association        to sairport as _DestAirport   // same as [1] and [0..1]                                                
     
                       on $projection.airpto = _DestAirport.id
                                                
    association[*]     to sflight as _Flights         // short for [0..*]
                       on $projection.carrid = _Flights.carrid      
                      and $projection.connid = _Flights.connid

   {
     key carrid,
     key connid,
         _Carrier.carrname,
         airpto,
         _DestAirport.name     as dest_airport_name,
         min(_Flights.fldate)   as earliest_flight                
}
group by carrid,
         connid,
         _Carrier.carrname,
         airpto,
         _DestAirport.name,
         _Flights.planetype 
         
          
 