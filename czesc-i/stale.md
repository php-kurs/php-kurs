# Czym są stałe?

Stałe są to nazwy, które identyfikują jakieś proste wartości. 
Jak nazwa wskazuje, nie mogą się one zmieniać w trakcie wykonywania skryptu. 
PHP domyślnie rozróżnia w nazwach stałych wielkość liter.
Zgodnie z ogólnie przyjętymi zasadami, nazwy stałych piszemy dużymi literami.

**Poprawna nazwa stałej zaczyna się od litery lub podkreślenia, po których następuje dowolna ilość liter, cyfr i podkreślników.**

Przykład:

```php
<?php
 _STALA;
 WIELKI_DUZY_JEZ;
 
```

# Zasięg stałych

Każda stała będzie posiadała domyślnie zasięg globalny. Oznacza to, że jak zdefiniujemy stałą na początku skryptu, to będzie ona dostępna we wszystkich
skryptach, które wczytujemy.
Obecnie w PHP programiści wolą stosować stałe w klasach, gdyż jest to rozwiązanie bardziej
bezpieczne dla aplikacji.


