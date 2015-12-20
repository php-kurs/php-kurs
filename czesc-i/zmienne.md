# Zmienne 

W PHP zmienne można rozpoznać bardzo łatwo, ponieważ zaczynają się one od znaku dolara. Należy zawsze o tym pamiętać, ponieważ zapominanie **$** przed nazwą zmiennej jest częstym błędem początkujących deweloperów. 

**Przykłady definicji zmiennych**

```php
    $customerAge;
    $_POST['price'];
```

##  Co może być nazwą zmiennych w PHP? 
* Może to być dowolnej długości ciąg znaków alfanumerycznych: A-Z, a-z, 0-9
* Nazwa zmiennej może zawierać w sobie znak "_"

Jednak są rzeczy na które trzeba zwrócić uwagę. Nazwa zmiennej **Nie może** zaczynać się od cyfry. 

## Co nie powinno być nazwą zmiennych w PHP?
W większości języków programowania istnieje coś takiego jak słowa kluczowe _(ang. keywords)_. Są to takie wyrazy, których nie można używać w nazwie zmiennej. Powodem tego jest to, że te wyrazy, które można zobaczyć poniżej są zarezerwowane dla samego języka PHP. 
![Słowa kluczowe w PHP](https://cdn.pbrd.co/images/1iF6MHTm.png)

[Źródło: php.net](http://php.net/manual/en/reserved.keywords.php)

#  Wykorzystanie zmiennych
Już wiemy jak wyglądają zmienne i jakich zasad powinniśmy się trzymać nazywając je w programie. Ale czym tak naprawdę są zmienne? Do czego je się wykorzystuje?

Ten obrazek idealnie pokazuje zasadę działania zmiennych:
![Obrazowanie zmiennych](http://www.greenerpackage.com/sites/default/files/Recycling_predictions.jpg)

Zmienną nazwiemy takie miejsce w pamięci komputera, które jest w stanie przechować jakąś informację. W PHP jeżeli chcemy stworzyć miejsce dla przechowania wieku osoby zaglądającej na stronę, stworzymy zmienną $visitorAge. Dzięki temu, będziemy mogli dopisać do tej zmiennej interesujące nas informacje.

```php
        $visitorAge = 12;
        echo "Twój wiek to {$visitorAge} lat." . PHP_EOL;
        echo 'Twój wiek to ' . $visitorAge . ' lat.';
```

W powyższym skrypcie zastosowaliśmy operator konkatenacji. Jest to złączenie dwóch ciągów w jeden. Najczęściej ten operator (kropkę) stosuje się przy wyświetlaniu tekstu, tak, jak zrobiliśmy to wyżej. W rzeczywistości możliwości jego wykorzystania są zależne tylko od wyobraźni dewelopera. 

> **UWAGA** 
W powyższym przykładzie trzeba zwrócić szczególną uwagę na to, w jaki sposób powinno się dopisywać zmienne w wyjściowym łańcuchu tekstowym. 
Jeżeli zapisalibyśmy _**echo '$visitorAge lat.'**_, to dostalibyśmy w wyniku taki ciąg znaków: $visitorAge lat.

Kluczem są użyte apostrofy, które mają również znaczenie dla wydajności tworzonego przez nas oprogramowania. Kiedy zastosujemy znaki podwójnego cudzysłowu " ", to interpreter najpierw przeszuka dany ciąg w celu odnalezienia potencjalnych zmiennych, które mógłby zastąpić przed wyświetleniem na ekranie. 
Kiedy użyjemy znaków pojedynczego cudzysłowu (zapisywany jako apostrofy) ' ' to interpreter uzna wszystko to, co jest tam wpisane za tekst. Nie wykona wtedy sprawdzenia czy w środku znajduje się zmienna. 

Ten mechanizm nazywamy **interpolacją zmiennych** i polega on na zastępowaniu zmiennych ich wartościami.

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

## Integer
Jest to typ danych, który przechowuje liczby całkowite - czyli takie, które nie mają części dziesiętnej. 

```php
    $integerValue    = 1;
    $notIntegerValue = 1.2;
```

Typ integer (całkowitoliczbowy) wspiera notację szesnastkową, decymalną, ósemkową i binarną.

```php
    $value = 1234;       // decymalna wartość
    $value = -123;       // ujemna decymalna wartość
    $value = 0123;       // ósemkowa liczba (w dziesiętnym systemie: 83)
    $value = 0x1A;       // szesnastkowaliczba (w dziesiętnym systemie: 26)
    $value = 0b11111111; // liczba dwójkowa (w dziesiętnym systemie 255)
```

**Rozmiar  int'a**

Rozmiar zmiennej typu `integer` jest zależny od dwóch rzeczy. 
* Od architektury systemu operacyjnego
* Od ustawień interpretera

Dla systemów z procesorem 32-bitowym max dla `integer` wynosi: 2147483647

Dla systemów z procesorem 64-bitowym max dla `integer` wynosi: 9E18 (w notacji naukowej)

**Przykład zakresu `int` dla procesora 32-bitowego**
```php
    $large_number = 2147483647;
    var_dump($large_number);                   // int(2147483647)

    $large_number = 2147483648;
    var_dump($large_number);                   // float(2147483648)

    $million = 1000000;
    $large_number =  50000 * $million;
    var_dump($large_number);                   // float(50000000000)
```

**Przykład zakresu `int` dla procesora 64-bitowego**
```php
    $large_number = 9223372036854775807;
    var_dump($large_number);                   // int(9223372036854775807)

    $large_number = 9223372036854775809;
    var_dump($large_number);                   // float(9.2233720368548E+18)

    $million = 1000000;
    $large_number =  50000000000000 * $million;
    var_dump($large_number);                   // float(5.0E+19)
```
Przykład w jaki sposób działa dzielenie liczb ze zbioru liczb całkowitych
```php
    var_dump(25/7);         // float(3.5714285714286) 
    var_dump((int) (25/7)); // int(3)
    var_dump(round(25/7));  // float(4) 
```

## Float
Czasem zależy nam na tym, aby zapisać na przykład cenę przedmiotu. Wiadomo, że ceny składają się z dwóch części: *całkowitej* i *rzeczywistej*.

Do  zapisu danych, które są **zmiennoprzecinkowe** służy typ `float`. Jego rozmiar jest, podobnie jak `integer`, zależny od platformy. Zwykle jego precyzja wynosi *14* miejsc po przecinku.

Polecam Ci przeczytanie [tego artykułu](http   ://floating-point-gui.de/formats/fp/). Dla każdego programisty powinna to być ważna dawka wiedzy na temat reprezentacji liczb w komputerze. 
Warto, żebyś przeczytał całą wiedzę zawartą na tej stronie http://floating-point-gui.de/

**Przykład zmiennych typu `float`:**
```php
<?php
$simpleFloat       = 1.234; 
$scienceFloat      = 1.2e3; 
$smallScienceFloat = 7E-10;
```
##String - łańcuchy znaków
![enter image description here](http://img6.demotywatoryfb.pl//uploads/1614_600.jpg "S&#40;tring&#41; class")

Stringi, czyli dosłownie sznurek, bądź też szereg, seria, ciąg dają nam, podobnie jak kobietom, potężną władzę. 

W PHP ciągi rozumiemy jako serię znaków, gdzie każdy z nich ma taką samą ilość bajtów przeznaczoną na ich przechowanie. Oznacza to, że komputer napisany tekst przez nas musi jakoś przechować. Najprostszym rozwiązaniem jest przygotowanie odpowiedniej ilości miejsca - a o tej ilości może się dowiedzieć, licząc ile znaków zamierzamy przechować w zmiennej. 

PHP niestety nie wspiera jeszcze Unicode - do tej pory jest wsparcie jedynie do 256-bitowego zestawu znaków (character set).

Czas poznać typy stosowania stringów:

 - Z pojedynczym apostrofem
 - Z cudzysłowem
 - Składnia HEREDOC
 - Składnia NOWDOC

###Z pojedynczym apostrofem
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
EOD;
```
Składnia jest niemalże analogiczna do heredoc. Z tym, że tutaj przy nazwie znacznika końca musimy dopisać apostrofy, które mówią nam o tym, że w środku nie będzie żadnych zmiennych do podmiany. 

Tutaj możesz zobaczyć różnicę:
[heredoc vs nowdoc](https://3v4l.org/fYIgP)

## Array
Typ ten został dobrze opisany w rozdziale poświęconym wyłącznie tablicom, dlatego tutaj przedstawię tylko zarys tego, czym są tablice w PHP.

Tablica w PHP jest to mapa, zbiór elementów określonego typu. Inne języki przyzwyczaiły nas do tego, że w tablicy danego typu muszą być elementy wyłącznie tego typu.

W PHP jest tak, że elementem tablicy może być `string`, `integer` i `float`, a nawet obiekt jakiejś klasy.

Przykładowa tablica w PHP:
```php
<?php
$languages = [
    'pl',
    'en',
    'cz',
    'rus'
];
```
## Object
Jako, iż PHP jest jezykiem obiektowym posiada wbudowany typ obiektowy `Object	`. Aby stworzyć nowy obiekt należy użyć operatora `new` do utworzenia nowej instancji tegoż obiektu. Jest to bardzo proste, spójrz:
```php
<?php

class Person 
{
	private $age = 18;
    
    public function showAge()
    {
        echo "Mam {$this->age} lat.";
    }
}

$matureBoy = new Person;
$matureBoy->showAge();
```

Oczywiście programowanie oparte na obiektach to ogromny dział, dlatego w swoim kursie poświęciliśmy na ten temat osobną część. Dowiesz się w niej dużo więcej szczegółów i poznasz zasady, które rządzą w dobrym projektowaniu kodu. 

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

###Resources
Resoure to specjalna zmienna, która przechowuje referencję to zewnętrznego obiektu resource. Te obiektu są tworzone i używane przez specjalne funkcje, które możesz obejrzeć [tutaj](http://php.net/manual/en/resource.php).

# Dobre praktyki
## Wyłącz mechanizm deklaracji niejawnych
## Używaj konwencji nazewnictwa zmiennych
## Sprawdzaj nazwy zmiennych
## Deklaruj i definiuj zmienną możliwie blisko miejsca jej pierwszego użycia.
## Gdy tylko jest taka możliwość, używaj final albo const
## Zwracaj szczególną uwagę na liczniki i akumulatory
## Korzystaj z dobrych ostrzeżeń IDE 
## Zasada Pojedynczej odpowiedzialności - jeden cel dla jednej zmiennej
## Unikaj ukrytych znaczeń


# Wybieranie dobrej nazwy zmiennej
