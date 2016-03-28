## String - łańcuchy znaków
![enter image description here](http://img6.demotywatoryfb.pl//uploads/1614_600.jpg "S&#40;tring&#41; class")

Stringi, czyli dosłownie sznurek, bądź też szereg, seria, ciąg dają nam, podobnie jak kobietom, potężną władzę.

W PHP ciągi rozumiemy jako serię znaków, gdzie każdy z nich ma taką samą ilość bajtów przeznaczoną na ich przechowanie. Oznacza to, że komputer napisany tekst przez nas musi jakoś przechować. Najprostszym rozwiązaniem jest przygotowanie odpowiedniej ilości miejsca - a o tej ilości może się dowiedzieć, licząc ile znaków zamierzamy przechować w zmiennej.

PHP niestety nie wspiera jeszcze Unicode - do tej pory jest wsparcie jedynie do 256-bitowego zestawu znaków (character set).

Czas poznać typy stosowania stringów:

 - Z pojedynczym apostrofem
 - Z cudzysłowem
 - Składnia HEREDOC
 - Składnia NOWDOC

### Z pojedynczym apostrofem
```php
<?php
$personAge = 18;
echo 'Hej, masz {$personAge} lat.';
```
Powyższy kod wyświetli dosłownie:
```
Hej, masz {$personAge} lat.
```
Aby wyświetlić znak specjalny w tym kodzie bloku, powinieneś użyć znaku ucieczki w postaci `\`. Na przykład:
```php
<?php
$personAge = 18;
echo 'A on powiedział \'Perła jest najlepsza\'!';
```
Co wyświetli nam dosłownie:
`A on powiedział 'Perła jest najlepsza'!`

Więcej przykładów:
```php
<?php
echo 'Były sobie świnki trzy!';

echo 'Możesz walnąć również długi tekst,
który ma wiele linijek.
Kto bogatemu broni?';

// Wypluje: efik powiedział: "I'll be back"
echo 'efik powiedział: "I\'ll be back"';

// Wypluje: Czy skasować C:\*?
echo 'Czy skasować C:\\*?';

// Wypluje: Czy skasować C:\*?
echo 'Czy skasować C:\*.*?';

// Wypluje: To nie działa: \n nowa linia
echo 'To nie działa: \n a newline';

// Wypluje: To też nie zadziała: {$dupa}
echo 'To też nie zadziała: {$dupa}';
```
### Z cudzysłowem
Ten sposób zapisu jest bardziej znany programistom innych języków. W PHP działa on nieco inaczej. Przede wszystkim interpreter PHP stanie się czuły na znaki specjalne, takie jak:

| Znacznik  |  Znaczenie |
|---|---|
| \n  | Nowa linia  |
| \r | Powrót karetki |
|\t|Poziomy tabulator|
|\v|Pionowy tabulator|
|\\\\ |Uwidocznienie znaku: `\` |
|\\$|Uwidocznienie znaku dolara `$`|
|\\"| Uwidocznienie znaku cudzysłowa: `"`|

Istnieją jeszcze inne zapisy, umożliwiające zapisanie liczby szesnatkowej bądź ósemkowej, o których pisze [dokumentacja](http://php.net/manual/pl/language.types.string.php#language.types.string.syntax.double) jednak developerzy PHP dość rzadko wykorzystują te funkcjonalaności. Warto jednak je poznać.

**Czas na mały przykład:**
```php
<?php
$personAge = 18;
echo "Hej, masz {$personAge} lat.";
```
**Powyższy kod wyświetli dosłownie:**
```
Hej, masz 18 lat.
```
Czemu się tak dzieje?
Zadziała tutaj mechanizm **interpolacji zmiennych** , który odpowiada za podmianę zmiennej na jej *wartość*.

Kiedy interpreter widzi znaki `" "` działa w ten sposób:
```java
Tutaj musi być coś, co muszę zamienić. Muszę przeskanować cały zapis w poszukiwaniu zmiennych.
```
Z tego powodu warto zapamiętać sobie, że dużo bardziej optymalnym jest stosowanie zawsze apostrofów zamiast cudzysłowów. **Najlepiej, aby to był nasz dobry nawyk**. Dopiero w chwili, gdy będzie niezbędne dodanie zmiennej do ciągu znakowego, wtedy zamień apostrofy na cudzysłowy.

> **UWAGA!**

> Zauważ, że stosuję zapis zmiennej w klamerkach `{ }`.
> Jest to celowy zabieg, który jest dobrym nawykiem. Dzięki temu doskonale widać, że stosujemy w ciągu znakowym jakąś wartość **zmienną**. Oczywiście kod zadziałałby, gdybyśmy nie wstawili klamer, jednak trudniej byłoby odnaleźć zmienną w gąszczu kodu.
> Pamiętaj również o tym, że poprawnym zapisem jest:
	> `{$zmienna}`,
	a nie `{ $zmienna}`, `{ $zmienna }`, czy `{ $zmienna }`
	*Nie powinno być w tym zapisie spacji.*

### Składnia HEREDOC
```php
<?php

$longText = <<<EOF
Jakiś długi tekst, który może posiadać nawet
wiele linijek
oraz składnię <a href="#">HTML</a>
EOF;
```
Składnia heredoc jest złożona z kliku elementów:

 - znacznika `<<<`
 - znacznika zakończenia, który można nazwać dowolnie - u nas: `EOF`
 - treści tekstu
 - użycie znacznika zakończenia

Dobrą praktyką, która jest zawsze stosowana jest nazywanie znacznika zakończenia wyłącznie wielkimi literami. Najczęściej wybiera się takie akronimy, jak: EOL, EOF, END - czyli end of line, end of file, no i end. Można oczywiście nazwać je dowolnie.

W treści heredoc można stosować `enter` jako znacznik nowej linii.

Pamiętaj, że składnia heredoc działa analogicznie do napisu w cudzysłowie `" "`, dlatego interpreter PHP będzie najpierw szukał wartości zmiennych, które by mógł podmienić przy wyświetlaniu tego tekstu.

Z tego powodu wymyślono kolejny sposób wyświetlania tekstu, który jest nieco mniej znany.

**WAŻNE**
W ostatnim elemencie heredoc, czyli wypisaniu miejsca, w którym interpreter przestanie zamieniać wszystko na łańcuch znakowy, musimy zadbać o to, aby nie znajdował się żaden inny znak w tej linii:
```php
<?php

$longText = <<<EOF
Jakiś długi tekst, który może posiadać nawet
wiele linijek
oraz składnię <a href="#">HTML</a>
 EOF; // z przodu jest spacja - interpreter uzna to za błąd
```
Musimy również zadbać o to, aby na końcu tej instrukcji był średnik, gdyż on również mówi naszemu interpreterowi o zakończeniu danej instrukcji.

### Składnia NOWDOC
```php
<?php

$longText = <<<'EOF'
Jakiś długi tekst, który może posiadać nawet
wiele linijek
oraz składnię <a href="#">HTML</a>
EOF;
```
Składnia jest niemalże analogiczna do heredoc. Z tym, że tutaj przy nazwie znacznika końca musimy dopisać apostrofy, które mówią nam o tym, że w środku nie będzie żadnych zmiennych do podmiany.

Tutaj możesz zobaczyć różnicę:
[heredoc vs nowdoc](https://3v4l.org/fYIgP)
