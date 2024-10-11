CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.
    METHODS ratemovie FOR MODIFY
      IMPORTING keys FOR ACTION movie~ratemovie RESULT result.

ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD RateMovie.
  "Read Movies

     Read ENTITY IN LOCAL MODE Z11_R_Movie
     FIELDS ( MovieUuid )
     with corresponding #( keys )
     result data(movies).

     "Validate Rating
     loop at keys into data(key).

     if key-%param-Rating < 1 or key-%param-Rating > 10.
     "Todo:Fehlerbehandlung
     return.
     endif.



"Create Rating

data rating type Z11_R_Rating.
rating-MovieUuid = movies[  sy-tabix  ]-MovieUuid.
rating-Rating = key-%param-Rating.
rating-RatingDate = sy-datum.
rating-UserName = sy-uname.


Modify entity in local mode Z11_R_Movie
  Create by \_Ratings
  fields (  Rating RatingDate UserName RatingUuid MovieUuid )
  with value #( ( %cid_ref = Key-%cid_ref
  %target = value #( (   %cid = 1
                      MovieUuid = rating-MovieUuid
                      Rating = rating-Rating
                      RatingDate = rating-RatingDate
                      UserName = rating-UserName ) ) ) ).

endloop.
result = Value #(  For m IN movies (  %tky = m-%tky %param = m ) ).

  ENDMETHOD.

ENDCLASS.
