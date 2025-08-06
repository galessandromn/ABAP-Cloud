CLASS zcl_constantes_gm_1582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_constantes_gm_1582 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    CONSTANTS: lc_pais    TYPE string VALUE 'España',
*               lc_moneda  TYPE string VALUE 'EUR',
*               lc_ahorros TYPE i VALUE 10,
*               lc_iva     TYPE p LENGTH 8 DECIMALS 3 VALUE '21.00'.
*
*    DATA: lv_total_ahorros type i,
*          lv_ahorros2 type i value 9.
*
*          lv_total_ahorros = lc_ahorros + lv_ahorros2.
*
*    out->write( lv_total_ahorros ).

    "EJERCICIO 1 - ÁREA DE UN CÍRCULO
*    Declara una constante que represente el número pi (3,14) y una variable entera que almacene el radio de un círculo. Calcula el área del círculo utulizando la fórmula Área = pi * radio2 y muestra el resultado con un mensaje que incluya el valor del
*    radio y el área calculada."

    DATA: lv_radio TYPE p LENGTH 6 DECIMALS 2 VALUE '1.40',
          lv_area  TYPE p LENGTH 8 DECIMALS 2.

    "Fórmula: pi * r cuadrado.

    CONSTANTS lc_pi TYPE p LENGTH 8 DECIMALS 2 VALUE '3.14'.

    lv_area = lc_pi * ( lv_radio * lv_radio ).
    out->write( lv_area ).

    "EJERCICIO 2 - Operaciones aritméticas básicas"
*    Declara dos variables enteras con valores numéricos a tu elección. Luego calcula y muestra el resultado de:
*    Suma
*    Resta
*    Multiplicación
*    División ( con decimales )
*
*    Presenta los resultados en una sola línea utilizando interpolación.

    DATA: lv_dato1 TYPE i VALUE 26,
          lv_dato2 TYPE i VALUE 31,
          lv_ans   TYPE p LENGTH 8 DECIMALS 4.
*    lv_ans = lv_dato1 + lv_dato2.
*    out->write( lv_ans ).
*    lv_ans = lv_dato1 - lv_dato2.
*    out->write( lv_ans ).
*    lv_ans = lv_dato1 * lv_dato2.
*    out->write( lv_ans ).
*    lv_ans = lv_dato1 / lv_dato2.
*    out->write( lv_ans ).

    "Otra manera"

    DATA: lv_ans1 type p length 8 decimals 4,
          lv_ans2 type p length 8 decimals 4,
          lv_ans3 type p length 8 decimals 4,
          lv_ans4 type p length 8 decimals 4.

    lv_ans1 = lv_dato1 + lv_dato2.
    lv_ans2 = lv_dato1 - lv_dato2.
    lv_ans3 = lv_dato1 * lv_dato2.
    lv_ans4 = lv_dato1 / lv_dato2.

    out->write( |Suma = { lv_ans1 } Resta = { lv_ans2 } Multiplicación = { lv_ans3 } División = { lv_ans4 }| ).

  ENDMETHOD.
ENDCLASS.
