CLASS zcl_textos_gm_1582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_textos_gm_1582 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lv_texto TYPE string.
    lv_texto = ZCL_CLASE_DE_TEXTOS_GM_1582=>gc_label_usuario.
    out->write( lv_texto ).

    ENDMETHOD.
ENDCLASS.
