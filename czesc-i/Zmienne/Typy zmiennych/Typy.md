#  Typy zmiennych  
W PHP aktualnie (do wersji 5.6.*) nie mówimy bezpośrednio o typach zmiennych. Dzieje się to dlatego, że interpreter tego języka sam dba o rozpoznawanie i rzutowanie typów. Oznacza to, że każda zmienna może zawierać dane dowolnego rodzaju:
* liczbę
* ciąg znaków
* tablicę
* obiekt
* itp. 

Jednakże jako podstawowe język ten wspiera osiem tzw. prymitywnych typów, są nimi:
* **Skalary**: boolean, integer, float / double, string
* **Złożone**: array, object
* **Specjalne**: NULL, resource

Istnieją również pseudo-typy: `mixed`, `number`, `callback` (callable), `array|object`, `void`.



