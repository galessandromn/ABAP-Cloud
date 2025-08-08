CLASS zcl_ejerc_08_08_2025_gm_1582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejerc_08_08_2025_gm_1582 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*"EJERCICIO 1: Crea una tabla interna con los datos de 15 vuelos simulados. Cada vuelo tendrá:
*Un ID de usuario (iduser)
*Un código de aerolínea (aircode)
*Un número de vuelo (flightnum)
*Una clave de país (key)
*Número de asientos ocupados (seat)
*Fecha del vuelo (flightdate)
*Utiliza una expresión FOR con UNTIL para crear los datos dinámicamente.

*    TYPES: BEGIN OF ty_vuelos1,
*             iduser     TYPE /dmo/customer_id,
*             aircode    TYPE /dmo/carrier_id,
*             flightnum  TYPE /dmo/connection_id,
*             key        TYPE char40, "Antes estaba /dmo/connection. Se coloca un tipo propio para que no utilice el resto de la tabla de base de datos"
*             seat       TYPE /dmo/plane_seats_occupied,
*             flightdate TYPE /dmo/flight_date,
*           END OF ty_vuelos1.
*
*    DATA: lt_vuelos1      TYPE TABLE OF ty_vuelos1,
*          lt_info_vuelos1 TYPE TABLE OF ty_vuelos1.
*    out->write( 'EJERCICIO 1' ).
*    out->write( data = lt_vuelos1 name = 'ANTES / lt_vuelos1' ).
*
*    lt_vuelos1 = VALUE #( FOR i = 1 UNTIL i > 15
*                         ( iduser = | { 100 + i } |
*                           aircode = 'IB'
*                           flightnum = | { 747 - 30 * i } |
*                           key = 'ES'
*                           seat = | { 1 + i } |
*                           flightdate = cl_abap_context_info=>get_system_date(  ) + i ) ).
*
*    out->write( |\n| ).
*    out->write( data = lt_vuelos1 name = 'DESPUÉS / lt_vuelos1' ).
*    out->write( |\n| ).
*
*    "EJERCICIO 2: Con la tabla de vuelos del ejercicio anterior, elimina todos los vuelos cuyo número de vuelo sea menor que '0405'
*
** SELECT FROM /dmo/flight  "FORMA CONVENCIONAL"
**    FIELDS *
**    INTO TABLE @DATA(lt_vuelos2).
*
*    out->write( 'EJERCICIO 2' ).
*
*    SELECT iduser, aircode, flightnum, key, seat, flightdate
*    FROM @lt_vuelos1 AS lt_vuelos2
*    INTO TABLE @DATA(lt_vuelos2_struc).
*
*    DATA: ls_vuelos2_struc TYPE ty_vuelos1.
*
*    IF sy-subrc = 0.
*      out->write( data = lt_vuelos2_struc name = 'ANTES / lt_vuelos2_struc' ).
*
*      SORT lt_vuelos2_struc BY flightnum ASCENDING. "Para que elimine primero los que son inferiores al valor indicado"
*
*      LOOP AT lt_vuelos2_struc INTO ls_vuelos2_struc.
*
*        IF ls_vuelos2_struc-flightnum < 0405.
*
*          DELETE TABLE lt_vuelos2_struc FROM ls_vuelos2_struc.
*
*        ENDIF.
*
*      ENDLOOP.
*
*    ENDIF.
*
*    SORT lt_vuelos2_struc BY iduser ASCENDING.
*
*    out->write( |\n| ).
*    out->write( data = lt_vuelos2_struc name = 'DESPUÉS / lt_vuelos2_struc' ).
*
*    "EJERCICIO 3: eje 3 *Actualiza la tabla interna lt_flights para:
**Cambiar la aircode a 'UPD' si seat es mayor a 20.
**Cambiar el flightdate al día actual para esos mismos vuelos.
*
*    out->write( 'EJERCICIO 3' ).
*
*    LOOP AT lt_vuelos1 INTO DATA(ls_vuelos3).
*      IF ls_vuelos3-seat > '10'.
*
*        MODIFY lt_vuelos1 FROM VALUE #( flightdate = cl_abap_context_info=>get_system_date(  )
*                                        aircode = 'UPD') TRANSPORTING flightdate aircode.
*
*      ENDIF.
*
*    ENDLOOP.
*
*    out->write( |\n| ).
*    out->write( data = lt_vuelos1 name = 'TABLA lt_vuelos1 ACTUALIZADA' ).
*    out->write( |\n| ).
*
*    "EJERCICIO 4: Crea dos tablas internas:
**lt_vuelos: contiene información de vuelos (aerolínea, número de vuelo y fecha).
**lt_precios: contiene información de precios de vuelo por aerolínea y número de vuelo.
**Crea una tercera tabla lt_resultado que combine los datos de ambas, solo si coinciden en aircode y flightnum.
**Usa una expresión VALUE #( FOR ... FOR ... ) (for anidado) para construir la tabla resultado.
*
**Tipos y datos simulados:
*
*    out->write( 'EJERCICIO 4' ).
*
*    TYPES: BEGIN OF ty_vuelo,
*             aircode    TYPE /dmo/carrier_id,
*             flightnum  TYPE /dmo/connection_id,
*             flightdate TYPE /dmo/flight_date,
*           END OF ty_vuelo.
*
*    TYPES: BEGIN OF ty_precio,
*             aircode     TYPE /dmo/carrier_id,
*             flightnum   TYPE /dmo/connection_id,
*             flightprice TYPE /dmo/flight_price,
*             currency    TYPE /dmo/currency_code,
*           END OF ty_precio.
*
*    TYPES: BEGIN OF ty_resultado,
*             aircode     TYPE /dmo/carrier_id,
*             flightnum   TYPE /dmo/connection_id,
*             flightdate  TYPE /dmo/flight_date,
*             flightprice TYPE /dmo/flight_price,
*             currency    TYPE /dmo/currency_code,
*           END OF ty_resultado.
*
*    DATA: lt_vuelos    TYPE STANDARD TABLE OF ty_vuelo,
*          lt_precios   TYPE STANDARD TABLE OF ty_precio,
*          lt_resultado TYPE SORTED TABLE OF ty_resultado WITH NON-UNIQUE KEY aircode flightnum.
*
*
*    lt_resultado = VALUE #(
*
*                            FOR ls_vuelos IN lt_vuelos WHERE ( aircode = 'LH' )
*
*                                FOR ls_precios IN lt_precios WHERE ( aircode = 'LH' AND flightnum = ls_vuelos-flightnum )
*
*                                ( aircode = ls_vuelos-aircode
*                                  flightnum = ls_vuelos-flightnum
*                                  flightdate = ls_vuelos-flightdate
*                                  flightprice = ls_precios-flightprice
*                                  currency = ls_precios-currency ) ).
*
*    out->write( |\n| ).
*    out->write( data = lt_vuelos name = 'TABLA lt_vuelos' ).
*    out->write( |\n| ).
*    out->write( data = lt_precios name = 'TABLA lt_precios' ).
*    out->write( |\n| ).
*    out->write( data = lt_resultado name = 'TABLA lt_resultado' ).
*
*    """""VERSIÓN DEL PROFE PARA EL APARTADO 4"""""
*
*    *    " 1) Definición de tipos
**    "-----------------------------
*    TYPES: BEGIN OF ty_vuelo,
*             aircode    TYPE /dmo/carrier_id,     " Aerolínea (p.ej. 'AA', 'LH')
*             flightnum  TYPE /dmo/connection_id,  " Nº de vuelo (p.ej. '0401')
*             flightdate TYPE /dmo/flight_date,    " Fecha del vuelo
*           END OF ty_vuelo.
*
*    TYPES: BEGIN OF ty_precio,
*             aircode     TYPE /dmo/carrier_id,     " Aerolínea
*             flightnum   TYPE /dmo/connection_id,  " Nº de vuelo
*             flightprice TYPE /dmo/flight_price,   " Precio
*             currency    TYPE /dmo/currency_code,  " Moneda
*           END OF ty_precio.
*
*    TYPES: BEGIN OF ty_resultado,
*             aircode     TYPE /dmo/carrier_id,
*             flightnum   TYPE /dmo/connection_id,
*             flightdate  TYPE /dmo/flight_date,
*             flightprice TYPE /dmo/flight_price,
*             currency    TYPE /dmo/currency_code,
*           END OF ty_resultado.
*
*    " Tablas internas resultado y de datos
*    DATA: lt_vuelos     TYPE STANDARD TABLE OF ty_vuelo,
*          lt_precios    TYPE STANDARD TABLE OF ty_precio,
*          lt_resultado  TYPE STANDARD TABLE OF ty_resultado.
*
*    "------------------------------------------
*    " 2) Carga de DATOS SIMULADOS (no de BBDD)
*    "------------------------------------------
*    " Dos vuelos de AA y uno de LH; uno de ellos NO tendrá precio para que se vea
*    " que el join por FOR anidado solo devuelve coincidencias.
*    lt_vuelos = VALUE #(
*      ( aircode = 'AA' flightnum = '0401' flightdate = '20250731' )
*      ( aircode = 'AA' flightnum = '0402' flightdate = '20250801' )
*      ( aircode = 'LH' flightnum = '0500' flightdate = '20250815' )
*    ).
*
*    " Precios: uno para AA-0401 y otro para LH-0500.
*    " Deliberadamente NO ponemos precio de AA-0402 para comprobar el filtrado.
*    lt_precios = VALUE #(
*      ( aircode = 'AA' flightnum = '0401' flightprice = '399.00' currency = 'USD' )
*      ( aircode = 'LH' flightnum = '0500' flightprice = '520.00' currency = 'EUR' )
*      " ( aircode = 'AA' flightnum = '0402' ... )  -> a propósito no existe
*    ).
*
*    " Mostrar datos de partida
*    out->write( data = lt_vuelos  name = `lt_vuelos (datos simulados)` ).
*    out->write( data = lt_precios name = `lt_precios (datos simulados)` ).
*
*    "---------------------------------------------------------------------------------
*    " 3) Construcción de lt_resultado con VALUE #( FOR ... FOR ... )
*    "
*    "    - Primer FOR recorre cada vuelo.
*    "    - Segundo FOR recorre precios PERO filtrados por coincidencia de claves:
*    "        aircode = gs_vuelo-aircode AND flightnum = gs_vuelo-flightnum
*    "    - El paréntesis final (...) crea la línea del tipo ty_resultado
*    "      combinando campos de ambas tablas (equivale a un INNER JOIN en memoria).
*    "---------------------------------------------------------------------------------
*    lt_resultado = VALUE #(
*      FOR gs_vuelo  IN lt_vuelos
*        FOR gs_prec  IN lt_precios
*          WHERE ( aircode  = gs_vuelo-aircode
*                  AND flightnum = gs_vuelo-flightnum )
*          ( aircode     = gs_vuelo-aircode
*            flightnum   = gs_vuelo-flightnum
*            flightdate  = gs_vuelo-flightdate
*            flightprice = gs_prec-flightprice
*            currency    = gs_prec-currency )
*    ).
*
*    "-----------------------------------------
*    " 4) Salida: solo aparecen coincidencias
*    "    Esperado con los datos de ejemplo:
*    "      - AA 0401 (tiene precio)   -> aparece
*    "      - AA 0402 (sin precio)     -> NO aparece
*    "      - LH 0500 (tiene precio)   -> aparece
*    "-----------------------------------------
*    out->write( data = lt_resultado name = `lt_resultado (join por FOR anidado)` ).

"EJERCICIO 5: Crea un programa que muestre solo los vuelos cuya fecha (flight_date) esté dentro de un rango de fechas específico, usando tablas de rangos.
*Pasos que debe cumplir:
*Declarar una tabla de rangos para flight_date.
*Añadir dos condiciones al rango:
*Fechas entre '2025-01-01' y '2025-12-31'.
*Excluir la fecha '2025-06-01'.
*Usar la tabla de rangos en un SELECT sobre /dmo/flight.
*Mostrar el carrier_id, connection_id y flight_date de los vuelos que cumplan.

"PASO 1 - Declaración de la tabla"

DATA lr_vuelos TYPE RANGE OF /dmo/flight_date.

"PASO 2 - Incorporación de valores"

APPEND VALUE #( sign = 'I' option = 'BT' low = '20250101' high = '20251231' ) TO lr_vuelos.
APPEND VALUE #( sign = 'E' option = 'EQ' low = '20250601' ) TO lr_vuelos.

"PASO 3 - Selección de variables"

DATA: lt_vuelos5 TYPE TABLE OF /dmo/flight.

SELECT *
FROM /dmo/flight
WHERE flight_date IN @lr_vuelos
INTO TABLE @lt_vuelos5.

out->write( 'EJERCICIO 5' ).

 LOOP AT lt_vuelos5 INTO DATA(ls_estruc_vuelo).

 out->write( |FECHA: { ls_estruc_vuelo-flight_date } AEROLÍNEA: { ls_estruc_vuelo-carrier_id }| ).

 ENDLOOP.

  ENDMETHOD.
ENDCLASS.
