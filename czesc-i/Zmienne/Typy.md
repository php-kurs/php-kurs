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

### mixed
mixed oznacza, że parametr może akceptować wiele typów (ale nie wszystkie).

Oznacza to, że jeżeli piszemy jakiś kod i nie wiemy jakiego typu ma być dokładnie zmienna, to nadajemy jej pseudo-typ mixed. Dopuści to przekazanie zmiennej do funkcji o różnorodnych typach: string, integer, boolean. 

Dla przykładu, funkcja `gettype()` przyjmuje wszystkie typy zmiennych istniejące w PHP, podczas gdy funkcja `str_replace()` akceptuje jedynie łańcuchy znaków i tablice. 

### number 
Pseudo-typ zmiennej `number` oznacza, że zmienna może być jedynie typu liczbowego: `integer` albo `float`.

###callback

Ten pseudo-typ był używany przed powstaniem callable type hint, które zostało wydane wraz z wersją PHP 5.4. 

### array|object
Ten pseudo-typ oznacza, że parametr może być wyłącznie typu tablicowego lub obiektowego. 

###void
Void jako typ zwracany oznacza, że wartość zwracana jest niepotrzebna. Void jako argument funkcji oznacza, ze funkcja nie akceptuje żadnych parametrów. 

###$...

Parametr `$...` w prototypie funkcji oznacza "i tak dalej".
Oznacza to, że nie musimy deklarować nazw argumentów, ani ich ilości. Funkcja dzięki temu może przyjmować nieskończoną ilość argumentów.

# Dobre praktyki
Każdy w tworzeniu swojego programu na pewno często odczuwa pokusę, aby stworzyć zmienną o nazwie `$a` lub podobną. Często też jednej zmiennej chce się użyć do różnych funkcjonalności. To są złe praktyki, których powinno się unikać. Dobry kod powinien mówić o naszych zamiarach. 

Jak jednak zadbać o to, żeby kod był czytelny? O sprawnym i poprawnym komentarzu już pisaliśmy, teraz dowiesz się o zmiennych nazywaniu.

## Używaj konwencji nazewnictwa zmiennych
Warto, abyś zdał sobie sprawę, że piszesz programy nie tylko dla siebie. Chociaż również z troski o swoje samopoczucie i cenny czas powinieneś zadpać o spójny sposób nazewnictwa zmiennych. 

Deweloperzy PHP mają ten proces nieco ułatwiony, ponieważ bardzo żywe community stworzyło coś takiego, jak standardy [PSR](http://www.php-fig.org/). 

Najważniejsze zasady nazewnictwa zmiennych to:

 - nazywaj zmienne wyłącznie w jednym języku
 - stosuj składnię `$camelCase`
 - staraj się opisywać przeznaczenie danej zmiennej (unikaj zmiennych typu `$dupa` oraz `$a`)
 - poświęć chwilkę, aby dobrać odpowiednią nazwę tej zmiennej oraz zastanów się, czy rzeczywiście jest ona potrzebna (może gdzieś w kodzie masz już taką i teraz niepotrzebnie ją zduplikujesz)

**Czemu takie zasady, a nie inne?**
Wyobraź sobie kod, w którym nazwy zmiennych raz są po Polsku, raz po Angielsku, a jeszcze gdzie indziej po Węgiersku.

Składnia camelCase (jednen z heheszkowych tłumaczy helionu przetłumaczył ten zwrot na *wielbłądzia składnia*) ujednolica zapis zmiennych i oddziela je od STAŁYCH, które są wyłącznie wielkimi literami.
Poza tym ze względu na to, iż PHP potrzebuje `$` przed nazwą zmiennej, dużo czytelniejsze jest zapisać jej nazwę zaczynając małą literą. 

Zasady pisania czytego kodu (patrz *Robert C. Martin*) wymagają, aby nazywać zmienne, funkcje i klasy zgodnie z ich przeznaczeniem. Kod zbombardowany zmiennymi `$a` jest bardzo nieczytelny, trudny w odbiorze i pochłania wiele czasu przy analizie zachowania. 

## Sprawdzaj nazwy zmiennych
Staraj się nazywać zmienne w taki sposób, aby nie było w programie dwóch bardzo podobnych do siebie. 

Wykorzystuj możliwości swojego IDE, które podpowie Ci jaką nazwę najlepiej w danym momencie użyć. Także możesz sprawdzić dzięki rozwijanej liście, czy dana zmienna już istnieje w programie. 

```php
<?php

$personOne;
$personTwo;
```
## Deklaruj i definiuj zmienną możliwie blisko miejsca jej pierwszego użycia.
Jest to bardzo ważne. Kiedy tworzymy nową zmienną, musimy zadbać o bliskość jej z kontekstem wykorzystania. Jeżeli są oddalone od siebie, tracimy czas na poszukiwanie wymaganych danych i narażamy siebie na tworzenie kodu z błędami. 

## Zwracaj szczególną uwagę na liczniki i akumulatory
Zmienne o nazwach `$i`, `$j`, `$sum`, `$k`, `$row` i `$col` są najczęściej wykorzystywane jako liczniki w pętlach. 

Należy zawsze pamiętać o ich zerowaniu, gdy jest ponownie używany. Oto przykład: 
```php
<?php
for($i = 0; $i <= 10; $i++) {
    echo $i . '-';
}

while($i <= 10) {
    echo $i;
}
```
O ile pętla `for` się wykona bezbłędnie, o tyle pętla `while` nigdy. To dlatego, że zmienna `$i` istnieje dalej w programie i posiada wartość `10`.
## Korzystaj z dobrych ostrzeżeń IDE 
PHPStorm wykrywa za Ciebie, czy dana zmienna jest gdziekolwiek w kodzie wykorzystywana. Jeżeli znajdzie taką, która istnieje, a jest nieużywana powiadomi Ciebie o tym. Dzięki temu będziesz mógł spokojnie ją usunąć lub wykorzystać. 
## Zasada Pojedynczej odpowiedzialności - jeden cel dla jednej zmiennej
Idealnym przykładem nadużywania tej zasady jest zmienna o nazwie `$temp`. Jest ona masowo nadużywana w każdym języku programowania. Często jej wykorzystanie sięga poza granice dobrych manier. Można powiedzieć, że jest ona jak grypa - każdy ją miał.

```php
<?php
// zakładamy, że delta jest dodatnia
$temp = sqrt($b * $b - 4 * $a * $c);

$root[0] = (- $b + $temp) / (2 * $a);
$root[1] = (- $b - $temp) / (2 * $a);

// ...

// zamiana pierwiastków miejscem
$temp = $root[0];
$root[0] = $root[1];
$root[1] = $temp;
```

Zmienna `$temp` jest wykorzystywana tutaj w dwóch różnych kontekstach, które nijak mają się do siebie. Takie korzystanie ze zmiennych jest bardzo złą praktyką i może powodować wiele błędów w naszych kodach. To jest prosty przykład - jednak w programach, które mają kilka tysięcy linii kodu takie zachowanie może być niezauważalne i może spowodować dość drogi błąd. 

Taki program jest dużo bezpieczniejszy, ale również wpłynęliśmy na czytelność kodu:
```php
<?php
// zakładamy, że delta jest dodatnia
$squaredDelta= sqrt($b * $b - 4 * $a * $c);

$root[0] = (- $b + $squaredDelta) / (2 * $a);
$root[1] = (- $b - $squaredDelta) / (2 * $a);

// ...

// zamiana pierwiastków miejscem
$oldRoot= $root[0];
$root[0] = $root[1];
$root[1] = $oldRoot;
```

## Reguluj czas życia zmiennej
Czas życia zmiennej zwany również czasem aktywności jest po prostu informacją o tym, jak szeroki jest zasięg naszej zmiennej. Jest to całkowita liczba instrukcji, w których nasza zmienna jest wykorzystywana. 

Jeżeli zmienna została utworzona w wierszu 1. a ostatni raz użyta w wierszu 40, to jej czas życia wynosi 40 wierszy. 

Im dłuższy czas takiej aktywności zmiennej tym większe prawdopodobieństwo wystąpienia błędu. Dlaczego? Przy długim czasie aktywności zmiennej możemy omyłkowo zmienić jej wartość.

 Naszym zadaniem, jako sprawnych programistów jest redukowanie tej odległości i dążenie do tego, aby była jak najkrótsza. 
![czas życia zmiennej](https://cdn.pbrd.co/images/beShkeN.png)

Inną zaletą pisania kodu, gdzie zmienne mają krótki czas życia jest zwiększenie jego czytelności. 

## Grupuj tematycznie instrukcje 
Zwiększa to czytelność kodu, ponieważ jako czytelnik dostrzegasz powiązania danych grup - dzięki czemu możesz na przykład pominąć część inicjalizacji (nie [inicjacji](https://pl.wikipedia.org/wiki/Inicjacja)) i skupić się na konkretniejszych działaniach. 

**Porównaj:**
```php
<?php
$age   = 18;
$name  = 'Marek';
$power = 100; 

$hero = new Person($age, $name, $power);

$hero->increasePower(150);
$hero->addOneYear();

$hero->hit();
$hero->defense();
```
oraz to:
```php
<?php
$age   = 18;
$name  = 'Marek';
$power = 100;
$hero = new Person($age, $name, $power);
$hero->increasePower(150);
$hero->addOneYear();
$hero->hit();
$hero->defense();
```
## Unikaj ukrytych znaczeń
Ukrytym znaczeniem nazywamy fakt, kiedy dana zmienna jest wykorzystywana w dwóch różnych znaczeniach. Na przykład:
```php
<?php

class Pagination 
{
    $pagesCount = 14;

    public function showNumberOfPages()
    {
        return $this->pagesCount;
    }
    public function ifDoesNotExist()
    {
        if($this->pagesCount === -1) {
           throw new \Exception('Strona nie istnieje');
        }
    }
}
``` 
Tutaj zmienna `$pagesCount`, jak nazwa wskazuje, przechowuje liczbę stron. Jednak stworzyliśmy funkcję, która rzuca wyjątkiem, gdy wartość tej zmiennej jest równa `-1`.

Jest to przykład brzydkiego kodu i ukrytego znaczenia zmiennej. Nie powinniśmy w ten sposób wykorzystywać tej zmiennej. Takie zachowanie nazywa się ***powiązaniem hybrydowym***.

Pamiętaj, że nawet gdy dla Ciebie jest to czytelne zachowanie, to już dla drugiego programisty może być zgoła inaczej. 

# Wybieranie dobrej nazwy zmiennej

|Zbyt długie|Zbyt krótkie|Dobra długość|
|---|---|---|
|`$numberOfPeopleAllowedToLoginInThisWebsite`|`$x`|`$numAllowedPeople`|
|`$countOfPlanetsInTheOurSolarSystem`|`$planets`|`$planetsCount`|

##Zmienne logiczne
Warto zastanowić się nad używaniem takich nazw zmiennych logicznych:

 - **done** - sygnalizuje zakończenie działania jakiejś pętli lub operacji.  
 - **error** - sygalizuje o tym, że nastąpił jakiś błąd w programie
 - **found** - mówi nam o tym, że szukana wartość została odnaleziona w jakimś zbiorze
 - **succes** - informuje o poprawnym zakończeniu jakiejś operacji. Jednak jeżeli to możliwe warto zamienić jej nazwę na coś, co dokładniej nam opisze swoją funkcję. Jeżeli informacją dla nas jest zakończenie przetwarzania tekstu, lepszą nazwą będzie `processingComplete`
 - **exists** - może być stosowana jako zmienna mówiąca nam o istnieniu bądź nie istnieniu danego obiektu. 

```php
<?php

public function save(Product $newProduct) 
{
	$done = false;

    // ...
    
    if($endSignal === 0) {
        $done = true;
    }    
}
```

Często jednak taki sposób nazewnictwa zmiennych nie rozwiązuje naszych wszystkich problemów. Z tego powodu programiści częściej stosują takie nazwy, jak: 
`isFound isExist isNull isDone isError isString`

Taki zapis zmiennych sprawia, że czytanie kodu staje się coraz bardziej podobne do czytania zwykłej prozy:
```php
<?php

if(isFound()) {
   echo 'Znaleziono!';
}
```

**UWAGA!**
O ile stosowanie zmiennych o nazwach pozytywnych: `isExist isNull isFound` jest dobre, o tyle stosowanie zmiennych o nazwach przeczących może być mylące: 
```php
if(! notFound()) {
    // ...
}
```

Dlatego tego sposobu nazewnictwa nie stosujemy.