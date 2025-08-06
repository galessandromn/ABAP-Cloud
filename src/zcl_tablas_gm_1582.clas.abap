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

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

    "VARIACIONES DEL APPEND"

    "Declaración lineal del append"

*    APPEND VALUE #(
*
*                    nombre = 'Daniel'
*                    edad = 15
*
*                 )   TO lt_persona.

    """"""""""

    "Copiar contenido de una tabla a otra"

    "INSERT lines of lt_personas into table lt_personas2.

    "INSERT lines of lt_personas to 1 into table lt_personas2. "El 'into' permite insertar datos a partir de una fila específica"

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "AÑADIR REGISTROS CON VALUE"

    "Permite añadir registros en una sola línea de código. Es la forma más moderna y legible

    TYPES: BEGIN OF ty_persona,
             nombre TYPE string,
             edad   TYPE i,
           END OF ty_persona.

    TYPES: ty_tabla_personas TYPE STANDARD TABLE OF ty_persona WITH EMPTY KEY.

    DATA(lt_persona) = VALUE ty_tabla_personas(
        ( nombre = 'Ana' edad = 25 )
        ( nombre = 'Javier' edad = 45 )
        ( nombre = 'Lucía' edad = 22 )
        ).

    "Ahora hay que declarar una estructura para hacer la lectura de datos."

    DATA ls_persona TYPE ty_persona.

    LOOP AT lt_persona INTO ls_persona.
      out->write( |Nombre: { ls_persona-nombre }. Edad: { ls_persona-edad }| ).

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
