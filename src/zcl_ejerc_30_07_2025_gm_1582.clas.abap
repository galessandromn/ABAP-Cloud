CLASS zcl_ejerc_30_07_2025_gm_1582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejerc_30_07_2025_gm_1582 IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

"EJERCICIO 1: *Desarrollar un programa que cuente el número total de vocales presentes en una cadena de
*texto utilizando estructuras de control básicas y funciones de manipulación de cadenas.
*Teneis que crear un programa que recorra letra por letra una cadena de texto y cuente cuántas vocales contiene.
*Para ello deberás usar un bucle DO, la función to_lower para normalizar las letras, y la sentencia CHECK para
*filtrar solo aquellas que sean vocales.

 "Declaramos una cadena con un texto

 DATA lv_texto TYPE string VALUE 'El perro corre por el prado'.

 "Vía alterna y más corta"

 DATA: lv_contador type i,
       lv_patron1 type string.

       lv_patron1 = `\b[AaEeIiOoUu]\b`. "Esta es la forma de buscar las vocales, todas pegadas".

       lv_contador = count_any_of( val = lv_texto sub = lv_patron1 ).
      out->write( |El número de vocales es igual a { lv_contador }| ).

"Vía correcta para el ejercicio"

"Crear contador de vocales"

DATA(lv_contador1) = 0.
DATA(lv_contador2) = 0.

"Variable para extraer letra por letra"

DATA lv_letra type c length 1.

"Crear un bucle para repetir tantas veces como letras tenga el texto"

DO strlen( lv_texto ) TIMES.

"Así, se extrae una letra cada vez que se repite el bucle"

lv_letra = lv_texto+lv_contador2. "sy-index empieza en 1" "ESTO NO ES UNA SUMA, sino que se extrae el caracter en la primera posición"

"RECORDATORIO: var1 + var2 = suma
"var1+var2 = Dependiendo de la variable, lo que hace es contar los caracteres"

"Se convierten las letras a minúsculas para igualar criterios"

lv_letra = to_lower( lv_letra ).
lv_contador2 = lv_contador2 + 1.

"Usamos CHECK para continuar SOLO si se detecta una vocal"

CHECK lv_letra = 'a' OR
lv_letra = 'e' OR
lv_letra = 'i' OR
lv_letra = 'o' OR
lv_letra = 'u'.

"Si pasamos el CHECK, aumentamos el contador"

lv_contador1 = lv_contador1 + 1.

ENDDO.

"Impresión del resultado"

out->write( |El número de vocales es igual a { lv_contador1 }| ).


ENDMETHOD.
ENDCLASS.
