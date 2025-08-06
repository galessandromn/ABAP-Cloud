CLASS zcl_ejerc_29_07_2025_gm_1582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejerc_29_07_2025_gm_1582 IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.


"""""""""29/07/2025"""""""""

"EJERCICIO 1: Recuperar el ejercicio de SPLIT de "Funcion_Caracteres" y obtener la misma funcionalidad sustituyendo "IF" por "DO".

DATA lv_string TYPE string VALUE 'daniel Fernando Pedro ramon Sergio'.

DATA: lv_nom1 type string,
      lv_nom2 type string,
      lv_nom3 type string,
      lv_nom4 type string,
      lv_nom5 type string.

    SPLIT lv_string AT space INTO  lv_nom1 lv_nom2 lv_nom3 lv_nom4 lv_nom5.
    out->write( |{ lv_nom1 } { lv_nom2 } { lv_nom3 } { lv_nom4 } { lv_nom5 }| ).

DATA lv_numero type i.
DATA(lv_nombre) = lv_nom1.

"Se puede usar CASE, IFS, Y CHECKS"

DO 5 TIMES.



lv_numero = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )
        min = 1
        max = 5 )->get_next(  ).

out->write( strlen( lv_nombre ) ).

ENDDO.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

ENDMETHOD.
ENDCLASS.
