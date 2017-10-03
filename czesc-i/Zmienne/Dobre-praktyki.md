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
Wyobraź sobie kod, w którym nazwy zmiennych raz są po polsku, raz po angielsku, a jeszcze gdzie indziej po węgiersku.

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
O ile pętla `for` się wykona bezbłędnie, o tyle pętla `while` nigdy. To dlatego, że zmienna `$i` istnieje dalej w programie i posiada wartość `11`.
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
 - **success** - informuje o poprawnym zakończeniu jakiejś operacji. Jednak jeżeli to możliwe warto zamienić jej nazwę na coś, co dokładniej nam opisze swoją funkcję. Jeżeli informacją dla nas jest zakończenie przetwarzania tekstu, lepszą nazwą będzie `processingComplete`
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
