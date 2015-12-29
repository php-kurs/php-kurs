##  Boolean
Jest to typ zwracający tylko dwie wartości: **TRUE** oraz **FALSE**.

Warto zdawać sobie sprawę, w jakich wypadkach zwróci logiczną prawdę gdy użyje się operatora porównań **==**
```php
    // Wszystkie poniższe instrukcje zwrócą logiczną prawdę
    $isActive = true;
    $isActive = True;
    $isActive = TRUE;
    $isActive = 1;
    $isActive = -1;
    $isActive = '1';
    $isActive = 'false';
```
Jest tak, ponieważ interpreter nie jest _case-sensitive_, czyli nie zwraca uwagi na wielkość liter (w tym wypadku oczywiście chodzi o prawą stronę).
Poza tym wartość **FALSE** jest zwracana tylko wtedy, gdy wartość zmiennej będzie równa zeru. Ze względu na to, że _string_ posiada w sobie wartość różną od zera, to zostanie zinterpretowany jako logiczna prawda.

Wyjątkiem będzie taki zapis:
```php
    $isBadVar = '0true'; // zwróci false
```

Ponieważ interpreter odczyta tylko pierwszy znak tego ciągu i "zobaczy", że jest on równy zeru.
```php
    $isBadVar = '0true';
    echo ($isBadVar == 0) ? 'Równe zero' : 'Różne od zera.';
```
Powyższy kod wyświetli _Równe zero_.

Zmienne tego typu najczęściej wykorzystywane są w miejscach, gdzie trzeba sprawdzić prawdziwość jakiejś informacji. Kiedy mamy do czynienia z określonymi warunkami. Z tego powodu ich użycie będzie głębiej wyjaśnione w rozdziale o instrukcjach warunkowych.
