# Zasięgi zmiennych i czas życia obiektu

**Zasięg** to termin oznaczający ocenę statusu zmiennej jako gwiazdy: jak daleko sięga jej sława? Zasięg lub widoczność zmiennej to obszar programu, w którym jest ona znana i może być wykorzystywana w operacjach. Gdy ma ograniczony, niewielki zasięg, jest rozpoznawana tylko w nieznacznej części programu — przykładem może być zmienna sterująca jedną małą pętlą. Zmienna o dużym zasięgu jest znana w wielu miejscach — jak na przykład używana w całym programie tabela danych pracowników.

W różnych językach obowiązują odmienne reguły dotyczące zasięgu. W niektórych bardzo prostych językach wszystkie zmienne są globalne — nie ma wówczas żadnej kontroli nad zasięgiem, co może powodować wiele problemów. W języku C++ i podobnych zmienna może być widoczna w bloku (części kodu wydzielonej nawiasami klamrowymi), procedurze, klasie (i ewentualnie klasach pochodnych) lub całym programie. W PHP, a także w Javie i C# może być także widoczna w obrębie pakietu lub przestrzeni nazw (zbiorze klas).

W PHP (jak i innych językach programowania) mamy do czynienia z następującymi pojęciami: 

 * *rozpiętością*, 
 * *czasem aktywności obiektu*
 * *zakresem ważności nazwy zmiennej* zwanym też zasięgiem zmiennej.

## Rozpiętość kodu
Spójrz na ten kod:

```php
<?php
$a = 0;
$b = 0;
$c = 0;
$a = $b + $c;
```
Teraz zauważ, że zmienna `$a` tworzona jest w wierszu pierwszym, `$b` w drugim, `$c` w trzecim. Jest to definicja z deklaracją. W czwartym wierszu do zmiennej `$a` przypisujemy sumę `$b + $c`;

W tym przykładowym kodzie, między pierwszym a drugim użyciem zmiennej `$a` znajdują się 2 wiersze kodu. W przypadku zmiennej `$b` jest to jeden wiersz. W przypadku zmiennej `$c` zero.

Kod między odwołaniami do zmiennej to obszar potencjalnie niebezpieczny. W jego obrębie może zostać dodany nowy kod, który omyłkowo zmienia jej wartość. Także osoba czytająca kod może zapomnieć, jaka ta wartość była (i pomylić się). Lokalizowanie użycia zmiennej, czyli gromadzenie możliwie blisko siebie wszystkich odwołujących się do niej wyrażeń i instrukcji, jest jedną z dobrych praktyk programowania.

>Idea lokalizowania odwołań do zmiennej jest dość oczywista, ale jest to zarazem koncepcja, której stosowanie można w sformalizowany sposób mierzyć. Jednym ze sposobów dokonywania pomiaru zawartości odwołań do zmiennej jest obliczenie jej "rozpiętości" (ang. span).

Gdy odwołania do zmiennych znajdują się blisko siebie, osoba czytająca kod może koncentrować się na jego krótkich fragmentach. Gdy ta sama zmienna występuje w miejscach odległych od siebie, zmusza to do przeskakiwania od jednego fragmentu programu do drugiego. Tak więc główną zaletą umieszczania odwołań do zmiennej w niewielkich odstępach jest poprawa czytelności kodu.

## Czas aktywności obiektu

Pojęciem pokrewnym do rozpiętości jest "czas aktywności" *(ang. live time)*, czyli całkowita liczba instrukcji w części kodu, w której zmienna jest wykorzystywana. Okres aktywności zmiennej rozpoczyna pierwsza, a kończy ostatnia z zawierających ja instrukcji.

W przypadku czasu aktywności nie jest ważne, ile razy zmienna została użyta pomiędzy pierwszym a ostatnim wierszem, w którym występuje. 

Przykładowo, jeżeli miejscem jej pierwszego użycia jest wiersz, a miejscem ostatniego wystąpienia wiersz 25., czas aktywności to 25 wierszy. Jeżeli są to jedyne wiersze, w których zmienna się pojawia, średnia rozpiętość  wynosi 23. 
W przypadku gdy zmienna jest wykorzystywana we wszystkich 25 wierszach, średnia rozpiętość jest równa 0. Czas aktywności, wynoszący 25 wierszy pozostaje niezmieniony.

>Długi czas aktywności oznacza, że zmienna pozostaje aktywna na przestrzeni wielu wierszy, natomiast krótki - że jest ona aktywna tylko przez kilka instrukcji. Rozpiętość to miara odległości między poszczególnymi miejscami użycia zmiennej.

Podobnie jak w przypadku rozpiętości, celem projektanta i programisty jest dążenie do utrzymania na niskim poziomie czasu aktywności. Analogicznie, podstawową zaletą krótkiego czasu aktywności jest zmniejszenie obszaru potencjalnie niebezpiecznego — redukuje to prawdopodobieństwo omyłkowej zmiany wartości zmiennej między miejscami w których jest we właściwy sposób wykorzystywana.

Drugą zaletą krótkiego czasu aktywności jest to, że zapewnia on przejrzystość kodu. Jeżeli przypisanie wartości zmiennej następuje w wierszu 10, po czym zostaje ona użyta w wierszu 45., już sama odległość między tymi wierszami sugeruje, że w kodzie, który obejmują, wartość zmiennej ma pewne znaczenie. Jeżeli przypisanie następuje w wierszu 44, a użycie w 45., podobna sugestia nie występuje i programista może skoncentrować się na mniejszej części programu.

Krótki czas aktywności zmniejsza także prawdopodobieństwo wystąpienia błędów związanych z inicjalizacją. W trakcie modyfikowania programu prosty, liniowy kod jest często przekształcany w różnego rodzaju pętle. Wówczas łatwo zapomnieć o inicjalizacjach, które nastąpiły w zupełnie innym, duże wcześniejszym miejscu. Jeżeli kod inicjalizacji i kod pętli znajdują się obok siebie, ryzyko, że zmiany doprowadzą do błędów inicjalizacji, maleje.

Krótki czas aktywności sprawia, że kod jest czytelniejszy. Mniejsza liczba wierszy, o których trzeba pamiętać w trakcie jego przeglądania, decyduje o tym, że zrozumienie treści programu jest łatwiejsze. W podobny sposób im krótszy czas aktywności, tym mniejsza ilość kodu musi być widoczna na ekranie, aby informacje o operacjach na zmiennej były w pełni dostępne w trakcie edycji i debugowania.

Zmniejszenie czasu aktywności ułatwia również późniejsze dzielenie procedury na mniejsze części. Jeżeli odwołania do zmiennej są skupione w niewielkich odległościach od siebie, refaktoryzacja do mniejszych procedur jest prostszą operacją.

## Czas życia obiektu

To okres od momentu, gdy zostaje on zdefiniowany, (definicja przydziela mu miejsce w pamięci) - do momentu, gdy przestaje on istnieć, (a jego miejsce w pamięci zostaje zwolnione).

## Zakres ważności nazwy obiektu

To ta część programu, w której nazwa obiektu jest znana, czyli obiekt jest dostępny (jeśli zwracamy się do niego używając jego nazwy).

Jaka jest różnica pomiędzy tymi pojęciami?

Taka, ze w jakimś momencie obiekt może istnieć, ale nie być dostępny. To dlatego, że np. znajdujemy się chwilowo poza zasięgiem ważności jego nazwy.

Zależnie od tego, jak zdefiniujemy lub zadeklarujemy nazwę, zasięg jej ważności może być różnego rodzaju.


### Zasięg lokalny

Zakres ważności (zasięg zmiennej) jest lokalny, gdy świadomie ograniczamy go do kilku linijek programu. Pisząc program możemy w dowolnym momencie za pomocą dwóch klamer `{` i `}` utworzyć tak zwany blok (po klamrze kończącej blok nie trzeba stawiać średnika).
Zdefiniowane w takim bloku nazwy mają zakres ważności ograniczony tylko do tego bloku. Po prostu poza tym blokiem nazwy te nie są znane.

```php
<?php
// .......
 {
    $x = 8;
 }
// .......
```
Nazwa zmiennej `$x` jest znana od momentu, gdy ją zdefiniowaliśmy - do linijki, gdzie jest klamra kończąca jej lokalny blok.

### Zasięg funkcji

Wiemy już, że funkcję otwiera nawias klamrowy `{` a kończy nawias klamrowy `}`. Te dwa nawiasy wyznaczają blok funkcji - między nimi są instrukcje składające się na tę funkcję. Zasięg funkcji i zasięg lokalny są praktycznie identyczne. Wyżej omówiony zasięg, posiadający wyłącznie klamry, czasem nazywa się funkcjami `inline`. Rozdzieliłem je specjalnie ponieważ różni je jedynie forma zapisu. Funkcja poziada instrukcję `function` oraz nazwę metody i blok otoczony klamrami. Funkcja typu inline jest jedynie blokiem złożonym z klamr i ciała. 

Zmienne zadeklarowane wewnątrz funkcji posiadają zasięg od miejsca, w którym zastały zadeklarowane, do końca funkcji. Nazywa się to *zasięgiem funkcji*, a zmienne nazywane są *zmiennymi lokalnymi*.

**Spójrzmy na przykład:**
```php
<?php

function printContent() {
    $content = 'zawartość';
}

printContent();
echo $content;
```

Posiadamy funkcję `printContent()`, wewnątrz której zadeklarowaliśmy zmienną `$content`. Wynikiem działania tego programu będzie:
```
Notice: Undefined variable: content in index.php on line 8
```

Dzieje się tak z tego powodu, że zmienna `$content` posiada zasięg lokalny funkcji `printContent()`. Jest ona widoczna jedynie w bloku tej funkcji.
Gdy próbujemy wyświetlić ją na ekranie za pomocą `echo` - interpreter nie rozpoznaje tej nazwy. Dzieje się tak dlatego, że interpreter tworzy nową zmienną `$content`, **ale o zasięgu globalnym**. Jeśli w tym samym czasie zastosujemy do tej zmiennej `echo` nigdy nie będzie mieć wartości.

Mamy tutaj również do czynienia z innym elementem, który znacząco wpływa na czytelność kodu. Jak widzisz, interpreter pozwala mieć takie same nazwy zmiennych w różnych zasięgach.
W naszym przypadku posiadamy zmienną `$content` w zasięgach bloku funkcji oraz zmienną `$content` o zasięgu globalnym dla pliku. Są to dwie różne od siebie zmienne - niezależne.

> Aby zachować czytelność kodu, należy się starać nazywać w różny sposób zmienne w różnych zasięgach. Dzięki temu szybciej odnajdziemy problematyczny dla nas kawałek kodu.

### Zasięg klasy

W przypadku tego zasięgu mamy do czynienia z pojęciem eknapsulacji danych. Jednakże temu zagadnieniu się przyjrzymy nieco później - w trakcie omawiania obiektowych podstaw PHP.
W skrócie mogę napisać, że zmienne w zasięgu klasy do pewnego stopnia przypominają zachowanie zmiennych w zasięgu bloku funkcji. Jednak istnieją przypadki, że jedna zmienna może być widoczna w dwóch lub większej ilości klas.

### Zasięg określony przez przestrzeń nazw

To zagadnienie również zostanie szerzej omówione w trakcie omawiania obiektowych podstaw PHP. Przestrzeń nazw *(ang. namespace)* jest to taki element kodu, który definiuje zasięg ważności wszystkich użytych nazw w danej części programu. Mogą to być nazwy klas, nazwy metod czy nazwy zmiennych i stałych.
Powstanie takiej konstrukcji ma bardzo duże znaczenie - dzięki temu nasze programy stały się bardziej niezależne. Warto też wspomnieć, że zasięg określony przez przestrzeń nazw może posiadać wiele klas.

Wszystko wyjaśni się nieco później - na chwilę obecną wybacz mi enigmatyczność.

### Zasięg globalny

Gdy mówimy o zasięgu globalnym, mamy na myśli zmienne zadeklarowane na zewnątrz funkcji mają zasięg od miejsca, w którym zostały wywołane, do końca pliku, ale nie **wewnątrz funkcji**.
Nazywa się to *zasięgiem globalnym*, a zmienne noszą nazwę *zmiennych globalnych*.

W poniższym przykładzie została przedstawiona sytuacja odwrotna. Zmienna jest zadeklarowana na zewnątrz funkcji, po czym następuje próba zastosowania jej wewnątrz niej.

```php
<?php

function jola() {
    echo "Wewnątrz funkcji zmienna = {$zmienna}" . PHP_EOL;
    $zmienna = 'zawartość druga';
    echo "Wewnątrz funkcji zmienna = {$zmienna}" . PHP_EOL;
}

$zmienna = 'zawartość pierwsza';
jola();
echo "Na zewnątrz funkcji zmienna = {$zmienna}" . PHP_EOL;
```

>Wewnątrz funkcji zmienna =
>
>Wewnątrz funkcji, zmienna = zawartość druga
>
>Na zewnątrz funkcji zmienna = zawartość pierwsza

Jak widzisz, najpierw do zmiennej `$zmienna` o zasięgu globalnym przypisujemy **zawartość pierwsza**. Jest to pierwsze, o czym wspominam, ponieważ funkcja jest wykonywana dopiero w miejscu jej wywołania.
Wykonujemy metodę `jola()`.
Wewnątrz metody staramy się odwołać do zmiennej `$zmienna` - ale w tej chwili jesteśmy w zasięgu lokalnym - bloku funkcji. Nie mamy dostępu do wcześniej zadeklarowanej zmiennej. Stąd brak wyniku przy wykonaniu `echo` w tej linii.
Kolejnym krokiem jest *zadeklarowanie* zmiennej `$zmienna` nadając jej wartość **zawartość druga**.
Na koniec tej metody, wyświetlamy zawartość utworzonej zmiennej i na ekranie pojawia nam się napis **zawartość druga**.

Po wykonaniu metody wyświetlamy na ekranie zawartość zmiennej `$zmienna`. O dziwo dostajemy wynik **zawartość pierwsza**.
Dzieje się tak dlatego, że wyświetlamy zawartość zmiennej o zasięgu globalnym. Taka zmienna jest widoczna w całym pliku od momentu jej zadeklarowania do końca życia obiektu. Nie jest jedynie widoczna w zasięgu bloku funkcji.

**UWAGA**

Stosowanie zmiennych globalnych niemalże we wszystkich językach i przypadkach jest bardzo złą praktyką. Jeśli piszemy kod proceduralny, nie jest to tak naganne, jednakże parafrazując, chociażby Bertranda Meyera (jednego z ojców dzisiejszych standardów programowania obiektowego): "Dobry obiektowy język programowania nie powinien nawet udostępniać możliwości tworzenia zmiennych globalnych".

PHP na początku był językiem skryptowym, który przez wiele lat ewoluował i dopiero od końcówek wersji czwartej zaczęły pojawiać się w nim elementy obiektowości. Dzięki takiemu uporowi autora, do języka została przylepiona niesławna etykieta niezgodnego ze standardami programowania, czy języka nienadającego się do tworzenia ogromnych komercyjnych aplikacji.
Dziś można powiedzieć, że PHP idzie w kierunku pełnej obiektowości, a narzędzia skupione wokół obiektów są tak powszechnie obecne w tym języku, że tworzenie profesjonalnych aplikacji w tym języku jest bardzo proste.

Jeśli nie jesteś jeszcze przekonany, zachęcam do przeczytania informacji z tych linków:

* http://zapachy-kodu.pl/cleancode/dane-globalne-enkapsulacja-i-czarne-pudelka/2016/01/
* http://stackoverflow.com/questions/5166087/php-global-in-functions?lq=1
* http://c2.com/cgi/wiki?GlobalVariablesAreBad


### Zasięg superglobalny

Język PHP różni się od innych również tym, że posiada zmienne **superglobalne**. Czasem nazywa się je ponadglobalnymi (chociaż uważam to za koślawe i dość komiczne tłumaczenie).

Wykorzystujemy tutaj fakt, że specjalna tablica PHP `$GLOBALS` jest dostępna we wszystkich zasięgach.
Tablica ta zawiera elementy odpowiadające wszystkim zmiennym w zasięgu globalnym.
Oznacza to, że w dowolnej funkcji można skorzystać z odwołania `$GLOBALS['nazwa']`, aby uzyskać dostęp do zmiennej globalnej `$nazwa`.

Oto przykłady zmiennych superglobalnych:

* `$_GLOBALS` - tablica wszystkich zmiennych globalnych (podobnie jak słowo gluczowe `global` pozwala ona wewnątrz funkcji na dostęp do zmiennych globalnych, na przykład jako `$GLOBALS['mojazmienna']`),
* `$_SERVER` - tablica zmiennych środowiskowych serwera,
* `$_GET` - tablica zmiennych przekazanych do skryptu metodą GET,
* `$_POST` - tablica zmiennych przekazanych do skryptu metodą POST,
* `$_COOKIE` - tablica zmiennych COOKIE,
* `$_FILES` - tablica zmiennych związanych z ładowaniem pliku,
* `$_ENV` - tablica zmiennych środowiskowych PHP,
* `$_REQUEST` - tablica wszystkich zmiennych wprowadzonych przez użytkownika, włączając w to zawartość wprowadzonych zmiennych znajdujących się w `$_GET`, `$_POST`, i `$_COOKIE`,
* `$_SESSION` - tablica zmiennych sesji.

Każda z tych zmiennych superglobalnych zostanie omówiona nieco później.


## Przekazywanie zmiennych między plikami

Zmienne między plikami możemy przesyłać za pomocą czterech metod:

* `require()`
* `include()`
* `require_once()`
* `include_once()`

Wszystkie powyższe metody służą do jednego celu: **pobrania pliku**. Jednakże każda z nich działa nieco inaczej, o czym mówię poniżej.

### Różnica między `require()` a `include()`

`include()` jest to metoda, która pobiera plik z określonej ścieżki. Jednakże ignoruje ona pliki nieistniejące. Oznacza to tylko tyle, że jeśli plik nie istnieje, to program nie przestanie działać. Zostanie wyświetlony jedynie błąd, który nas poinformuje o tym fakcie.
`require()` różni się od powyższej tylko tym, że w momencie próby odniesienia się do nieistniejącego pliku zakończy działanie programu.

### Różnica między zwykłą metodą, a jej odpowiednikiem z "once"

Zwykłe metody `require()` i `include()` pozwalają do projektu dołączyć wiele plików. Gdy mamy bardziej rozbudowany projekt, możemy w kilku plikach wymagać zmiennych czy metod z innego pliku. Czasami zdarza się, że w całym projekcie dany plik może być użyty tylko raz - może być dołączony tylko raz. W takim wypadku musimy poinformować interpreter (oraz programistę) o tym wymaganiu.
Robimy to za pomocą ekwiwalentów powyższych metod z dopiskiem `once`.

>Warto też zaznaczyć, że stosowanie wyrażeń `require()` i `include()` nie zmienia zasięgu. Jeżeli wyrażenie to zostało wywołane wewnątrz funkcji, odnosi się do niego zasięg lokalny, jeśli na zewnątrz funkcji - zasięg globalny.

## Minimalizowanie zakresu (zasięgu) - uwagi końcowe

Podejście programistów do problemu minimalizowania zakresu zmiennych zależy w dużej mierze od tego, jak rozumieją oni pojęcia "wygoda" i "opanowanie zależności". Niektórzy programiści stosują wiele zmiennych globalnych, ponieważ zapewnia to łatwy dostęp do ich wartości i pozwala uniknąć zabawy z listami parametrów i regułami dotyczącymi zakresu w klasach. Uważają oni, że wygoda dostępu do zmiennej w dowolnym momencie jest cenniejsza niż związane z tym ryzyko.

Inni dbają o to, aby jak najbardziej ograniczać zakres zmiennych, ponieważ lokalność zakresu sprzyja opanowaniu złożoności. Im więcej informacji pozostaje ukrytych, tym mniejszy wysiłek intelektualny przy pracy z poszczególnymi fragmentami kodu. Gdy programista może operować mniejszą ilością informacji, maleje prawdopodobieństwo powstania błędów wynikających z zapomnienia o tym czy innym szczególe.

Różnica między "filozofią wygody" a "filozofią złożoności" sprowadza się do różnicy między ułatwieniem pisania kodu a ułatwieniem jego czytania. Maksymalizacja zakresu faktycznie czyni łatwiejszym pisanie programu, ale program, w któym każda procedura może użyć w dowolnym momencie każdej zmiennej, dużo trudniej jest poznać niż ten zbudowany z dobrze zaprojektowanych i podzielnych procedur. Nie wystarcza wtedy zrozumienie działania jednej procedury - trzeba poznać wszystkie inne, które używają tych samych danych globalnych. Tak budowany kod jest więc mało przejrzysty, trudny w debugowaniu i bardzo podatny na błędy przy modyfikacjach.

Podsumowując, każda zmienna powinna być deklarowana w taki sposób, aby była widoczna w jak najmniejszej części kodu. Najlepszym rozwiązaniem jest ograniczenie zakresu zmiennej do pojedynczej pętli lub procedury. Jeżeli nie jest to możliwe, widoczność powinna zostać ograniczona do pojedynczej klasy. W przypadku gdy nie można zawęzić zakresu do klasy, której odpowiedzialność za zmienną jest największa, warto utworzyć procedury dostępowe, które pozwolą udostępniać dane zmiennej innym klasom. Podejście takie zapewni, że potrzeba użycia widocznych w całym programie zmiennych globalnych będzie pojawiać się bardzo rzadko.
