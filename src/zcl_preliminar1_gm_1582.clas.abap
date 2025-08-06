CLASS zcl_preliminar1_gm_1582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_preliminar1_gm_1582 IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

"Numérica completa modo 1".

DATA lv_edad(3) type n value 32.
out->write( lv_edad ).

"Numérica completa modo 2".

DATA lv_edad2(3) type n.
lv_edad2 = 28.
out->write( lv_edad2 ).

"Numérica incompleta modo 1".

DATA lv_edadi type i value 26.
out->write( lv_edadi ).

"Numérica incompleta modo 2".

DATA lv_edadi2 type i.
lv_edadi2 = 27.
out->write( lv_edadi2 ).

"Cadena completa modo 1"

DATA lv_alumno(40) type c value 'Giovanny Alessandro'.
out->write( lv_alumno ).

"Cadena completa modo 2"

DATA lv_alumno2(40) type c.
lv_alumno2 = 'Maria'.
out->write( lv_alumno2 ).

"Cadena incompleta modo 1"

DATA lv_alumnostr1 type string value 'Josefa Matia'.
out->write( lv_alumnostr1 ).

"Cadena incompleta modo 2"

DATA lv_alumnostr2 type string.
lv_alumnostr2 = 'Oscar de Leon'.
out->write( lv_alumnostr2 ).

DATA lv_nombre(70) type c value 'Pedro'.

out->write( lv_nombre ).

lv_nombre = 'Juan'.

out->write( lv_nombre ).

ENDMETHOD.
ENDCLASS.
