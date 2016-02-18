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


# Jak definiujemy stałe?

Jest to bardzo proste i intuicyjne. Do definiowania stałych służy polecenie `define(const Name, const Value)` 

**W PHP7 możemy definiować także tablicę jako stałą.** *(Uwaga! Taka tablica powinna być tego samego typu)* 

Działanie **define** zademonstrujemy na poniższym przykładzie:

```php
<?php
define("CONSTANT", "Hello world.");
echo CONSTANT; // outputs "Hello world."
echo Constant; // outputs "Constant" and issues a notice.

define("GREETING", "Hello you.", true);
echo GREETING; // outputs "Hello you."
echo Greeting; // outputs "Hello you."

// Works as of PHP 7
define('ANIMALS', array(
    'dog',
    'cat',
    'bird'
));
echo ANIMALS[1]; // outputs "cat"


```
Link do przykładu: [https://3v4l.org/HOINP](https://3v4l.org/HOINP)
