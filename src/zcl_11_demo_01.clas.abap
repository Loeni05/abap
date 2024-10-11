CLASS zcl_11_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_demo_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data departure_airport_id type z11_departure_airport_id.

  types: begin of st_connection,
         carrier_id type /dmo/carrier_id,
         connection_id type /dmo/connection_id,
         end of st_connection.
         data connection type st_connection. "local definition
         data connection2 type z11_connection. "structure type
        connection2-administrative_data-local_last_changed_by = sy-uname.
         connection2-created_by = sy-uname.

       "internal Table
       types tt_connections type table of st_connection. "type standard table of st_connection with non-unique key
        data connections type tt_connections. "local definition
        data connections2 type  Z11_CONNECTIONS. "table type
*         data departure_airport_id type z11_departure_airport.
  ENDMETHOD.
ENDCLASS.
