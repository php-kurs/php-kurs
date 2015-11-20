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


## Array
## Object
