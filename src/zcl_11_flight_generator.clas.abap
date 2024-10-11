CLASS zcl_11_flight_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_flight_generator IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  "Delete Data
  delete from z11_flight.
  out->write( |Deleted: { sy-dbcnt }| ).

 "Create Data
  data flight type z11_flight.
  data flights type table of z11_flight.

  flight-client = sy-mandt.
  flight-airline_id = 'LH'.
  flight-connection_id = '0400'.
  flight-flight_date = '20241117'.
  flight-flight_price = '325.88'.
  flight-currency_code = 'EUR'.
  flight-created_by = sy-uname.
  get TIME STAMP FIELD flight-created_at.
  flight-local_last_changed_by = sy-uname.
  get TIME STAMP FIELD flight-local_last_changed_at.
  get TIME STAMP FIELD flight-last_changed_at.

  append flight to flights.
    flight-client = sy-mandt.
  flight-airline_id = 'LH'.
  flight-connection_id = '0300'.
  flight-flight_date = '20240104'.
  flight-flight_price = '333.88'.
  flight-currency_code = 'EUR'.
  flight-created_by = sy-uname.
  get TIME STAMP FIELD flight-created_at.
  flight-local_last_changed_by = sy-uname.
  get TIME STAMP FIELD flight-local_last_changed_at.
  get TIME STAMP FIELD flight-last_changed_at.

  append flight to flights.
    flight-client = sy-mandt.
  flight-airline_id = 'LH'.
  flight-connection_id = '0500'.
  flight-flight_date = '20401117'.
  flight-flight_price = '399.88'.
  flight-currency_code = 'EUR'.
  flight-created_by = sy-uname.
  get TIME STAMP FIELD flight-created_at.
  flight-local_last_changed_by = sy-uname.
  get TIME STAMP FIELD flight-local_last_changed_at.
  get TIME STAMP FIELD flight-last_changed_at.

  append flight to flights.
  "Insert Data
  insert z11_flight from table @flights.
  out->write( |Inserted: { sy-dbcnt }| ).




  ENDMETHOD.
ENDCLASS.
