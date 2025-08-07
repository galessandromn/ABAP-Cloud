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
*    ls_persona-nombre = 'Daniel'.
*    ls_persona-edad = 23.
*
*    APPEND ls_persona TO lt_personas.
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
*                 )   TO lt_persona.
*
*    """"""""""
*
*    "Copiar contenido de una tabla a otra"
*
*    APPEND LINES OF lt_personas TO lt_personas2.
*
*    TYPES: BEGIN OF ty_persona,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_persona.
*
*    TYPES: ty_tabla_personas TYPE STANDARD TABLE OF ty_persona.
*
*    DATA: lt_personas TYPE ty_tabla_personas,
*          ls_persona  TYPE ty_persona.
*
*    DATA lt_personas2 LIKE lt_personas.
*
*    APPEND LINES OF lt_personas TO lt_personas2.
*
*    APPEND LINES OF lt_personas TO 2 TO lt_personas2.
*
*    APPEND LINES OF lt_personas FROM 4 TO 6 TO  lt_personas2.
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "AÑADIR REGISTROS CON VALUE"
*
*    "Permite añadir registros en una sola línea de código. Es la forma más moderna y legible

*    TYPES: BEGIN OF ty_persona,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_persona.
*
*    TYPES: ty_tabla_personas TYPE STANDARD TABLE OF ty_persona WITH EMPTY KEY.
*
*    DATA(lt_persona) = VALUE ty_tabla_personas(
*        ( nombre = 'Ana' edad = 25 )
*        ( nombre = 'Javier' edad = 45 )
*        ( nombre = 'Lucía' edad = 22 )
*        ).
*
*    "Ahora hay que declarar una estructura para hacer la lectura de datos."
*
*    DATA ls_persona TYPE ty_persona.
*
*    LOOP AT lt_persona INTO ls_persona.
*      out->write( |Nombre: { ls_persona-nombre }. Edad: { ls_persona-edad }| ).
*
*    ENDLOOP.
*
*    "Segunda manera de usar el VALUE"
*
*    DATA lt_aeropuerto TYPE STANDARD TABLE OF /dmo/airport.
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
*    out->write( lt_aeropuerto ).
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
*    "la forma moderna de usar del read table con indiceç
*DATA(ls_data) = lt_flights[ 2 ].
*out->write( data = ls_data name = `ls_data` ).
*
*ENDIF.
*
*
*DATA(ls_data2) = value #( lt_flights[ 20 ] default lt_flights[ 1 ] ) .
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
* READ TABLE lt_flights into data(ls_flight) WITH KEY city = 'Berlin'.
*out->write( data = lt_flights3 name = `lt_flights` ).
*
*out->write( data = ls_flight name = `ls_flight` ).
*
*
*ENDIF.
*
*"FORMA MODERNA DE USAR READ TABLE CON CLAVE"
*
*SELECT FROM /dmo/airport
*    FIELDS *
*    WHERE country = 'DE'
*    INTO TABLE @DATA(lt_flights4).
*
*DATA(ls_flight2) = lt_flights4[ airport_id = 'MUC' ].
*out->write( data = ls_flight2 name = `ls_flight2` ).
*
*"""
*DATA(ls_flight4) = lt_flights[ airport_id = 'MUC' ]-name.
*out->write( data = ls_flight2 name = `ls_flight2` ).
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
*    INTO TABLE @DATA(lt_flights).
*
*    "Luego, se utiliza la función MOVE-CORRESPONDING para copiar datos"
*
**       MOVE-CORRESPONDING lt_flights to lt_my_flights.
*
*    out->write( data = lt_flights name = 'lt_flights' ).
*    out->write( |\n| ).
*    out->write( data = lt_my_flights name = 'lt_my_flights' ).
*
*    "Forma moderna --> lt_my_flights = CORRESPONDING #( lt_flights ).
*
*
*    """"""""""""""
*"keeping trget lines
*
*  TYPES:BEGIN OF ty_flights,
*            carrier_id    TYPE /dmo/carrier_id,
*            connection_id TYPE /dmo/connection_id,
*            flight_date   TYPE /dmo/flight_date,
*            animales      TYPE string,
*            currency_code TYPE /dmo/currency_code,
*          END OF ty_flights.
*
*    DATA: lt_my_flights TYPE STANDARD TABLE OF ty_flights.
*    " ls_my_flight type ty_flights.
*
*    """"""""
*    SELECT FROM /dmo/flight
*    FIELDS *
*    WHERE currency_code = 'EUR'
*    INTO TABLE @DATA(lt_flights).
*
*
*    lt_my_flights = CORRESPONDING #( lt_flights ).
*
*
*    MOVE-CORRESPONDING lt_flights TO lt_my_flights KEEPING TARGET LINES.
*
*
*    out->write( data = lt_flights name = `tabla lt_flights` ).
*    out->write( |\n| ).
*    out->write( data = lt_my_flights name = `tabla  lt_my_flights` ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Chequeo de registros --> Sirve para verificar la existencia de un valor en una tabla."


*    SELECT FROM /dmo/flight
*      FIELDS *
*      WHERE carrier_id = 'LH'
*      INTO TABLE @DATA(lt_flights).
*    """""""""""""""""""""""""""""""""""""""""""  esto y lo de arriba son dos formas de hacer exactamente lo mismo
*    DATA lt_flights TYPE STANDARD TABLE OF /dmo/flight.
*    SELECT FROM /dmo/flight
*      FIELDS *
*      WHERE carrier_id = 'LH'
*      INTO TABLE @lt_flights.
*
*out->write( lt_flights ).
*
*    IF sy-subrc = 0.
*
*      READ TABLE lt_flights WITH KEY connection_id = '0403' TRANSPORTING NO FIELDS.
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
*"forma moderna
*
*DATA lt_flights TYPE STANDARD TABLE OF /dmo/flight.
*    SELECT FROM /dmo/flight
*      FIELDS *
*      WHERE carrier_id = 'LH'
*      INTO TABLE @lt_flights.
*
*out->write( lt_flights ).
*
*    IF sy-subrc = 0.
*
*
*    IF line_exists( lt_flights[ connection_id = '0404' ] ) .
*
*        out->write( 'el vuelo existe en la base de datos' ).
*      ELSE.
*        out->write( 'el vuelo NO existe en la base de datos' ).
*      ENDIF.
*
*    ENDIF.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "Índice de un registro"

    "line_index --> Devuelve el número de línea donde se encuentra el registro"

    SELECT FROM /dmo/flight
    FIELDS *
    WHERE carrier_id = 'LH'
    INTO TABLE @DATA(lt_flights).

    READ TABLE lt_flights WITH KEY connection_id = '0403' TRANSPORTING NO FIELDS.
    "El 'transporting no fields' es una sentencia que combinada con el registro, dentro del read table, busca un campo específico. Se necesita esta sentencia."

    DATA(lv_index) = sy-tabix. "Como el sy-index, pero en vez de servir para variables, sirve para tablas"
    "Almacena la posición del índice de las tablas"
    out->write( data = lt_flights name = 'lt-flights' ).
    out->write( |\n| ).
    out->write( lv_index ).

    "Forma moderna"

    DATA(lv_index2) = line_index( lt_flights[ connection_id = '0401' ] ).
    out->write( |\n| ).
    out->write( data = lt_flights name = 'lt-flights' ).
    out->write( |\n| ).
    out->write( lv_index2 ).




  ENDMETHOD.
ENDCLASS.
