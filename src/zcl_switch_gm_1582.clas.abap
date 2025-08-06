CLASS zcl_switch_gm_1582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_switch_gm_1582 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "SWITCH --> Versión más rápida y optimizada del CASE"

*    DO 6 TIMES.
*
*      DATA(lv_value) = SWITCH #(  sy-index WHEN 1 THEN |iteracion 1| "luego del 'then' puede ir un literal, una variable o una constante"
*                                           WHEN 2 THEN |iteracion 2|
*                                           WHEN 3 THEN |iteracion 3| ).
*
*      out->write( lv_value ).
*
*    ENDDO.

    "WHILE --> A diferencia del DO, que itera una X cantidad de veces, el WHILE sirve para evaluar una condición:
    "1) Al principio
    "2) Cuando no se sabe cuántas veces iterar
    "3) Mientras se espera una condición externa

    DATA lv_num TYPE i VALUE 1.

    WHILE lv_num < 10.

      out->write( lv_num ).
      out->write( |iteracion = { sy-index }| ).
      lv_num += 1.

      IF lv_num > 3.

        EXIT.
      ENDIF.

    ENDWHILE.

out->write( ' ' ).

  ENDMETHOD.
ENDCLASS.
