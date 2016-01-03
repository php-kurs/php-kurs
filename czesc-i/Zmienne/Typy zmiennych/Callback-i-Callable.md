### Callbacks i Callable
Najlepszą i najkrótszą definicją funkcji lambda będzie stwierdzenie, że jest to funkcja PHP, która nie posiada nazwy, oraz która może być przechowywana jako zmienna, może być przekazywana jako parametr do innych funkcji, a nawet może być zwracana przez inną funkcję.
```php
$result = function ($digit) {
     echo $digit * $digit;
};
$result(3); // wyświetli 9

function printArgument() {
    return function($value) {
        return '<<' . $value . '>>';
    };
}
$callback = printArgument();
echo $callback('test'); // wyświetli <<test>>
```

Ale co tu się dzieje!?
Zauważ w pierwszym przykładzie, że do zmiennej `$request` przypisujemy funkcję, która nie posiada nazwy - jest to **funkcja anonimowa**.

Następnie wywołujemy tę zmienną tak, jakbyśmy wywoływali funkcję i w jej argumencie wpisujemy liczbę.

Funkcja anonimowa wykona odpowiednie obliczenia i zwróci wynik.


----------
Spójrz na wynik działania tego kodu:
```php
<?php

$lambda = function() { echo "anonymous function"; };
var_dump($lambda);
```

```
object(Closure)#1 (0) {
}
```
Oznacza to, że funkcje anonimowe, zwane *lambda* są przez PHP interpretowane jako obiekt typu `Closure`.

Warto, abyś sobie poeksperymentował z funkcjami anonimowymi. Możesz to zrobić tutaj: https://3v4l.org/CvC69

Jeżeli chcesz więcej informacji na ten temat, zachęcamy Cię do odwiedzenia [dokumentacji](http://php.net/manual/en/language.types.callable.php).
