CLASS zcl_case_endcase_gm_1582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_case_endcase_gm_1582 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "Para este ejemplo, se crean números aleatorios. Para hacerlo, hay que seguir esta fórmula"

*    DATA(lv_cliente) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )
*    min = 1
*    max = 7 )->get_next(  ).
*
*   "El siguiente paso es aplicar el 'CASE'. Sirve para hacer una comprobación a partir de N posibilidades"
*
*   CASE lv_cliente.
*   WHEN 1.
*   out->write( 'El resultado es 1' ).
*
*   WHEN 2.
*   out->write( 'El resultado es 2' ).
*
*   WHEN 3.
*   out->write( 'El resultado es 3' ).
*
*   WHEN 4.
*   out->write( 'El resultado es 4' ).
*
*   WHEN 5.
*   out->write( 'El resultado es 5' ).
*
*   WHEN OTHERS.
*   out->write( 'El número es muy alto' ).
*   ENDCASE.

"¿Qué ocurre cuando hay dos o más when iguales?"

DATA(lv_cliente2) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )
    min = 1
    max = 2 )->get_next(  ).

    CASE lv_cliente2.

    WHEN 1.
    out->write( 'Esto es un 1' ).

    WHEN 1.
    out->write( 'Esto es un 200' ).

    WHEN 1.
    out->write( 'Esto es un 40' ).

    WHEN 1.
    out->write( 'Esto es un 34' ).

    WHEN 1.
    out->write( 'Esto es un 29' ).

    WHEN 2.
    out->write( 'Esto es un 2' ).

    ENDCASE.

*
*   "También se pueden compilar comprobaciones"
*
*   CASE lv_cliente.
*   WHEN 1 OR 3 OR 5 OR 7.
*   out->write( 'El número es impar' ).
*
*   WHEN 2 OR 4 OR 6.
*   out->write( 'El número es par' ).
*
*   ENDCASE.
*
*out->write( '' ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    DATA(lv_aleatorio) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )
*        min = 1
*        max = 4 )->get_next(  ).
*
*    DATA: lv_nombre1 TYPE string VALUE 'Daniel',
*          lv_nombre2 TYPE string VALUE 'Pedro',
*          lv_nombre3 TYPE string VALUE 'Diego',
*          lv_nombre4 TYPE string VALUE 'Sara'.
*
*    DATA lv_nombre TYPE string.
*
*    "EJERCICIO EN CLASE 1: Hacer comprobaciones con IF, de tal modo que aparezcan los nombres indicados por número"
*
*    lv_nombre = lv_aleatorio.
*    out->write( lv_nombre ).
*
*
*    IF
*
*    lv_aleatorio = 1.
*      lv_nombre = lv_nombre1.
*      out->write( 'Hola Daniel' ).
*    ELSEIF
*    lv_aleatorio = 2.
*      lv_nombre = lv_nombre2.
*      out->write( 'Hola Pedro' ).
*    ELSEIF
*    lv_aleatorio = 3.
*      lv_nombre = lv_nombre3.
*      out->write( 'Hola Diego' ).
*    ELSEIF
*    lv_aleatorio = 4.
*      lv_nombre = lv_nombre4.
*      out->write( 'Hola Sara' ).
*    ELSE.
*      out->write( 'No encontrado' ).
*
*    ENDIF.
*
*    "Forma de hacerlo con el CASE"
*
*    CASE lv_nombre.
*
*      WHEN 'Daniel'.
*      out->write( lv_nombre ).
*
*      WHEN 'Pedro'.
*      out->write( lv_nombre ).
*
*      WHEN 'Diego'.
*      out->write( lv_nombre ).
*
*      WHEN 'Sara'.
*      out->write( lv_nombre ).
*
*      ENDCASE.
*
*      out->write( ' ' ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "EJERCICIO 2: Crear una calculadora cuyos números de entrada sean aleatorios, que realice las cuatro operaciones básicas. La operación a realizar también se debe elegir aleatoriamente

    "Paso a paso"

    "Primero, se debe declarar la generación aleatoria de valores. Éstos se guardarán en 'lv_operacion' para determinar cuál será la operación a realizar."

*    DATA(lv_operacion) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )
*      min = 1
*      max = 4 )->get_next(  ).
*
*    "También se deben generar números aleatorios, comprendidos entre 1 y 100, para que sean los números a operar."
*
*    DATA(lv_num1) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )
*      min = 1
*      max = 100 )->get_next(  ).
*
*     DATA(lv_num2) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )
*      min = 1
*      max = 100 )->get_next(  ).
*
*    "Realizar los cálculos con CASE"
*
*    CASE lv_operacion.
*
*    WHEN 1.
*    out->write( lv_num1 + lv_num2 ).
*
*    WHEN 2.
*    out->write( lv_num1 - lv_num2 ).
*
*    WHEN 3.
*    out->write( lv_num1 * lv_num2 ).
*
*    WHEN 4.
*    out->write( lv_num1 / lv_num2 ).
*
*    ENDCASE.

    "LA MEJOR MANERA ES LA SIGUIENTE"

    "Primero, la declaración de variables aleatorias."

*DATA(lv_aleatorio) = cl_abap_random_int=>create(  seed = cl_abap_random=>seed(  ) min = 1 max = 4 )->get_next(  ).
*    DATA(lv_num1) = cl_abap_random_int=>create(  seed = cl_abap_random=>seed(  ) min = 1 max = 100 )->get_next(  ).
*    DATA(lv_num2) = cl_abap_random_int=>create(  seed = cl_abap_random=>seed(  ) min = 1 max = 100 )->get_next(  ).
*
* "Luego, la declaración de variables nuevas. La de operación servirá para detectar cuál es la operación a realizar, y la de resultado debe ser decimal."
*
*    DATA: lv_operacion TYPE string,
*          lv_resultado TYPE p DECIMALS 2.
*
* "Se abre el 'CASE' para hacer las comprobaciones del tipo de operación a realizar."
*
*    CASE lv_aleatorio.
*
*      WHEN 1.
*        lv_operacion = '+'.
*
*      WHEN 2.
*        lv_operacion = '-'.
*
*      WHEN 3.
*        lv_operacion = '*'.
*      WHEN 4.
*        lv_operacion = '/'.
*
*      WHEN OTHERS.
*    ENDCASE.
*
* "Con el valor asignado a la variable de operación, ahora se pueden realizar los cálculos entre los números aleatorios."
*
*    CASE lv_operacion.
*
*      WHEN '+'.
*
*        lv_resultado = lv_num1 + lv_num2.
*        out->write( |El resultado de { lv_num1 } { lv_operacion } { lv_num2 } es { lv_resultado } | ). "De esta forma, se especifica cuál es la operación en la consola."
*
*      WHEN '-'.
*
*        lv_resultado = lv_num1 - lv_num2.
*        out->write( |El resultado de { lv_num1 } { lv_operacion } { lv_num2 } es { lv_resultado } | ).
*
*      WHEN '*'.
*        lv_resultado = lv_num1 * lv_num2.
*        out->write( |El resultado de { lv_num1 } { lv_operacion } { lv_num2 } es { lv_resultado } | ).
*
*      WHEN '/'.
*
*        lv_resultado = lv_num1 / lv_num2.
*        out->write( |El resultado de { lv_num1 } { lv_operacion } { lv_num2 } es { lv_resultado } | ).
*      WHEN OTHERS.
*    ENDCASE.

  ENDMETHOD.
ENDCLASS.
