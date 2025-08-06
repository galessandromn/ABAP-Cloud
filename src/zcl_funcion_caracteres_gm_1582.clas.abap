CLASS zcl_funcion_caracteres_gm_1582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_funcion_caracteres_gm_1582 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA: lv_string TYPE string VALUE 'daniel Fernando Pedro Ramon',
          lv_num    TYPE i.

    "TIPOS DE FUNCIONES DE CADENAS DE CARACTERES"

*    DATA: lv_string TYPE string VALUE 'daniel Fernando Pedro Ramon',
*      lv_name   TYPE string VALUE 'Fernando',
*      lv_comodin TYPE string,
*      lv_num    TYPE i.

*" Funciones de búsqueda sobre cadenas de texto
*
** strlen
* lv_num = strlen( lv_string ).                                      " Cuenta el número total de caracteres de la cadena (incluye espacios)
* out->write( lv_num ).
*
*" count
* lv_num = count( val = lv_string sub = lv_name ).                   " Cuenta cuántas veces aparece el valor de lv_name en lv_string
* out->write( lv_num ).
* lv_num = count( val = lv_string sub = 'Fernando' ).                " Hace lo mismo que arriba, pero sin usar la variable lv_name
* out->write( lv_num ).
*
* "count_any_of
* lv_num = count_any_of( val = lv_string sub = lv_name ).            " Cuenta cuántos caracteres de lv_name están presentes en lv_string (aunque no formen la palabra completa)
* out->write( lv_num ).
*
* "count_any_not_of
* lv_num = count_any_not_of( val = lv_string sub = 'Fernando' ).     " Cuenta cuántos caracteres de lv_string **no** están en la palabra 'Fernando'
* out->write( lv_num ).
*
* "find  "Empieza a contar por 0
* lv_num = find( val = lv_string sub = lv_name ).                    " Devuelve la posición donde empieza la palabra 'Fernando' dentro de lv_string (empieza desde 0)
* out->write( lv_num ).
*
* "find_any_of
* lv_num = find_any_of( val = lv_string sub = 'Fernando' ).          " Devuelve la posición del primer carácter que coincida con alguno de los caracteres de 'Fernando'
* out->write( lv_num ).
*
* "find_any_not_of
* lv_num = find_any_not_of( val = lv_string sub = 'Fernando' ).      " Devuelve la posición del primer carácter de lv_string que **no** está contenido en 'Fernando'
* out->write( lv_num ).
*
*
*
*  "funciones de procesamiento
**    DATA: lv_string  TYPE string VALUE 'daniet Fernando Pedro Ramon',
**          lv_comodin TYPE string.
*
*
*" MAYUS minus
*out->write( |TO_UPPER         = { to_upper( lv_string ) } | ).        " Convierte todo el texto a MAYÚSCULAS
*out->write( |TO_LOWER         = { to_lower( lv_string ) } | ).        " Convierte todo el texto a minúsculas
*"out->write( |TO_MIXED         = { to_mixed( lv_string ) } | ).        " Primera letra de cada palabra en mayúscula (no funciona  en abap cloud)
*"out->write( |FROM_MIXED       = { from_mixed( lv_string ) } | ).      " Invierte el efecto de to_mixed (si aplica) (no funciona  en abap cloud)
*
*" Order
*out->write( |REVERSE          = { reverse( lv_string ) } | ).         " Invierte el orden de todos los caracteres del texto
*out->write( |SHIFT_LEFT (places)  = { shift_left( val = lv_string places = 5 ) } | ).  " Desplaza 5 caracteres a la izquierda (rellena con espacios)
*out->write( |SHIFT_RIGHT (places) = { shift_right( val = lv_string places = 5 ) } | ). " Desplaza 5 caracteres a la derecha (rellena con espacios)
*out->write( |SHIFT_LEFT (circ)    = { shift_left( val = lv_string circular = 5 ) } | )." Desplaza 5 caracteres a la izquierda de forma circular
*out->write( |SHIFT_RIGHT (circ)   = { shift_right( val = lv_string circular = 5 ) } | )." Desplaza 5 caracteres a la derecha de forma circular
*
*" Substring
*out->write( |SUBSTRING           = { substring( val = lv_string off = 9 len = 6 ) } | ).     " Extrae 6 caracteres desde la posición 9
*out->write( |SUBSTRING_FROM      = { substring_from( val = lv_string sub = 'Pedro' ) } | ).   " Devuelve el texto a partir de 'Pedro' (inclusive)
*out->write( |SUBSTRING_AFTER     = { substring_after( val = lv_string sub = 'Pedro' ) } | ).  " Devuelve el texto después de 'Pedro' (excluyendo 'Pedro')
*out->write( |SUBSTRING_TO        = { substring_to( val = lv_string sub = 'Pedro' ) } | ).     " Devuelve el texto desde el inicio hasta 'Pedro' (inclusive)
*out->write( |SUBSTRING_BEFORE    = { substring_before( val = lv_string sub = 'Pedro' ) } | ). " Devuelve el texto desde el inicio hasta antes de 'Pedro'
*
*" Others
*out->write( |CONDENSE            = { condense( val = lv_string ) } | ).   " Elimina espacios duplicados e innecesarios ( como dobles espacios en blanco)
*out->write( |REPEAT              = { repeat( val = lv_string occ = 2 ) } | ). " Repite el contenido completo 2 veces
*out->write( |SEGMENT1            = { segment( val = lv_string sep = '!' index = 1 ) } | ).    " Extrae el primer segmento antes del primer '!'
*out->write( |SEGMENT2            = { segment( val = lv_string sep = '!' index = 2 ) } | ).    " Extrae el segundo segmento entre el primer y segundo '!'


    "funciones de contenido
*    DATA: lv_text     TYPE string,
*          lv_pattern  TYPE string,
*          lv_pattern2 TYPE string.

" contains con pcre .
*    lv_text = 'El telefono del empleado es 688-365-987 el correo electronico es daniel.elviraruiz@experis.es'.
*    lv_pattern = `\d{3}-\d{3}-\d{3}`.
*
*    lv_pattern2 = `\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b`.
*
*    IF contains( val = lv_text pcre = lv_pattern2 ).
*      out->write( 'El texto contiene una direccion de correo electronico ' ).
*      DATA(lv_count) = count( val = lv_text pcre = lv_pattern2 ).
*      out->write( lv_count ).
*      DATA(lv_pos) = find( val = lv_text pcre = lv_pattern2 occ = 1 ).
*      out->write( lv_pos ).
*    ENDIF.
*
*    IF contains(  val = lv_text pcre = lv_pattern ).
*      out->write('el texto contiene un numero de telefono').
*    ELSE.
*
*      out->write('el texto NO contiene un numero de telefono').
*    ENDIF.

" match con pcre

*    lv_text = 'El telefono del empleado es 688-365-987 el correo electronico es daniel.elviraruiz@experis.es'.
*    lv_pattern = `\d{3}-\d{3}-\d{3}`.
*
*    lv_pattern2 = `\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b`.
*
*    data(lv_numero) = match( val = lv_text pcre = lv_pattern occ = '1').
*      out->write( lv_numero ).
*
*
*   "EJERCICIO 1: Usar el comando 'find' para encontrar la posición de una palabra, y luego convertir el texto de la variable original a mayúscula
*   "NO SE ADMITE EL USO DE VARIABLES AUXILIARES"
*
*   lv_num = find( val = lv_string sub = 'Pedro' ).
*   out->write( lv_num ).
*   out->write( |TO_UPPER = { to_upper( lv_string ) }| ).
*
*    "SOLUCIÓN"
*
*    out->write( | { find( val = lv_string sub = 'Pedro' ) }| ).
*    out->write( | { to_upper( lv_string ) } | ).
*
*"FIN DEL EJERCICIO"
*
*    "***TO_LOWER --> Convierte todos los caracteres de una cadena a minúsculas.
*
*    lv_var_aux = to_lower( lv_string ).
*    out->write( lv_var_aux ).
*
*    "MANERA ALTERNATIVA = Ofrece el mismo resultado pero no altera permanentemente ninguna variable"
*
*    out->write( |{ to_lower( lv_string ) }| ).
*
*    "***TO_MIXED --> Alterna mayúsculas y minúsculas. (NO FUNCIONA)
*
*    lv_var_aux = to_mixed( lv_string ).
*    out->write( lv_var_aux ).
*
*    "Bloque 2: Orden"
*
*    out->write( |REVERSE          = { reverse( lv_string ) } | ).         " Invierte el orden de todos los caracteres del texto
*out->write( |SHIFT_LEFT (places)  = { shift_left( val = lv_string places = 5 ) } | ).  " Desplaza 5 caracteres a la izquierda (rellena con espacios)
*out->write( |SHIFT_RIGHT (places) = { shift_right( val = lv_string places = 5 ) } | ). " Desplaza 5 caracteres a la derecha (rellena con espacios)
*out->write( |SHIFT_LEFT (circ)    = { shift_left( val = lv_string circular = 5 ) } | )." Desplaza 5 caracteres a la izquierda de forma circular
*out->write( |SHIFT_RIGHT (circ)   = { shift_right( val = lv_string circular = 5 ) } | )." Desplaza 5 caracteres a la derecha de forma circular

    "Bloque 3: Sustracción."

    "***SUBSTRING*** --> Sustrae caracteres desde la posición que se le indica"

    "EJERCICIO 2: El programa debe:
*1) Eliminar los espacios sobrantes de la frase.
*2) Convertir la frase a minúsculas.
*3) Comprobar si la palabra "abap" aparece en ella.
*4) Si aparece, extraer solo esa palabra usando substring_from.
*5) Contar cuántos caracteres tiene la frase sin espacios iniciales/finales.
*6) Mostrar todos los resultados por consola.
*
*FRASE: ¡Bienvenido a   ABAP Cloud, Daniel!
*
*DATA lv_text type string value '¡Bienvenido a   ABAP Cloud, Daniel!'.
*
*"PASO 1"
*
*out->write( |{ condense( val = lv_text ) } | ).
*
*"PASO 2"
*
*out->write( |{ to_lower( condense( val = lv_text ) ) }| ).
*
*"PASO 3"
*
*out->write( |{ find( val = lv_text sub = 'abap' ) }| ).
*
*"PASO 4"
*
*"No aparece la palabra 'abap', puesto que en la cadena original está como 'ABAP'"
*
*"PASO 5"
*
*out->write( |{ strlen( condense( val = lv_text ) ) }| ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "Clase 28/07/2025"

    "Función de búsqueda PCRE"

    "EJERCICIO 1: 1-Extraer de la siguiente variable   DATA(lv_string) = 'danielFernando Pedro ramonSergio’.   losdistintos nombres que hay su interior y almacenar cada nombre en variables independientes.
****************************
*2-Crear un sistema que:
*  2.1-Identifique si el numero de caracteres de cada variable creada es  mayor a 7 y que en caso afirmativo, que aparezca por consola un mensaje diciendo “Hola Fernando”,
*  2.2-En caso de ser menor de 7, el programa tendrá que comprobar si el tamaño del nombre es igual a 6.
*  2.3-En caso negativo se deberá escribir por consola un mensaje diciendo “Hola Pedro”  y cambiar el   tipo de caracares del nombre de minúscula a mayúscula.
*  2.4-En caso afirmativo se deberá identificar si el nombre es Sergio o Daniel, en caso del nombre sea Sergio se   escribirá un mensaje que diga “Hola Sergio”  y en caso de ser Daniel otro mensaje que diga “Hola Daniel”.
*
*Solo se podrán usar el condicional IF y las funciones de caracteres que hemos visto en clase, nada de bucles u otros eleméntenos que no se hayan visto en clase .**  PROHIBIDO usar el SPLIT

*    DATA lv_string2 TYPE string VALUE 'daniel Fernando Pedro ramon Sergio'.
*
*    "Parte 1"
*
*    "La fórmula para resolver esto consiste los siguientes pasos"
*
*    "Declarar todas las variables de nombres"
*
*    DATA: lv_nombre1 TYPE string,
*          lv_nombre2 TYPE string,
*          lv_nombre3 TYPE string,
*          lv_nombre4 TYPE string,
*          lv_nombre5 TYPE string.
*
*    "Buscamos la posición del primer espacio"
*
*    DATA(lv_pos1) = find( val = lv_string2 sub = | | ).
*
*    "Extraer el primer nombre desde la posición 0 hasta antes del primer espacio"
*
*    lv_nombre1 = substring( val = lv_string2 off = 0 len = lv_pos1 ).
*
*    "Obtenemos el resto de la cadena después del primer espacio"
*
*    DATA(lv_rest1) = substring_after( val = lv_string2 sub = | | ).
*
*    "Buscamos el siguiente espacio en la nueva subcadena"
*
*    DATA(lv_pos2) = find( val = lv_rest1 sub = | | ).
*
*    "Extraemos el segundo nombre"
*    lv_nombre2 = substring( val = lv_rest1 off = 0 len = lv_pos2 ).
*
*    "Repetir hasta completar"
*
*    DATA(lv_rest2) = substring_after( val = lv_rest1 sub = | | ).
*    DATA(lv_pos3) = find( val = lv_rest2 sub = | | ).
*    lv_nombre3 = substring( val = lv_rest2 off = 0 len = lv_pos3 ).
*
*    DATA(lv_rest3) = substring_after( val = lv_rest2 sub = | | ).
*    DATA(lv_pos4) = find( val = lv_rest3 sub = | | ).
*    lv_nombre4 = substring( val = lv_rest3 off = 0 len = lv_pos4 ).
*
*    DATA(lv_rest4) = substring_after( val = lv_rest3 sub = | | ).
*    lv_nombre5 = lv_rest4.
*
*    "out->write( |{ lv_nombre1 } { lv_nombre2 } { lv_nombre3 } { lv_nombre4 } { lv_nombre5 }| ).
*
*    """""""""""""""""" SE PUEDE HACER LO MISMO CON EL COMANDO SPLIT """""""""""""""""""
*
*DATA: lv_nom1 type string,
*      lv_nom2 type string,
*      lv_nom3 type string,
*      lv_nom4 type string,
*      lv_nom5 type string.
*
*    SPLIT lv_string2 AT space INTO  lv_nom1 lv_nom2 lv_nom3 lv_nom4 lv_nom5.
*    "out->write( |{ lv_nom1 } { lv_nom2 } { lv_nom3 } { lv_nom4 } { lv_nom5 }| ).
*
*    "PASO 2.1"
*DATA(lv_nombre) = lv_nombre4.
*    IF
*    strlen( lv_nombre ) >= 7.
*      out->write( 'Hola Fernando' ).
*    ELSEIF
*        strlen( lv_nombre ) = 6 and lv_nombre = 'daniel'.
*        out->write( 'Hola Daniel' ).
*            ELSEIF
*                lv_nombre = 'Sergio'.
*                out->write( 'Hola Sergio' ).
*                ELSEIF
*                    lv_nombre = 'ramon'.
*                    out->write( to_upper( 'Hola Ramon' ) ).
*                    ELSE.
*                    out->write( to_upper( 'Hola Pedro' ) ).
*    ENDIF.
*    out->write( 'Aquí se terminó' ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"PCRE"

"TEXTO"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*"Concatenación"
*
*"Sirve para unir cadenas de texto que normalmente se encuentran separadas"
*
*DATA: lv_string_a type string VALUE 'hola, que tal esta ?',
*      lv_string_b type string VALUE 'Bien gracias 2',
*      lv_concatenacion type string.
*
*      lv_concatenacion = |Concatenacion 1: { lv_string_a } { lv_string_b }|.
*      out->write( lv_concatenacion ).
*
*      "Alternativa 2"
*
*      Concatenate lv_string_a lv_string_b into data(lv_concatenacion2).
*      out->write( |Concatenacion 2: { lv_concatenacion2 }| ).
*
*"Alternativa 2.1"
*
*      Concatenate lv_string_a lv_string_b into lv_concatenacion2.
*      out->write( |Concatenacion 2.1: { lv_concatenacion2 }| ).
*
*      "Alternativa 3"
*
*      Concatenate lv_string_a lv_string_b into lv_concatenacion SEPARATED BY space.
*      out->write( |Concatenacion 3: { lv_concatenacion }| ).
*
*      "Alternativa 4"
*
*     DATA lv_concatenacion4 type string.
*      lv_concatenacion4 = 'Hola' && | | && 'amigo' && | | && 'cómo' && | | && 'estás?'.
*      out->write( lv_concatenacion4 ).
*
*"Concatenación de líneas de tablas" --> Sirve cuando queremos guardar todos los registros de un campo en una variable.
*
*SELECT from /dmo/flight
*fields carrier_id
*into table @data(lt_itab).
*
*DATA(lv_string_itab) = concat_lines_of( table = lt_itab sep = | | ).
*out->write( lv_string_itab ).
*
*""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*"CLASE 30/07/2025"
*
*"SEGMENT --> Es como el SPLIT pero para una posición determinada"
*
*DATA(lv_string1) = 'El-perro-corre-por-el-prado'.
*DATA(lv_palabra) = segment( val = lv_string1 index = 3 sep = '-' ). "Esta línea sirve para extraer unos caractéres ubicados entre el carácter indicado y el anterior"
*
*out->write( lv_palabra ).
*
*"INSERT --> Añade carácteres en otros carácteres en una posición determinada. Sirve para forzar cadenas."
*
*DATA(lv_ins_string) = insert( val = '123cliente01' sub = 'INV' off = 0 ). "En el apartado de 'sub' puede ir una variable también".
*
*DATA lv_cadena_prueba type string value 'Frase'.
*DATA lv_insert type string.
*
*lv_insert = insert( val = lv_ins_string sub = lv_cadena_prueba off = 6 ).
*out->write( lv_insert ).
*
*"OVERLAY --> Es igual que el insert, pero sustituye cadenas de caracteres. Mientras el insert desplaza parte de la cadena original, el overlay reemplaza lo existente.
*
*    "overlay.
*
*DATA(lv_string1) = 'a.b.c.a.b.c.A'.
*DATA(lv_string2) = 'z.x.y.Z.x.y.z'.
*
*overlay lv_string with lv_string2 only 'ab'.
*out->write( lv_string ).
*
"find ALL OCCURRENCES OF --> Busca todo

data: lv_string_3 type string VALUE 'ERP ###### El perrrro corre por el campo'.

find ALL OCCURRENCES OF 'rr' in lv_string_3 match count data(lv_count).
out->write( lv_count ).
*
*"ESCAPE --> Transforma una cadena de caracteres a distintos tipos.
*
*"url"
*
*data(lv_url) = escape( val = 'El perro corre por el campo' format = cl_abap_format=>e_url_full ).
*out->write( lv_url ).
*
*"JSON"
*
*data(lv_json) = escape( val = 'El perro corre por el \ campo @300' format = cl_abap_format=>e_string_tpl ).
*out->write( lv_json ).

"OPERADORES DE COMPARACIÓN -->

  ENDMETHOD.
ENDCLASS.
