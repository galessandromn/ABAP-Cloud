CLASS zcl_variables_gm_1582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_variables_gm_1582 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "Ejemplo de declaraciones de variables"

*    DATA: lv_string TYPE string VALUE 'hola',
*          lv_date   TYPE d,
*          lv_int    TYPE i VALUE 3333,
*          lv_time   TYPE t,
*          lv_time2  TYPE c LENGTH 6,
*          lv_int2   TYPE i,
*          lv_dec    TYPE p LENGTH 8 DECIMALS 2 VALUE '123.45'.
*
*    lv_int2 = 232344.
*
*    out->write( lv_string ).
*
*    "OTRA MANERA DE IMPRIMIR"
*
*    out->write( 'Abajo está la manera alternativa' ).
*
*    out->write( | Saludo = { lv_string } Matrícula = { lv_int }| ).
*
*    DATA: lv_nombre     TYPE string,
*          lv_edad       TYPE i,
*          lv_dni        TYPE string,
*          lv_nacimiento TYPE d.
*
*    lv_date = cl_abap_context_info=>get_system_date(  ).
*    lv_time = cl_abap_context_info=>get_system_time(  ).
*    lv_time2 = cl_abap_context_info=>get_user_time_zone(  ).
*
*    out->write( | Decimal = { lv_dec } Fecha = { lv_date } Hora = { lv_time } Hora local = { lv_time2 }| ).
*
*    "Las líneas anteriores se descomentarán al término de la clase del 23/07/2025"
*
*    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    "OPERACIONES CON VARIABLES"
*
*    DATA: lv_num1 TYPE i VALUE 1,
*          lv_num2 TYPE i VALUE 1,
*          lv_res  TYPE i.
*
*lv_res = lv_num1 + lv_num2.
*
*out->write( lv_res ).
*out->write( |La suma de { lv_num1 } + { lv_num2 } = { lv_res }| ).
*
*    "CASOS DE PRUEBA"
*
*    lv_res = lv_res + lv_num1.
*    out->write( lv_res ).
*
*    lv_res = lv_num1 + lv_num2.
*    out->write( lv_res ).
*
*    lv_num1 = lv_num1 + lv_num2.
*    out->write( lv_num1 ).
*
*    lv_res = lv_num1 + 2.
*    out->write( lv_res ).
*
*    lv_res = 2 + 3.
*    out->write( lv_res ).
*
*    "EJERCICIOS CON MULTIPLICACIONES Y DIVISIONES"
*
*    "EJERCICIO 1"
*
*DATA: lv_var1 type i value 7,
*      lv_var2 type i value 9,
*      lv_var3 type i value 12,
*      lv_resultado type p LENGTH 8 DECIMALS 1.
*
*      lv_resultado = lv_var1 * lv_resultado.
*      out->write( lv_resultado ).
*
*      lv_resultado = lv_var1 * lv_var2.
*      out->write( lv_resultado ).
*
*      lv_resultado = ( lv_var1 * lv_var2 ) / lv_var3.
*      out->write( lv_resultado ).
*
*      lv_resultado = lv_var2 + 1.
*      out->write( lv_resultado ).
*
*      lv_resultado = lv_resultado - lv_var1.
*      out->write( lv_resultado ).
*
*      lv_var3 = lv_var3 - lv_var2 + lv_var1.
*      out->write( lv_var3 ).
*
*      lv_resultado = lv_var3 + lv_var1.
*      out->write( lv_resultado ).
*
*    "Intento con tipo n"
*
*DATA: lv_var4(1) type n value 7,
*      lv_var5(1) type n value 9,
*      lv_var6(2) type n value 12,
*      lv_result(2) type n.
*
*      lv_result = lv_var4 * lv_result.
*      out->write( lv_result ).
*
*      lv_result = lv_var4 * lv_var5.
*      out->write( lv_result ).
*
*      lv_result = ( lv_var4 * lv_var5 ) / lv_var6.
*      out->write( lv_result ).
*
*      lv_result = lv_var5 + 1.
*      out->write( lv_result ).
*
*      lv_result = lv_result - lv_var4.
*      out->write( lv_result ).
*
*      lv_var6 = lv_var6 - lv_var5 + lv_var4.
*      out->write( lv_var6 ).
*
*      lv_result = lv_var6 + lv_var4.
*      out->write( lv_result ).
*
*    "EJERCICIO 2: Obtener el cálculo de días desde la fecha de nacimiento nuestra hasta hoy"
*    "PREMISA: Usar lv_date = cl_abap_context_info=>get_system_date( )."
*
*    DATA: lv_fecha      TYPE d,
*          lv_edad       TYPE d,
*          lv_antiguedad TYPE i,
*          lv_origen TYPE d.
*
*    lv_fecha = cl_abap_context_info=>get_system_date(   ).
*    lv_edad = '19990104'.
*    lv_antiguedad = lv_fecha - lv_edad.
*    out->write( lv_antiguedad ).
*
*    lv_origen = conv (1).
*    out->write( lv_origen ).
*
*    "EJERCICIO 3: Extraer los valores de determinadas posiciones de una variable tipo cadena"
*
*    DATA: lv_date  TYPE d,
*          lv_date2 TYPE d VALUE '20240623',
*          lv_mes   TYPE string.
*
*    lv_date = cl_abap_context_info=>get_system_date(  ).
*
*    lv_mes = lv_date2+4(2). "Mes"
*    out->write( lv_mes ).
*    lv_mes = lv_date2(4). "Año"
*    out->write( lv_mes ).
*    lv_mes = lv_date2+6. "Día"
*    out->write( lv_mes ).
*
*    DATA: lv_cadena   TYPE string VALUE 'pedro GIGI GILBERTO FraNGIscO giovanny GIl',
*          lv_contador TYPE i.
*
*    lv_contador = count( val = lv_cadena sub = 'GI' ).
*
*    out->write( lv_contador ). "Esto sirve para contar cuántas veces aparece un determinado texto dentro de una cadena"

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "CLASE 24/07/2025"

    "Declaración de variables en línea."

    DATA(lv_varlin) = 8 * 16.
    out->write( lv_varlin ).

    DATA(lv_varlin_div) = 8 / 16.
    out->write( lv_varlin_div ).

    DATA(lv_varlin_text) = 'ABAP I - 2025'.
    out->write( lv_varlin_text ).

    DATA(lv_varlin_dec) = '10.245'.
    out->write( lv_varlin_dec ).

  ENDMETHOD.
ENDCLASS.








