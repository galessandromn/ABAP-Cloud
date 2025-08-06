CLASS zcl_do_gm_1582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_do_gm_1582 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "Función DO"

    "El comando 'DO' sirve para hacer un bucle. Consiste en dar una instrucción para que haga algo. Se acompaña de otras palabras reservadas."

    "Palabra 'TIMES' --> Indica la cantidad de veces que se debe hacer el proceso."

    DATA(lv_num) = 3.

*DO 3 TIMES.
*
*out->write( lv_num ).
*
*ENDDO.
*
    "¿Qué pasa cuando modificamos algo después de la imprensión?"
*
*DO 3 TIMES.
*
*out->write( lv_num ).
*lv_num = lv_num + 1.
*
*ENDDO.
*
*"¿Qué pasa si creas un bucle infinito?"
*
*DATA lv_cont type i VALUE 2.
*lv_cont = lv_num + 1.
*
*DO lv_num TIMES.
*
*lv_num = lv_num + 1.
*out->write( lv_cont ).
*
*ENDDO.
*
*    "La actualización de ABAP Cloud impide que se bloquee la aplicación, aunque en el debugging se puede ver que sigue trabajando."
*
*    "Función EXIT --> Permite salir de un DO apenas es detectado."
*
*    lv_num = 0.
*    DATA lv_cont TYPE i VALUE 2.
*
*    DO .
*
*      out->write( lv_num ).
*      lv_num += 1.
*
*      IF lv_num > 8.
*
*        EXIT.
*
*      ENDIF.
*
*
*    ENDDO.

"Función CHECK -> Si se cumple una condición dada, lo que esté debajo del CHECK se ejecuta. Si no, vuelve a la primera línea."

DO 20 times.

DATA(lv_div) = sy-index mod 2.
out->write( lv_div ).
out->write( 'hola' ).
check lv_div = 0.
out->write( 'hola check' ).

ENDDO.

  ENDMETHOD.
ENDCLASS.
