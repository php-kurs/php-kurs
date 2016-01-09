### NULL
Specjalna wartość NULL reprezentuje zmienną bez wartości. NULL jest jedyną wartością typu null.

Zmienna zwraca `null` tylko wtedy, gdy:

 - zostało jej przypisane na stałe NULL
 - nie została przypisana jej żadna wartość
 - została na niej użyta funkcja `unset()`

Do zmiennej możemy przypisać NULL na dwa sposoby:
```php
<?php

$first = NULL;
$second = 12;

unset($second);
```