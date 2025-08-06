CLASS zcl_ejerc_estructura_gm_1582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejerc_estructura_gm_1582 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*"EJERCICIO: Evaluación de Naves Espaciales."
*
*"Enunciado"
*
*"Estás desarrollando un sistema para gestionar y evaluar el estado de diferentes naves espaciales.
*"Para ello, deberás definir una estructura que agrupe los datos relevantes de cada nave y aplicar una serie de condiciones lógicas para emitir alertas o recomendaciones.
*
*"1. Estructura de datos"
*
*Define un tipo de estructura anidada que contenga tres bloques de información:
*   datos_generales:
*       nombre
*       modelo
*       pais_origen
*   especificaciones:
*       velocidad_max
*       autonomia
*   estado_mision:
*   mision
*   nivel_combustible
*
*"2. Declaración de datos"
*
*"Declara tres variables estructuradas basadas en ese tipo y asígnales valores usando VALUE #( ).
*"Asegúrate de que:
*
*Al menos una nave no sea de 'EEUU'
*Al menos una tenga una autonomía inferior a 1000
*Al menos una contenga la palabra "Marte" en el campo mision
*
*"3. Evaluación de condiciones"
*
*"Para cada nave, evalúa las siguientes reglas utilizando operadores lógicos (AND, OR, <>, >=, CP)
*"y muestra los mensajes correspondientes con out->write:
*
*Condición 1:
*    Si la nave no es de EEUU y su velocidad máxima es superior a 25000:
*        - Mostrar: "Nave extranjera de alta velocidad"
*
*Condición 2:
*    Si la autonomía es menor a 1000 o el nivel de combustible es inferior al 20%:
*        - Mostrar: "Revisión urgente necesaria"
*
*Condición 3:
*    Si el campo mision contiene la palabra "Marte" (mayúsculas o minúsculas) y el nivel de combustible es
*    mayor o igual al 75%:
*        - Mostrar: "Misión a Marte en condiciones óptimas"
*
*    "PASO 1"
*
*    TYPES: BEGIN OF ty_naves,
*             datos_generales  TYPE char70,
*             especificaciones TYPE char40,
*             estado_mision    TYPE char40,
*
*           END OF ty_naves.
*
*    DATA: BEGIN OF ls_naves_espaciales,
*
*            BEGIN OF datos_generales,
*              nombre      TYPE ty_naves,
*              modelo      TYPE ty_naves,
*              pais_origen TYPE ty_naves,
*            END OF datos_generales,
*
*            BEGIN OF especificaciones,
*              velocidad_max TYPE p LENGTH 5 DECIMALS 2,
*              autonomia     TYPE p LENGTH 6 DECIMALS 2,
*            END OF especificaciones,
*
*            BEGIN OF estado_mision,
*              mision             TYPE string,
*              estado_combustible TYPE i,
*            END OF estado_mision,
*
*          END OF ls_naves_espaciales.
*
*"PASO 2"
*
*ls_naves_espaciales = VALUE #(
*                                datos_generales = VALUE #( )

    """""""""""""""""""""""""""""""""""HASTA AQUÍ PUDE LLEGAR"""""""""""""""""""""""""""""""""""

    "SOLUCIÓN"

    TYPES: BEGIN OF ty_nave,

             "Subestructura: información general de la nave
             BEGIN OF datos_generales,
               nombre      TYPE string,
               modelo      TYPE string,
               pais_origen TYPE string,
             END OF datos_generales,

             "Subestructura: características técnicas
             BEGIN OF especificaciones,
               velocidad_max TYPE i,
               autonomia     TYPE i,
             END OF especificaciones,

             "Subestructura: estado de la misión actual
             BEGIN OF estado_mision,
               mision            TYPE string,
               nivel_combustible TYPE i,
             END OF estado_mision,

           END OF ty_nave.

    "Declaramos tres variables estructurales para las naves
    DATA: ls_nave1 TYPE ty_nave,
          ls_nave2 TYPE ty_nave,
          ls_nave3 TYPE ty_nave.

    "Inicializamos los valores de cada nave con VALUE #() usando subestructuras."

    ls_nave1 = VALUE #(
     datos_generales = VALUE #(  nombre = 'Odisea I' modelo = 'X-45' pais_origen = 'EEUU' )
     especificaciones = VALUE #( velocidad_max = 26000 autonomia = 1200 )
     estado_mision = VALUE #( mision = 'Exploración de Marte' nivel_combustible = 80 )
     ).

    ls_nave2 = VALUE #(
            datos_generales = VALUE #(  nombre = 'Estrella Roja' modelo = 'Z-20' pais_origen = 'Rusia' )
            especificaciones = VALUE #( velocidad_max = 27000 autonomia = 900 )
            estado_mision = VALUE #( mision = 'Órbita terrestre' nivel_combustible = 15 )
            ).

    ls_nave3 = VALUE #(
         datos_generales = VALUE #(  nombre = 'Andrómeda' modelo = 'Q-99' pais_origen = 'Japón' )
         especificaciones = VALUE #( velocidad_max = 24000 autonomia = 1500 )
         estado_mision = VALUE #( mision = 'Colonia en Marte' nivel_combustible = 76 )
         ).

"Se crean variables auxiliares para ir recolectando datos"

DATA: lv_nombre TYPE string,
      lv_mision TYPE string.

" ======================================
" Evaluación de condiciones para nave 1
" ======================================

lv_nombre = ls_nave1-datos_generales-nombre.
lv_mision = to_lower( ls_nave1-estado_mision-mision ).

IF ls_nave1-datos_generales-pais_origen <> 'EEUU' AND ls_nave1-especificaciones-velocidad_max > 25000.

out->write( |{ lv_nombre }: Nave extranjera de alta velocidad| ).
ENDIF.

IF ls_nave1-especificaciones-autonomia < 1000 OR
ls_nave1-estado_mision-nivel_combustible < 20.
out->write( |{ lv_nombre }: Revisión urgente necesaria| ).
ENDIF.

IF lv_mision CP '*marte*' AND
   ls_nave1-estado_mision-nivel_combustible >= 75.
  out->write( |{ lv_nombre }: Misión a Marte en condiciones óptimas| ).
ENDIF.

"========================
" Evaluación para nave 2
"========================

lv_nombre = ls_nave2-datos_generales-nombre.
lv_mision = to_lower( ls_nave2-estado_mision-mision ).

IF ls_nave2-datos_generales-pais_origen <> 'EEUU' AND
   ls_nave2-especificaciones-velocidad_max > 25000.
  out->write( |{ lv_nombre }: Nave extranjera de alta velocidad| ).
ENDIF.

IF ls_nave2-especificaciones-autonomia < 1000 OR
   ls_nave2-estado_mision-nivel_combustible < 20.
  out->write( |{ lv_nombre }: Revisión urgente necesaria| ).
ENDIF.

IF lv_mision CP '*marte*' AND
   ls_nave2-estado_mision-nivel_combustible >= 75.
  out->write( |{ lv_nombre }: Misión a Marte en condiciones óptimas| ).
ENDIF.

"========================
" Evaluación para nave 3
"========================

lv_nombre = ls_nave3-datos_generales-nombre.
lv_mision = to_lower( ls_nave3-estado_mision-mision ).

IF ls_nave3-datos_generales-pais_origen <> 'EEUU' AND
   ls_nave3-especificaciones-velocidad_max > 25000.
  out->write( |{ lv_nombre }: Nave extranjera de alta velocidad| ).
ENDIF.

IF ls_nave3-especificaciones-autonomia < 1000 OR
   ls_nave3-estado_mision-nivel_combustible < 20.
  out->write( |{ lv_nombre }: Revisión urgente necesaria| ).
ENDIF.

IF lv_mision CP '*marte*' AND
   ls_nave3-estado_mision-nivel_combustible >= 75.
  out->write( |{ lv_nombre }: Misión a Marte en condiciones óptimas| ).
ENDIF.
out->write( |\n | ).
out->write( ls_nave1 ).
out->write( |\n | ).
out->write( ls_nave2 ).
out->write( |\n | ).
out->write( ls_nave3 ).

  ENDMETHOD.
ENDCLASS.
