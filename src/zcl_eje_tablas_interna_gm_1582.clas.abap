CLASS zcl_eje_tablas_interna_gm_1582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_eje_tablas_interna_gm_1582 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "EJERCICIO 1"

**Una biblioteca quiere guardar información sobre los libros que tiene. Para ello, crea un programa que:
**1) Defina un tipo de estructura ty_libro con estos campos:
**Título (tipo string)
**Autor (tipo string)
**Número de páginas (tipo i)
**2) Declare una tabla interna lt_libros y una variable ls_libro de ese tipo.
**3) Añada tres libros usando INSERT ... INDEX para colocarlos en posiciones concretas.
**4) Recorra la tabla con un LOOP AT y muestre:
**"Libro corto: <título>" si tiene menos de 150 páginas
**"Libro largo: <título>" si tiene más de 500 páginas
**"Libro estándar: <título>" en otro caso
**5) inalmente, muestra toda la tabla con out->write.
*
*    "PASO 1 - Declaración del tipo"
*
*    TYPES: BEGIN OF ty_libro,
*             titulo  TYPE string,
*             autor   TYPE string,
*             paginas TYPE i,
*           END OF ty_libro. "Estas líneas sirven para declarar el tipo de las 'columnas' de nuestra tabla.'
*
*    TYPES: ty_biblioteca TYPE STANDARD TABLE OF ty_libro WITH EMPTY KEY. "Esto permite crear un tipo auxiliar que será importado para nuestra estructura."
*
*    "PASO 2 - Declaración de la tabla y estructura"
*
*    DATA: lt_libros TYPE ty_biblioteca,
*          ls_libro  TYPE ty_libro.
*
*    ls_libro-titulo = 'Cien años de soledad'.
*    ls_libro-autor = 'Gabriel García Márquez'.
*    ls_libro-paginas = 560. "Esta es la primera fila de datos"
*
*
*    "PASO 3 - Inserción de filas con sus valores"
*
*    INSERT ls_libro INTO lt_libros INDEX 1. "Repetir hasta completar."
*
*    ls_libro-titulo = 'República'.
*    ls_libro-autor = 'Platón'.
*    ls_libro-paginas = 230.
*
*    INSERT ls_libro INTO lt_libros INDEX 2.
*
*    ls_libro-titulo = 'Rerum Novarum'.
*    ls_libro-autor = 'Leon XIII'.
*    ls_libro-paginas = 30.
*
*    INSERT ls_libro INTO lt_libros INDEX 3.
*
*    "PASO 4 - Utilización del bucle LOOP"
*
*    LOOP AT lt_libros INTO ls_libro.
*
*      IF ls_libro-paginas > 500.
*        out->write( |Libro largo: { ls_libro-titulo }| ).
*
*      ELSEIF ls_libro-paginas < 150.
*        out->write( |Libro corto: { ls_libro-titulo }| ).
*
*      ELSEIF ls_libro-paginas > 150 AND
*      ls_libro-paginas < 500.
*        out->write( |Libro estándar: { ls_libro-titulo }| ).
*
*      ENDIF.
*
*    ENDLOOP.
*
*    "PASO 5 - Impresión"
*
**    out->write( | { ls_libro-titulo },  { ls_libro-autor }, { ls_libro-paginas }| ). "FORMA DE IMPRIMIR SOLO LA ESTRUCTURA MUESTRA UNA FILA"
*
*    out->write( |\n| ).
*    out->write( |\n| ).
*    out->write( data = lt_libros name = 'Catálogo de libros' ). "Usar el "DATA" y el "NAME" le coloca un nombre a la tabla."

    "EJERCICIO 2"

    "PARTE 1 – GESTIÓN DE PASAJEROS"

*Define un tipo de estructura ty_pasajero con los campos:
*no
*mbre (string)
*edad (i)
*email (/dmo/email_address)
*Declara una tabla interna lt_pasajeros y añade los siguientes pasajeros usando APPEND VALUE:
*Ana, 28 años, ana@viajes.com
*Pedro, 17 años, pedro@viajes.com
*Lucía, 34 años, lucia@viajes.com
*Marcos, 15 años, marcos@viajes.com
*Añade un nuevo pasajero (Carlos, 22 años, carlos@viajes.com) en la segunda posición con INSERT ... INDEX.
*Copia todos los pasajeros a una nueva tabla lt_pasajeros2, pero solo si tienen menos de 30 años.
*Usa READ TABLE ... INDEX para leer el pasajero en la posición 3. Si sy-subrc = 0, muestra su nombre en mayúsculas con TO_UPPER.

    "PARTE 2 – GESTIÓN DE AEROPUERTOS"

*Rellena manualmente una tabla lt_aeropuertos con 3 registros de la tabla /dmo/airport usando INSERT VALUE #( ... ):
*FRA, Frankfurt, DE
*MUC, Munich, DE
*BCN, Barcelona, ES
*Copia solo los aeropuertos alemanes (country = 'DE') a una nueva tabla lt_alemanes, usando un LOOP AT con condición.
*Accede al aeropuerto con airport_id = 'MUC' usando la forma moderna de READ TABLE y muestra solo el campo city.

    "PARTE 3 – FUNCIONES DE TEXTO"

*Declara una variable lv_texto con el siguiente contenido:
*'El pasajero Pedro con email pedro@viajes.com ha comprado el billete'.
*Extrae:
*El nombre del pasajero con substring_between usando "pasajero " y " con".
*El correo electrónico usando expresión regular (\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b) y la función match.
*Reemplaza el nombre del pasajero por 'XXXXX' con replace.

    "BONUS (opcional, para los más rápidos):"

*Concatenar los nombres de todos los pasajeros de la tabla lt_pasajeros2 en una sola cadena separados por coma, y mostrarla con out->write.

*    "PASO 1.1 - Declaración del tipo"
*
*    TYPES: BEGIN OF ty_pasajero,
*             nombre TYPE string,
*             edad   TYPE i,
*             email  TYPE /dmo/email_address,
*           END OF ty_pasajero.
*
*    TYPES: ty_viajero TYPE STANDARD TABLE OF ty_pasajero WITH EMPTY KEY.
*
*    "PASO 1.2 - Declaración de la tabla"
*
*    DATA: lt_pasajeros TYPE ty_viajero,
*          ls_pasajero  TYPE ty_pasajero.
*
*    "Primer pasajero"
*
*    ls_pasajero-nombre = 'Ana'.
*    ls_pasajero-edad = 28.
*    ls_pasajero-email = 'ana@viajes.com'.
*
*    "PASO 1.3 - Adición de filas usando APPEND"
*
*    APPEND ls_pasajero TO lt_pasajeros.
*
*    ls_pasajero-nombre = 'Pedro'.
*    ls_pasajero-edad = 17.
*    ls_pasajero-email = 'pedro@viajes.com'.
*
*    APPEND ls_pasajero TO lt_pasajeros.
*
*    ls_pasajero-nombre = 'Lucía'.
*    ls_pasajero-edad = 34.
*    ls_pasajero-email = 'lucia@viajes.com'.
*
*    APPEND ls_pasajero TO lt_pasajeros.
*
*    ls_pasajero-nombre = 'Marcos'.
*    ls_pasajero-edad = 15.
*    ls_pasajero-email = 'marcos@viajes.com'.
*
*    APPEND ls_pasajero TO lt_pasajeros.
*
*    "PASO 1.4 - Adición de datos usando INSERT"
*
*    ls_pasajero-nombre = 'Carlos'.
*    ls_pasajero-edad = 22.
*    ls_pasajero-email = 'carlos@viajes.com'.
*
*    INSERT ls_pasajero INTO lt_pasajeros INDEX 2.
*
*    out->write( |\n| ).
*    out->write( lt_pasajeros ).
*
*    "PASO 1.5 - Copiar datos a una segunda tabla"
*
*    DATA lt_pasajeros2 LIKE lt_pasajeros.
*
*    out->write( |\n| ).
*    out->write( data = lt_pasajeros2 name = 'Tabla antes del loop' ). "En este punto, la tabla 2 solo tiene el mismo formato que la 1, pero no contiene datos. Por eso se usa la tabla original en el LOOP"
*
*    LOOP AT lt_pasajeros INTO ls_pasajero. "Esto se hace para 'inflar' la estructura solo durante la ejecución de estas líneas"
*
*      IF ls_pasajero-edad < 30.
*        APPEND ls_pasajero TO lt_pasajeros2. "Aquí, se cargan los datos de la estructura en la tabla 2"
*      ENDIF.
*
*    ENDLOOP. "Cuando termina el LOOP, la estructura vuelve a la normalidad y se queda con el último dato recopilado"
*
*    out->write( |\n| ).
*    out->write( lt_pasajeros2 ).
*    out->write( |\n| ).
*
*    "PASO 1.6 - Lectura de la tabla usando READ TABLE"
*
*    IF sy-subrc = 0. "
*
*      DATA(ls_pasajero2) = lt_pasajeros2[ 3 ]-nombre. "Manera alternativa de seleccionar un campo específico de la tabla. Sin el guión, trae la fila entera"
*
*      out->write( to_upper( ls_pasajero2 ) ).
*
*    ENDIF.

    "PASO 2.1 - Creación manual de una tabla"

    DATA: lt_aeropuertos TYPE STANDARD TABLE OF /dmo/airport,
          lt_alemanes    TYPE STANDARD TABLE OF /dmo/airport,
          ls_aeropuerto  TYPE /dmo/airport.

    "PASO 2.2 - Insertar manualmente aeropuertos"
    APPEND VALUE #( airport_id = 'FRA' city = 'Frankfurt' country = 'DE' ) TO lt_aeropuertos.
    APPEND VALUE #( airport_id = 'MUC' city = 'Munich' country = 'DE' ) TO lt_aeropuertos.
    APPEND VALUE #( airport_id = 'BCN' city = 'Barcelona' country = 'ES' ) TO lt_aeropuertos.

    "PASO 2.3 - Copiar aeropuertos alemanes
    LOOP AT lt_aeropuertos INTO ls_aeropuerto WHERE country = 'DE'.
      APPEND ls_aeropuerto TO lt_alemanes.
    ENDLOOP.
    out->write( data = lt_alemanes name = 'Versión WHERE' ).
    out->write( |\n| ).



*    LOOP AT lt_aeropuertos INTO ls_aeropuerto.
*
*      IF
*      ls_aeropuerto-country = 'DE'.
*        APPEND ls_aeropuerto TO lt_alemanes.
*      ENDIF.
*    ENDLOOP.
*    out->write( data = lt_alemanes name = 'Versión IF').

    "MANERA ALTERNATIVA"

*    LOOP AT lt_aeropuertos INTO ls_aeropuerto.
*    IF ls_aeropuerto-country = 'DE'.
*    APPEND ls_aeropuerto TO lt_alemanes.
*    ENDIF.
*    ENDLOOP.

    "PASO 2.4 - Acceder al aeropuerto con ID = 'MUC' y mostrar la ciudad
*    READ TABLE lt_aeropuertos INTO ls_aeropuerto WITH KEY airport_id = 'MUC'.
*    IF sy-subrc = 0. "Puede ser 0 (afirmativo) o 4 (negativo). Simplemente se usa para saber si la tabla tiene datos"
*      out->write( |\n| ).
*      out->write( |RESULTADO DE LA BÚSQUEDA| ).
*      out->write( |Ciudad del aeropuerto: { ls_aeropuerto-city }| ).
*    ENDIF.
*
*
*
*    "PASO 3.1 - Declaración de una variable"
*
*    DATA(lv_texto) = 'El pasajero Pedro con email pedro@viajes.com ha comprado el billete'.
*
*    "PASO 3.2 - Extracción del nombre"
*
*    DATA(lv_texto_aux1) = substring_before( val = lv_texto sub = ' con' ).
*    DATA(lv_texto_aux2) = substring_after(  val = lv_texto_aux1 sub = 'pasajero' ).
*    out->write( lv_texto_aux2 ).
*
*    "DATA(lv_texto2) = substring( val = lv_texto off = 0 len = lv_pos1
*
*    "PASO 3.3 - Extracción del correo electrónico"

*El correo electrónico usando expresión regular (\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b) y la función match.


  ENDMETHOD.
ENDCLASS.
