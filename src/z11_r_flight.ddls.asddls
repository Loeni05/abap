@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Z11_R_Flight as select from /dmo/flight
{
  key carrier_id as CarrierId,
  key connection_id as ConnectionId,
  key flight_date as FlightDate,
        @Semantics.amount.currencyCode: 'CurrencyCode'
        price as Price,
        currency_code as CurrencyCode,
        plane_type_id as PlaneTypeId,
        seats_max as SeatsMax,
        seats_occupied as SeatsOccupied
}


