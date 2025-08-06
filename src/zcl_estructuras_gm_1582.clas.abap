CLASS zcl_estructuras_gm_1582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_estructuras_gm_1582 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "FORMA de declarar EL TIPO de una estructura."

    TYPES: BEGIN OF ty_persona, "ty_persona es el nombre dado para nuestro nuevo tipo personalizado."

             nombre TYPE char40,
             edad   TYPE numc3,
             email  TYPE /dmo/email_address,

           END OF ty_persona.

    "PRIMERA FORMA de declarar la estructura en si misma."

*    DATA ls_persona TYPE ty_persona. "OJO: Mantener coherencia entre la declaración de la estructura y el nombre del tipo."
*
*    ls_persona-nombre = 'Pedro'.
*    ls_persona-edad = 20.
*    ls_persona-email = 'daniel.elviraruiz@experis.es'.
*
*    "Para imprimir la estructura, se debe hacer lo siguiente."
*
*    out->write( ls_persona ). "Si aquí solo se pone la estructura, se imprime en forma de tabla. Si se especifica un campo, solo el contenido del campo."
*
*    out->write( |\n| ).
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "SEGUNDA FORMA de declarar la estructura = Declaración en línea."
*
*    DATA(ls_persona2) = VALUE ty_persona( nombre = 'Daniel' edad = 20 email = 'daniel.elviraruiz@experis.es' ).
*
*    out->write( ls_persona2 ).
*    out->write( |\n| ).
*
*    "De esta forma, la impresión se asemeja más a una tabla."
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "TERCERA FORMA de declarar la estructura = Declaración simultánea de tipo y estructura."
*
*    DATA: BEGIN OF ls_empleado,
*            nombre TYPE string VALUE 'Laura',
*            id     TYPE i,
*            email  TYPE /dmo/email_address,
*          END OF ls_empleado.
*
*ls_empleado-id = 123. "OJO: Es posible completar campos vacíos luego de la declaración, y aparecerán en consola."
*
*    out->write( ls_empleado ).
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "TIPOS DE ESTRUCTURAS
*
*    "estructura simple
*    DATA: BEGIN OF ls_empleado2,
*            nombre TYPE string VALUE 'Laura',
*            id     TYPE i,
*            email  TYPE  /dmo/email_address,
*          END OF ls_empleado2.
*
*"estructura anidada
*
*    DATA:BEGIN OF ls_empl_info,
*
*           BEGIN OF info,
*             id       TYPE i VALUE 1234,
*             nombre   TYPE string VALUE 'Pedro',
*             apellido TYPE string VALUE  'Elvira',
*           END OF info,
*
*           BEGIN OF direccion,
*             ciudad TYPE string VALUE 'Madrid',
*             calle  TYPE string VALUE 'c. norfeo',
*             pais   TYPE string VALUE  'España',
*           END OF direccion,
*
*           BEGIN OF puesto,
*             departamento TYPE string VALUE 'IT',
*             sueldo       TYPE p DECIMALS 2 VALUE '2000.20',
*
*           END OF puesto,
*
*         END OF ls_empl_info.
*
*out->write( ls_empl_info ).    " para imprimir todo el contenido de la estructura
*out->write( ls_empl_info-direccion-calle ).  " para imprimir un unico campo de la estructura
*out->write( data = ls_empl_info name = 'informacion de empleado' ). "para imprimir toda la estructura con un mensaje inform
*
*"Estructura profunda"
*
*TYPES: BEGIN OF ty_flights,
*    flight_date TYPE /dmo/flight_date,
*    price TYPE /dmo/flight-price,
*    currency_code TYPE /dmo/flight-currency_code,
*    END OF ty_flights.
*
*    DATA: BEGIN OF ls_flight_info,
*          carrier type /dmo/flight-carrier_id VALUE 'AA',
*          connid type /dmo/flight-connection_id VALUE '0018',
*          lt_flights type table of ty_flights WITH EMPTY KEY, "hace referencia tanto al tipo creado en el types "ty_flights" como a la tabla de base de datos."
*
*          end of LS_FLIGHT_INFO.
*
*          SELECT *
*          from /dmo/flight
*          where carrier_id = 'AA'
*          into corresponding fields of table @ls_flight_info-lt_flights.
*
*          out->write( data = ls_flight_info name = 'ls_flight_info' ).
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "Añadir datos a las estructuras"
*
*    "1) Declarar los tipos para la estructura."
*
*    TYPES: BEGIN OF ty_flights,
*             flight_date   TYPE /dmo/flight_date,
*             price         TYPE /dmo/flight-price,
*             currency_code TYPE /dmo/flight-currency_code,
*           END OF ty_flights.
*
*    DATA: BEGIN OF ls_flight_info,
*            carrier    TYPE /dmo/flight-carrier_id VALUE 'AA', "Este value es opcional"
*            connid     TYPE /dmo/flight-connection_id VALUE '0018', "Este value es opcional"
*            ls_flights TYPE ty_flights, "Esta línea es diferente al ejemplo anterior."
*
*          END OF ls_flight_info.
*
*    ls_flight_info-carrier = 'XX'.
*    ls_flight_info-connid = '0022'.
*    ls_flight_info-ls_flights-flight_date = cl_abap_context_info=>get_system_date(  ).
*    ls_flight_info-ls_flights-currency_code = 'USD'.
*    ls_flight_info-ls_flights-price = '200'.
*
*    out->write( data = ls_flight_info name = 'ls_flight_info' ).
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "Otro ejemplo: con estructuras anidadas"
*
*    DATA:BEGIN OF ls_empl_info,
*
*           BEGIN OF info,
*             id       TYPE i VALUE 1234,
*             nombre   TYPE string VALUE 'Pedro',
*             apellido TYPE string VALUE  'Elvira',
*           END OF info,
*
*           BEGIN OF direccion,
*             ciudad TYPE string VALUE 'Madrid',
*             calle  TYPE string VALUE 'c. norfeo',
*             pais   TYPE string VALUE  'España',
*           END OF direccion,
*
*           BEGIN OF puesto,
*             departamento TYPE string VALUE 'IT',
*             sueldo       TYPE p DECIMALS 2 VALUE '2000.20',
*
*           END OF puesto,
*
*         END OF ls_empl_info.
*
*    ls_empl_info = VALUE #(
*                           info = VALUE #(  id = 1234 nombre = 'Juan' apellido = 'Martinez' )
*                           direccion = VALUE #( ciudad = 'Madrid' calle = 'Gran Vía' pais = 'España' )
*                           puesto = VALUE #( departamento = 'Finanzas' sueldo = '2000.00' )
*                           ).
*    out->write( data = ls_empl_info name = 'ls_empl_info' ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" introducir datos en estructuras profundas.

     TYPES: BEGIN OF ty_flights,
             flight_date   TYPE /dmo/flight-flight_date,
             price         TYPE /dmo/flight-price,
             currency_code TYPE /dmo/flight-currency_code,
           END OF ty_flights.


    DATA: BEGIN OF ls_flight_info,
            carrier    TYPE /dmo/flight-carrier_id VALUE 'AA',
            connid     TYPE /dmo/flight-connection_id VALUE '0018',
            ls_flights TYPE  ty_flights,

          END OF ls_flight_info.

    ls_flight_info = VALUE #(
                                carrier = 'SP'
                                connid =  '0035'
                                ls_flights = VALUE #( flight_date = '20250731'
                                                      currency_code = 'EUR'
                                                      price  = '200'           )  ).

out->write( 'Introducción de datos en estructuras profundas' ).
out->write( data = ls_flight_info name = 'ls_flight_info' ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Declaración de 'todo lo necesario' para generar una estructura de forma lineal"

DATA(ls_flight2) = value ty_flights( currency_code = 'USD' flight_date = '20250731'  ).

out->write( |\n| ).
out->write( 'Declaración de una estructura de forma lineal' ).
out->write( data = ls_flight2 name = 'ls_flight2' ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Clear: Se usan para eliminar los datos de una estructura en tiempo de ejecucion, ya sea para aplicarlo dentro de
"un componente de forma individual o para la estructura completea.

select SINGLE from /dmo/flight
FIELDS *
where carrier_id = 'LH'
into @data(ls_flight3).

out->write( |\n| ).
out->write(  data = ls_flight3  name = 'ls_flight3' ).

Clear ls_flight3-connection_id.
out->write(  data = ls_flight2  name = 'ls_flight3' ).

clear ls_flight3.
out->write(  data = ls_flight2  name = 'ls_flight3' ).

ENDMETHOD.
ENDCLASS.
