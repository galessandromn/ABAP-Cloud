CLASS zcl_tablas_gm_1582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tablas_gm_1582 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    "INTRODUCCIÓN DE DATOS EN UNA TABLA"
*
*    "FUNCIÓN INSERT --> Sirve para tablas estándar, hash y sorted.
*
*    TYPES: BEGIN OF ty_persona,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_persona.
*
*    TYPES: ty_tabla_personas TYPE STANDARD TABLE OF ty_persona WITH EMPTY KEY.
*
*    DATA: lt_personas TYPE ty_tabla_personas,
*          ls_persona  TYPE ty_persona.
*
*    ls_persona-nombre = 'Carlos'. "Este es el completado forzoso o 'a piñón'."
*    ls_persona-edad = 40.
*
*    "Ahora, hay que introducir los datos en la tabla. Para ello, hay que usar la sentencia INSERT."
*
*    INSERT ls_persona INTO lt_personas INDEX 1. "El INDEX indica la fila de la tabla en la que se producirá el cambio."
*
*    "Para un nuevo registro en la tabla, se debe repetir el procedimiento (recuerda, esta vía es forzosa o 'a piñón')."
*
*    ls_persona-nombre = 'Maria'.
*    ls_persona-edad = 30.
*
*    INSERT ls_persona INTO lt_personas INDEX 2. "Se actualiza el índice para indicar que debe ir en la fila 2."
*
*    ls_persona-nombre = 'Pedro'.
*    ls_persona-edad = 34.
*
*    INSERT ls_persona INTO lt_personas INDEX 3.
*
*    "Para la impresión, se debe usar el comando LOOP. Se necesita de la estructura también."
*
*    LOOP AT lt_personas INTO ls_persona. "Esto se hace porque, para imprimir por consola, la estructura va compilando datos según los va encontrando."
*      out->write( |Nombre: { ls_persona-nombre }, edad: { ls_persona-edad }| ).
*
*    ENDLOOP.
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "INSERT VALUE --> No se necesita referenciar la estructura, sino que importa el tipo de variables desde una tabla externa."
*
*    DATA lt_aeropuerto TYPE STANDARD TABLE OF /dmo/airport.
*
*    INSERT VALUE #(
*                    client = 100
*                    airport_id = 'FRA'
*                    name = 'Frankfurt Airport'
*                    city = 'Frankfurt/Main'
*                    country = 'DE'
*       ) INTO TABLE lt_aeropuerto. "Si se añade el index, se indica la fila de la tabla en la que se quiere introducir los datos."
*
*    out->write( |\n| ).
*    out->write( lt_aeropuerto ).
*
*    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "INSERT INITIAL LINE INTO TABLE --> Sirve para colocar una línea en blanco en la tabla"
*
*    INSERT INITIAL LINE INTO TABLE lt_aeropuerto.
*    out->write( lt_aeropuerto ).
*
*    "Igualación de tablas internas --> Con palabra 'like'."
*
*    DATA lt_aeropuerto2 LIKE lt_aeropuerto.
*    out->write( lt_aeropuerto2 ).
*
*    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*    "Duplicar el contenido
*
*    INSERT LINES OF lt_aeropuerto INTO TABLE lt_aeropuerto2.
*
*    out->write( data = lt_aeropuerto name = 'lt_aeropuerto' ).
*    out->write( |\n| ).
*    out->write( data = lt_aeropuerto2 name = 'lt_aeropuerto2' ).
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "FUNCIÓN APPEND -> No permite especificar líneas, sino que busca la última línea de la tabla e inserta los datos."
*    "SOLO FUNCIONA CON TABLAS STANDARD."
*
*    TYPES: BEGIN OF ty_persona2,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_persona2.
*
*    TYPES: ty_tabla_personas2 TYPE STANDARD TABLE OF ty_persona2 WITH EMPTY KEY.
*
*    DATA: lt_personas2 TYPE ty_tabla_personas2,
*          ls_persona2  TYPE ty_persona2.
*
*    ls_persona2-nombre = 'Daniel'.
*    ls_persona2-edad = 23.
*
*    APPEND ls_persona2 TO lt_personas2.
*
*    out->write( lt_personas ).
*
*    "VARIACIONES DEL APPEND"
*
*    "Declaración lineal del append"
*
*    APPEND VALUE #(
*
*                    nombre = 'Daniel'
*                    edad = 15
*
*                 )   TO lt_personas2.
*
*    """"""""""
*
*    "Copiar contenido de una tabla a otra"
*
*    APPEND LINES OF lt_personas TO lt_personas2.
*
*    TYPES: BEGIN OF ty_persona3,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_persona3.
*
*    TYPES: ty_tabla_personas3 TYPE STANDARD TABLE OF ty_persona3.
*
*    DATA: lt_personas3 TYPE ty_tabla_personas3,
*          ls_persona3  TYPE ty_persona3.
*
*    DATA lt_personas4 LIKE lt_personas3.
*
*    APPEND LINES OF lt_personas3 TO lt_personas4.
*
*    APPEND LINES OF lt_personas3 TO 2 TO lt_personas4.
*
*    APPEND LINES OF lt_personas3 FROM 4 TO 6 TO  lt_personas4.
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "AÑADIR REGISTROS CON VALUE"
*
*    "Permite añadir registros en una sola línea de código. Es la forma más moderna y legible
*
*    TYPES: BEGIN OF ty_persona4,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_persona4.
*
*    TYPES: ty_tabla_personas4 TYPE STANDARD TABLE OF ty_persona4 WITH EMPTY KEY.
*
*    DATA(lt_persona4) = VALUE ty_tabla_personas(
*        ( nombre = 'Ana' edad = 25 )
*        ( nombre = 'Javier' edad = 45 )
*        ( nombre = 'Lucía' edad = 22 )
*        ).
*
*    "Ahora hay que declarar una estructura para hacer la lectura de datos."
*
*    DATA ls_persona4 TYPE ty_persona4.
*
*    LOOP AT lt_persona4 INTO ls_persona4.
*      out->write( |Nombre: { ls_persona4-nombre }. Edad: { ls_persona4-edad }| ).
*
*    ENDLOOP.
*
*    "Segunda manera de usar el VALUE"
*
*    DATA lt_aeropuerto3 TYPE STANDARD TABLE OF /dmo/airport.
*
*    lt_aeropuerto = VALUE #(
*
*                    (
*                    client = 100
*                    airport_id = 'FRA'
*                    name = 'Frankfurt Airport'
*                    city = 'Frankfurt/Main'
*                    country = 'DE'
*                    )
*       ).
*
*    out->write( lt_aeropuerto3 ).
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "FUNCIÓN READ TABLE --> Su principal utilidad es leer campos."
*
*    "READ TABLE con índice"
*
*    SELECT FROM /dmo/airport
*    FIELDS *
*    WHERE country = 'DE'
*    INTO TABLE @DATA(lt_flights). "Esto hace una importación completa de datos, desde una tabla externa a una interna."
*
*    out->write( lt_flights ).
*
*    IF sy-subrc = 0. "
*
*      READ TABLE lt_flights INTO DATA(ls_flights) INDEX 4.
*      out->write( data = lt_flights name = `tabla de vuelos` ).
*      out->write( data = ls_flights name = `Estructura vuelos` ).
*
*      READ TABLE lt_flights INTO DATA(ls_flights2) INDEX 4 TRANSPORTING airport_id city .
*      out->write( data = ls_flights2 name = `Estructura vuelos` ).
*
*    ENDIF.
*
*    "Forma moderna de usar el read table con índice"
*
*    SELECT FROM /dmo/airport
*    FIELDS *
*    WHERE country = 'DE'
*    INTO TABLE @DATA(lt_flights2).
*
*    IF sy-subrc = 0.
*
*      "la forma moderna de usar del read table con indiceç
*      DATA(ls_data) = lt_flights[ 2 ].
*      out->write( data = ls_data name = `ls_data` ).
*
*    ENDIF.
*
*
*    DATA(ls_data2) = VALUE #( lt_flights[ 20 ] DEFAULT lt_flights[ 1 ] ) .
*
*    "READ TABLE CON CLAVE"
*
*    SELECT FROM /dmo/airport
*    FIELDS *
*    WHERE country = 'DE'
*    INTO TABLE @DATA(lt_flights3).
*
*    IF sy-subrc = 0.
*
*      READ TABLE lt_flights INTO DATA(ls_flight) WITH KEY city = 'Berlin'.
*      out->write( data = lt_flights3 name = `lt_flights` ).
*
*      out->write( data = ls_flight name = `ls_flight` ).
*
*
*    ENDIF.
*
*    "FORMA MODERNA DE USAR READ TABLE CON CLAVE"
*
*    SELECT FROM /dmo/airport
*        FIELDS *
*        WHERE country = 'DE'
*        INTO TABLE @DATA(lt_flights4).
*
*    DATA(ls_flight2) = lt_flights4[ airport_id = 'MUC' ].
*    out->write( data = ls_flight2 name = `ls_flight2` ).
*
*    """
*    DATA(ls_flight4) = lt_flights[ airport_id = 'MUC' ]-name.
*    out->write( data = ls_flight2 name = `ls_flight2` ).
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "06/08/2025"
*
*    "Función CORRESPONDING --> Copia los valores de los campos que tienen el mismo nombre y tipo entre dos estructuras o tablas internas."
*
*    TYPES: BEGIN OF ty_flights,
*             carrier_id    TYPE /dmo/carrier_id,
*             connection_id TYPE /dmo/connection_id,
*             flight_date   TYPE /dmo/flight_date,
*             animales      TYPE string,
*             currency_code TYPE /dmo/currency_code,
*           END OF ty_flights.
*
*    DATA: lt_my_flights TYPE STANDARD TABLE OF ty_flights,
*          ls_my_flight  TYPE ty_flights. "No es necesaria la estructura para este ejemplo."
*
*    "Una vez declarados los tipos y las estructuras y tablas, hay que extraer los datos de la tabla externa. Se usa el comando SELECT."
*
*    SELECT FROM /dmo/flight
*    FIELDS *
*    WHERE currency_code = 'EUR'
*    INTO TABLE @DATA(lt_flights5).
*
*    "Luego, se utiliza la función MOVE-CORRESPONDING para copiar datos"
*
**       MOVE-CORRESPONDING lt_flights to lt_my_flights.
*
*    out->write( data = lt_flights5 name = 'lt_flights' ).
*    out->write( |\n| ).
*    out->write( data = lt_my_flights name = 'lt_my_flights' ).
*
*    "Forma moderna --> lt_my_flights = CORRESPONDING #( lt_flights ).
*
*
*    """"""""""""""
*    "keeping trget lines
*
*    TYPES:BEGIN OF ty_flights2,
*            carrier_id    TYPE /dmo/carrier_id,
*            connection_id TYPE /dmo/connection_id,
*            flight_date   TYPE /dmo/flight_date,
*            animales      TYPE string,
*            currency_code TYPE /dmo/currency_code,
*          END OF ty_flights2.
*
*    DATA: lt_my_flights2 TYPE STANDARD TABLE OF ty_flights2.
*    " ls_my_flight type ty_flights.
*
*    """"""""
*    SELECT FROM /dmo/flight
*    FIELDS *
*    WHERE currency_code = 'EUR'
*    INTO TABLE @DATA(lt_flights6).
*
*
*    lt_my_flights2 = CORRESPONDING #( lt_flights6 ).
*
*
*    MOVE-CORRESPONDING lt_flights6 TO lt_my_flights2 KEEPING TARGET LINES.
*
*
*    out->write( data = lt_flights6 name = `tabla lt_flights` ).
*    out->write( |\n| ).
*    out->write( data = lt_my_flights2 name = `tabla  lt_my_flights` ).
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*    "Chequeo de registros --> Sirve para verificar la existencia de un valor en una tabla."
*
*
*    SELECT FROM /dmo/flight
*      FIELDS *
*      WHERE carrier_id = 'LH'
*      INTO TABLE @DATA(lt_flights7).
*    """""""""""""""""""""""""""""""""""""""""""  esto y lo de arriba son dos formas de hacer exactamente lo mismo
**    DATA lt_flights7 TYPE STANDARD TABLE OF /dmo/flight.
**    SELECT FROM /dmo/flight
**      FIELDS *
**      WHERE carrier_id = 'LH'
**      INTO TABLE @lt_flights.
*
*    out->write( lt_flights7 ).
*
*    IF sy-subrc = 0.
*
*      READ TABLE lt_flights7 WITH KEY connection_id = '0403' TRANSPORTING NO FIELDS.
*
*
*
*
*      IF sy-subrc = 0.
*
*        out->write( 'el vuelo existe en la base de datos' ).
*      ELSE.
*        out->write( 'el vuelo NO existe en la base de datos' ).
*      ENDIF.
*
*    ENDIF.
*
*    "forma moderna
*
*    DATA lt_flights8 TYPE STANDARD TABLE OF /dmo/flight.
*    SELECT FROM /dmo/flight
*      FIELDS *
*      WHERE carrier_id = 'LH'
*      INTO TABLE @lt_flights8.
*
*    out->write( lt_flights8 ).
*
*    IF sy-subrc = 0.
*
*
*      IF line_exists( lt_flights8[ connection_id = '0404' ] ) .
*
*        out->write( 'el vuelo existe en la base de datos' ).
*      ELSE.
*        out->write( 'el vuelo NO existe en la base de datos' ).
*      ENDIF.
*
*    ENDIF.
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "Índice de un registro"
*
*    "line_index --> Devuelve el número de línea donde se encuentra el registro"
*
*    SELECT FROM /dmo/flight
*    FIELDS *
*    WHERE carrier_id = 'LH'
*    INTO TABLE @DATA(lt_flights9).
*
*    READ TABLE lt_flights9 WITH KEY connection_id = '0403' TRANSPORTING NO FIELDS.
*    "El 'transporting no fields' es una sentencia que combinada con el registro, dentro del read table, busca un campo específico. Se necesita esta sentencia."
*
*    DATA(lv_index) = sy-tabix. "Como el sy-index, pero en vez de servir para variables, sirve para tablas"
*    "Almacena la posición del índice de las tablas"
*    out->write( data = lt_flights name = 'lt-flights' ).
*    out->write( |\n| ).
*    out->write( lv_index ).
*
*    "Forma moderna"
*
*    DATA(lv_index2) = line_index( lt_flights9[ connection_id = '0401' ] ).
*    out->write( |\n| ).
*    out->write( data = lt_flights name = 'lt-flights' ).
*    out->write( |\n| ).
*    out->write( lv_index2 ).
*
*    "lines --> Cuenta el número total de líneas en la tabla"
*    out->write( |\n| ).
*    DATA(lv_num) = lines( lt_flights9 ).
*    out->write( data = lv_num name = 'lv_num' ).
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "Loop at"
*
*    TYPES: BEGIN OF ty_persona5,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_persona5.
*
*    TYPES: ty_tabla_personas5 TYPE STANDARD TABLE OF ty_persona5 WITH EMPTY KEY.
*
*
*    DATA(lt_persona5) = VALUE ty_tabla_personas5(
*    ( nombre = 'Ana' edad = 25 )
*    ( nombre = 'Javier' edad = 45 )
*    ( nombre = 'Lucia' edad = 22 )
*
*
*
*    ).
*
*    out->write( lt_persona5 ).
*
*    DATA ls_persona5 TYPE ty_persona.
*
*    LOOP AT lt_persona5 INTO ls_persona5 WHERE nombre = 'Ana' .
*
*      out->write( |Nombre: { ls_persona5-nombre }, Edad: { ls_persona5-edad }| ).
*
*    ENDLOOP.
*
*    "loop con assigning field-symbol
*
*
*    SELECT FROM /dmo/flight
*      FIELDS *
*      WHERE carrier_id = 'LH'
*      INTO TABLE @DATA(lt_flights10).
*
*    DATA ls_flight3 TYPE /dmo/flight.
*
*    "loop "normal"
*
*    LOOP AT lt_flights10 INTO ls_flight3.
*
*      out->write( data = ls_flight3 name = `ls_flight` ).
*    ENDLOOP.
*
*
*    """"""""""""""""""""""""""""""
*
*    "loop con where y field-symbol
*    LOOP AT lt_flights10 ASSIGNING FIELD-SYMBOL(<fs_flight>) WHERE connection_id = '0403'.
*
*      "out->write( data = <fs_flight> name = `<fs_flight>` ).
*    ENDLOOP.
*    out->write( |\n| ).
*    out->write( |\n| ).
*
*
*    "loop con where y estructura creada en linea para almacenar valores
*    LOOP AT lt_flights10 INTO DATA(ls_flight5) WHERE connection_id = '0403'.
*
*      out->write( data = ls_flight5 name = `fs_flight2` ).
*
*    ENDLOOP.
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    SELECT FROM /dmo/flight
*    FIELDS *
*    WHERE carrier_id = 'LH'
*    INTO TABLE @DATA(lt_flights11).
*
*    DATA ls_flight6 TYPE /dmo/flight.
*
*    LOOP AT lt_flights11 ASSIGNING FIELD-SYMBOL(<fs_flight2>) FROM 3 TO 8.
*
*      <fs_flight2>-currency_code = 'COP'.
*    ENDLOOP.
*    out->write( data = lt_flights name = `lt_flights4` ).
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "FOR --> Condición heredada de JAVA. Se puede combinar con otros condicionales. Es el comando ideal para anidar bucles."
*
*    TYPES: BEGIN OF ty_vuelos,
*             iduser     TYPE /dmo/customer_id,
*             aircode    TYPE /dmo/carrier_id,
*             flightnum  TYPE /dmo/connection_id,
*             key        TYPE land1,
*             seat       TYPE /dmo/plane_seats_occupied,
*             flightdate TYPE /dmo/flight_date,
*           END OF ty_vuelos.
*
*    DATA: gt_flights_info TYPE TABLE OF ty_vuelos, "Se declaran dos tablas"
*          gt_my_flights   TYPE TABLE OF ty_vuelos.
*
*    gt_my_flights = VALUE #( FOR i = 1 UNTIL i > 30 "Donde 'i' es la variable creada. Por convención, se utiliza la i para esta declaración."
*
*(               iduser = | { 123456 + i } - USER |
*          aircode = 'LH'
*          flightnum = 00001 + i
*          key = 'US'
*          seat = 0 + i
*          flightdate = cl_abap_context_info=>get_system_date(  ) + 1 ) ).
*
*    out->write( data = gt_my_flights name = 'gt_my_flights' ).
*
*    "FOR con el while
*
*    gt_my_flights = VALUE #( FOR i = 1 WHILE i <= 20
*
*   (               iduser = | { 123456 + i } - USER |
*                   aircode = 'LH'
*                   flightnum = 00001 + i
*                   key = 'US'
*                   seat = 0 + i
*                   flightdate = cl_abap_context_info=>get_system_date(  ) + 1 ) ).
*
*    out->write( data = gt_my_flights name = 'gt_my_flights' ).
*
*    gt_flights_info = VALUE #(  FOR ls_my_flight2 IN gt_my_flights
*            (       iduser = ls_my_flight2-iduser
*                    aircode = ls_my_flight2-aircode
*                    flightnum = ls_my_flight2-flightnum
*                    key = ls_my_flight2-key
*                    seat = ls_my_flight2-seat
*                    flightdate = ls_my_flight2-flightdate ) ).
*
*    out->write( data = gt_my_flights name = 'gt_my_flights' ).
*
*    gt_flights_info = VALUE #( FOR ls_my_flight2 IN gt_my_flights
*    WHERE ( aircode = 'LH' AND flightnum < 0012 )
*
*            (       iduser = ls_my_flight2-iduser
*                    aircode = ls_my_flight2-aircode
*                    flightnum = ls_my_flight2-flightnum
*                    key = ls_my_flight2-key
*                    seat = ls_my_flight2-seat
*                    flightdate = ls_my_flight2-flightdate ) ).
*
*    out->write( |\n| ).
*    out->write( data = gt_my_flights name = 'gt_my_flights' ).
*
*    "FOR ANIDADO"
*
*    TYPES: BEGIN OF ty_vuelos2,
*             aircode     TYPE /dmo/carrier_id,
*             flightnum   TYPE /dmo/connection_id,
*             flightdate  TYPE /dmo/flight_date,
*             flightprice TYPE /dmo/flight_price,
*             currency    TYPE /dmo/currency_code,
*           END OF ty_vuelos2.
*
*
*    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "TABLA SORTED --> Es un tipo de tabla, la cual se encuentra ordenada según determinado criterio."
*    "Tienen un índice interno, y el acceso para leer los campos se hace a través de la clave, no del índice."
*
*    TYPES: BEGIN OF ty_flights3,
*             aircode     TYPE /dmo/carrier_id,
*             flightnum   TYPE /dmo/connection_id,
*             flightdate  TYPE /dmo/flight_date,
*             flightprice TYPE /dmo/flight_price,
*             currency    TYPE /dmo/currency_code,
*           END OF ty_flights3.
*
*    "creamos primera tabla lt_flights_type, que extrae datos de la base de datos de /dmo/flight
*    SELECT FROM /dmo/flight
*         FIELDS *
*         INTO TABLE @DATA(lt_flights_type).
*
*
*    "creamos segunda tabla lt_airline, que extrae datos de la base de datos de /dmo/booking_m
*    SELECT FROM /dmo/booking_m
*       FIELDS carrier_id, connection_id , flight_price, currency_code
*       INTO TABLE @DATA(lt_airline)
*       UP TO 20 ROWS.
*
*    "creamos tercera tabla que es de tipo SORTED!!!! a diferencia de con las que hemos trabajado anteriormente que siempre eran estandar.
*    "y le indicamos que herda los tipos de ty_flights y tiene una key no unica que hace referencia al campo/columna flightprice
*    DATA lt_final TYPE SORTED TABLE OF ty_flights3 WITH NON-UNIQUE KEY flightprice.
*
*
*    "continuamos con el proceso de creacion de la lt_final usando una expresion de value con for anidados
*    lt_final = VALUE #(
*
*    "primer bucle for : recorre la tabla lt_flgiths_type
*    "filtra solo los vuelos cuyo carrier_id sea 'AA'
*     FOR ls_flight_type IN lt_flights_type WHERE ( carrier_id = 'AA' )
*
*
*                          "segundo bucle for anidado:recorre la tabla lt_airline
*                          "solo se selecciona los registros que coinciden en carrier_id con el vuelo actual
*                         FOR ls_airline IN lt_airline WHERE (  carrier_id = ls_flight_type-carrier_id )
*
*                            "crea una estructura para cada combinacion valida de vuelo y aerolinia
*                         ( aircode     = ls_flight_type-carrier_id
*                           flightnum   = ls_flight_type-connection_id
*                           flightdate  = ls_flight_type-flight_date
*                           flightprice = ls_airline-flight_price
*                           currency    = ls_airline-currency_code )  ).
*
*
*
*    out->write( data = lt_flights_type name = `lt_flights_type` ).
*    out->write( |\n| ).
*    out->write( data = lt_airline name = `lt_airline` ).
*    out->write( |\n| ).
*    out->write( data = lt_final name = `tabla generada con las dos anteriores lt_final ` ).
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "SELECT"
*
*    SELECT FROM /dmo/flight  "FORMA CONVENCIONAL"
*    FIELDS *
*    WHERE carrier_id = 'LH'
*    INTO TABLE @DATA(lt_flights12).
*
*    "NOTA: NO usar el SELECT para filtrado de tablas internas. Solo para extraer datos de tablas de base de datos."
*
*    "SELECT A UNA TABLA INTERNA"
*
*    SELECT carrier_id, connection_id, flight_date
*    FROM @lt_flights12 AS gt
*    INTO TABLE @DATA(lt_flights_copy).
*    out->write( data = lt_flights12 name = 'lt_flights6' ).
*    out->write( |\n| ).
*    out->write( data = lt_flights_copy name = 'lt_flights_copy' ).
*
*    "ORDEN DE REGISTROS --> Sirve para indicar en qué orden queremos que se desplieguen las filas."
*
*    "Sentencia SORT --> Se usa para ordenar tablas. No aplica para tablas sorted, ya que vienen ordenadas por defecto."
*
*    out->write( data = lt_flights_copy name = 'lt_flights copy' ).
*    out->write( |\n| ).
*    SORT lt_flights_copy BY flight_date DESCENDING.
*    out->write( data = lt_flights_copy name = 'lt_flights copy ordenado' ).
*
*    "MODIFICACIÓN DE REGISTROS --> Permite cambiar los datos de una fila sin desplazarla ni alterar
*
*    "FUNCIÓN MODIFY - Versión antigua"
*
*    out->write( data = lt_flights12 name = 'ANTES / Lt_flights' ).
*
*    LOOP AT lt_flights12 INTO DATA(ls_flight8).
*      ls_flight8-flight_date = cl_abap_context_info=>get_system_date(  ).
*
*      MODIFY lt_flights12 FROM ls_flight8 INDEX 2.
*    ENDLOOP.
*
*    out->write( data = lt_flights12 name = 'DESPUÉS / lt_flights' ).
*
*    "El Modify funciona de modo que cambia uno o varios campos de una fila. NO SE RECOMIENDA usarlo con tablas externas, mejor crear una interna."
*
*    "FUNCIÓN MODIFY - Versión nueva" --> SE RECOMIENDA USAR ESTA.
*
*    out->write( data = lt_flights12 name = 'ANTES / lt_flights12' ).
*
*    LOOP AT lt_flights12 INTO DATA(ls_flight9).
*    IF ls_flight9-connection_id > '0401'.
*
*    MODIFY lt_flights12 FROM VALUE #(   connection_id = '4000'
*                                        carrier_id = 'XX'
*                                        plane_type_id = 'YY'   ) TRANSPORTING carrier_id plane_type_id connection_id.
*
*    "El TRANSPORTING lo que hace es cambiar los campos seleccionados"
*
*    ENDIF.
*    ENDLOOP.
*
*    out->write( data = lt_flights12 name = 'DESPUÉS / lt_flights12' ).
*
*    "ELIMINACIÓN DE REGISTROS"
*
*DATA: lt_flights_struc TYPE STANDARD TABLE OF /dmo/airport,
*      ls_flights_struc TYPE /dmo/airport.
*
*
*SELECT FROM /dmo/airport
*  FIELDS *
*  WHERE country EQ 'US'
*  INTO TABLE @lt_flights_struc.
*
*
*IF sy-subrc EQ 0.
*  out->write( data = lt_flights_struc name = `BEFORE lt_flights_struc` ).
*
*  " Recorremos la tabla para borrar ciertos aeropuertos
*  LOOP AT lt_flights_struc INTO ls_flights_struc.
*
*    " Si el ID del aeropuerto es JFK, BNA o BOS, lo eliminamos
*    IF ls_flights_struc-airport_id = 'JFK' or
*       ls_flights_struc-airport_id = 'BNA' OR
*       ls_flights_struc-airport_id = 'BOS'.
*
*      " Borramos el registro de la tabla interna
*      DELETE TABLE lt_flights_struc FROM ls_flights_struc.
*
*    ENDIF.
*
*  ENDLOOP.
*
*ENDIF.
*
*
*out->write( |\n| ).
*
*
*out->write( data = lt_flights_struc name = `AFTER lt_flights_struc` ).
*
*""""""""
*
*DELETE lt_flights_struc index 2.
*out->write( data = lt_flights_struc name = `AFTER lt_flights_struc` ).
*"""
*DELETE lt_flights_struc from 3 to 6.
*out->write( data = lt_flights_struc name = `AFTER lt_flights_struc` ).
*" campos nulos
*" DELETE lt_flights_struc where city is initial.
*"" campos duplicados
*"delete ADJACENT DUPLICATES FROM lt_flights_struc COMPARING airport_id.
*
*clear lt_flights_struc.
*Free lt_flights_struc.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "08/08/2025"

    "TABLAS DE RANGOS"

    DATA lr_seats TYPE RANGE OF /dmo/plane_seats_occupied.

    "Quiero vuelos que tengan entre 50 y 100 asientos"
    APPEND VALUE #( sign = 'I' option = 'BT' low = 50 high = 100 ) TO lr_seats.
    "También quiero vuelos que tengan exactamente 137 asientos"
    APPEND VALUE #( sign = 'I' option = 'EQ' low = 137 ) TO lr_seats.
   "No quiero vuelos que tengan más de 151 asientos"
    APPEND VALUE #( sign = 'E' option = 'GT' low = 130 ) TO lr_seats.

    DATA: lt_flights13 TYPE TABLE OF /dmo/flight.

    SELECT *
    FROM /dmo/flight
    WHERE seats_occupied IN @lr_seats
    INTO TABLE @lt_flights13.

    LOOP AT lt_flights13 INTO DATA(ls_flight9).

      out->write( |vuelos: { ls_flight9-carrier_id } Asientos ocupados: { ls_flight9-seats_occupied }| ).

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
