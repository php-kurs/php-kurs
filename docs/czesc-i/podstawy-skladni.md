Skoro tu jesteś to chcesz to znaczy, że chcesz się uczyć! 
Postaramy się nauczyć Cię jak dobrze pracować z plikami php, omówić główną strukturę pliku PHP, tak, abyś potrafił odróżnić zmienną od komentarza, zahaczymy także o dobre narzędzia - które ułatwią pracę w PHP oraz przekażemy kilka wskazówek dotyczących pisania kodu.
 
**Wygląd przykładowego pliku PHP:**

```php
# web/app.php
use Symfony\Component\HttpFoundation\Request;
$loader = require_once __DIR__.'/../app/bootstrap.php.cache';
require_once __DIR__.'/../app/AppKernel.php';


// Enable APC for autoloading to improve performance.
// You should change the ApcClassLoader first argument to a unique prefix
// in order to prevent cache key conflicts with other applications
// also using APC.
/*
$apcLoader = new ApcClassLoader(sha1(__FILE__), $loader);
$loader->unregister();
$apcLoader->register(true);
*/

$kernel = new AppKernel('prod', false);
$kernel->loadClassCache();

$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();
$kernel->terminate($request, $response);
```
----------


## Tagi 
**<?php ?>** - Jest charakterystycznym znakiem rozpoznawczym języka PHP. To co znajduje się pomiędzy, uważane jest przez interpreter jako kod właściwy, który musi obsłużyć.
 
**<?= ?>** - są to specjalne tagi które zawsze będą działać, ich zadanie to wyświetlanie jakiejś wartości
często stosowane w skompilowanych szablonach. 
 Przykład:
```html
cena : <?= $totalPrice ?>
```
Zastępują one dokładnie taką konstrukcję 
```php
<?php echo $totalprice ?>
```

## Komentarze
Komentarze w języku PHP są podobne jak w wielu językach programowania, mają także podobne działanie. Służą tylko i wyłącznie dla programisty.
Istnieją trzy typy komentarzy.  Są to komentarze:  

### Wieloliniowe

```php
<?php
/* 
*  Tutaj
*  Komentarz
*/
```
Rozpoczynają się od /* a kończą  \*/. Oczywiście w tym przykładzie nie jest konieczne co nową linię wstawiać "gwiazdkę". 

### Jednoliniowe

Do jednoliniowych zaliczamy tekst rozpoczynający się od **//** lub **#** - aczkolwiek częściej spotkać można zapis *// my comment*  
```php
<?php
// this is inline comment
# same here!
```

##Specjalne

Przykład komentarza specjalnego:
```php
<?php
/**
*  Find sepcified user in Collection of users
*  @param User $user User Object
*  @return ArrayObject
*/
public function find(User $user);
```

Jak możesz zauważyć to są komentarze dokumentacji.   
To specjalne komentarze dzięki którym odpowiednie oprogramowanie  będzie mogło szybko i łatwo sporządzić dokumentację danej klasy / funkcji.
Oczywiście  to nie jedyne zastosowanie tych komentarzy! 
Dzięki takim komentarzom inteligentne IDE są w stanie praktycznie natychmiast podpowiadać nam o co chodzi. 


### Komentarze dla innych programistów

Warto wspomnieć tutaj o tym do czego poszczególne rodzaje komentarzy są wykorzystywane przez programistów.
Komentarze:

 1. prawne 
 2. informacyjne 
 3. zamierzeń 
 4. wyjaśnienie 
 5. ostrzeżenie o konsekwencjach 
 6. TODO 

1 - **Prawne komentarze** umieszczane są na początku pliku, występują one w komentarzu wielolinikowym zawierają one informacje o Licencji dla każdej części oprogramowania.

2 -  **Informacyjne**,  zazwyczaj umieszczane są w jednolinikowych  "//" (Patrz  plik PHP na początku  rozdziału. ) zawierają informację dla drugiego programisty o instrukcji np ładowania klas z pamięci.

3 - **Zamierzeń**,  [ @event15 uzupelnij ]

4 - **Wyjaśnienie**,  [ @event15 ]

5 - **Ostrzeżenie o konsekwencjach**, są to ostrzeżenia zazwyczaj w komentarzach jednolinikowych `//`  ostrzegają na przykład o tym, że uruchomienie "tego" będzie miało poważny spadek wydajności.

6- **Komentarze TODO** są wyłapywane przez IDE ponieważ to one generują dług technologiczny każdej aplikacji.  
```php
 <?php
   public function divide($numberA, $numberB){
     //TODO: Implement this method.
   }
```

***


**Dobra praktyka pisania komentarzy w skrócie:**  

Wiadomo, czasami komentarze są przymusem, ale pozwól, że zacytuję Ci z książki wujka Bob'a "czysty kod" str. 75:  
"W rzeczywistości komentarze są w najlepszym przypadku koniecznym złem. Jeżeli nasz język programowania jest wystarczająco ekspresyjny lub mamy wystarczający talent, by wykorzystywać ten język, aby wyrażać nasze zamierzenia, nie będziemy potrzebować zbyt wielu komentarzy".

Jeżeli komentujesz wszystko obszernie co tylko się da, to znaczy, że Twój kod nie jest czysty.  

(Strona 77): "Czytelny kod nie wymaga komentarzy". Czytelny kod to taki który czytasz jak artykuł w gazecie, klasa mówi o tym co robi, funkcje/metody opisują siebie same, czytając zmienne wiesz o co chodzi bo nie są one zapisane np  int a,b,c,d. 

**Przykład**
```java
// A
 
// Sprawdzenie czy pracownik ma prawo do wszystkich korzyści
if (( employee.flags & HOURLY_FLAG) && ( employee.age > 65 ) )
 
 
// B
 
if ( employee.isEligibleForFullBenefits() ) 
```

Ja osobiście wolałbym zobaczyć przykład drugi, bo jak czytam kod , to po prostu sam mi się opisuje. 



## Narzędzia

Każdy kiedyś zaczynał od notatnika... wie jak to się pisało. 
Zero podpowiadania nazw funkcji, brak analizy kodu w czasie rzeczywistym. Praca z notatnikiem to była męczarnia, ale te czasy na szczęście już minęły!
Zapamiętaj. Notatnik to nie IDE. 

W tym kursie będziemy posługiwać się dwoma IDE.

 1. **Płatnym PHPStorm (najlepsze  płatne IDE dla PHP)**
 2. **Darmowym NetBeans PHP (najlepszy darmowy IDE dla PHP)**

Pokażemy Ci, że dużo wygodniej piszę się w takim Stromie niż notatniku.
Oczywiście, w dalszych rozdziałach dowiemy się o narzędziach służących do tworzenia testów, specyfikacji klas,  będziemy pisać kod sterowany testami.  

To był tylko mały wstęp, jeżeli się nie poddasz i dotrzesz do części poświęconej testom, to gwarantujemy, że się zakochasz w testach!

## Wskazówki
 
 Przyszła pora na najważniejszą część tego rozdziału.  Są to wskazówki.
 Ciężko było nam wybrać, co dać jako pierwszą wskazówkę, ale później doszliśmy do wniosku, że nieważne co będzie pierwsze, ważne aby zostało zapamiętane!  Czytaj uważnie!
 ___

### Wskazówka odnośnie pisania kodu PHP:

**Dobra praktyka:**  
Zawsze staraj się oddzielać kod PHP od HTML w swoich skryptach. Na początku będzie ciężko, ale z czasem wejdzie w nawyk. Odseparowanie warstwy widoku od warstwy logiki ułatwia bardzo pracę. 

**Zła praktyka:**
Mieszanie  kodu PHP z HTML może skończyć się tragicznie dla Ciebie, Twojego projektu i kolaborantów.  
 Wyobraź sobie, że jesteś na miejscu pani Ewy, która dobrze zna się na HTML, ale z PHP nie miała zbytnio do czynienia. Dostała właśnie Twój projekt, ktoś tam kazał jej zmienić wygląd tabelki. Otwiera taki pomieszany plik i nie wie co tu się dzieje, zupełnie nie widzi gdzie kończy się tabelka a gdzie zaczyna. Skończyło się na tym, że zapomniała iż przez pomyłkę usunęła jakąś zmienną z kodu i bum. 

Pomyśl.
PS: Zaplusujesz u pracodawcy :-)

### Wskazówka odnośnie komentarzy

Niech komentarze wyjaśniają „dlaczego”, a nie „jak”. Komentarze, które
wyjaśniają, jak coś jest wykonywane, operują zazwyczaj na poziomie języka
programowania, a nie na poziomie problemu. Jest prawie niemożliwe, aby
komentarz koncentrujący się na sposobie wykonywania operacji wyjaśniał jej
cel. Komentarze takie są też najczęściej nadmiarowe. Czy poniższy komentarz
zawiera jakiekolwiek informacje, których nie można znaleźć w kodzie?
Przykład komentarza, który koncentruje się na „jak”
```java
// jeżeli znacznik konta ma wartość zero
if ( $accountFlag == 0 ) ...
```
Przykład komentarza, który koncentruje się na „dlaczego” (Java)
```java
// jeżeli zakładanie nowego konta
if ( $accountFlag == 0 ) ...
```

Przykład dobrego stylu programowania połączonego z komentarzem typu
„dlaczego” 
```java
// jeżeli zakładanie nowego konta
if ( $accountType == $this->accountType ) ...
```
Gdy kod osiąga taki poziom czytelności, właściwe staje się kwestionowanie
wartości komentarza. W tym przypadku lepszy kod sprawił, że komentarz jest
nadmiarowy i prawdopodobnie powinien zostać usunięty. Można też nieco
zmodyfikować jego rolę:
```java
Przykład komentarza nagłówkowego (Java)
// zakładanie nowego konta
if ( $accountType == $this->accountType ) {
...
}
```
Gdy komentarz opisuje cały blok kodu po teście if , staje się komentarzem
podsumowującym i może pozostać w programie jako nagłówek opisujący następujący po nim akapit kodu.

***
**Używaj komentarzy, aby przygotować czytającego kod na dalszy ciąg**. Dobre
komentarze informują czytającego kod o tym, czego powinien się spodziewać. 
Osoba czytająca program powinna mieć możliwość przejrzenia samych
tylko komentarzy i uzyskania dobrego obrazu tego, co dany kod robi i gdzie
znaleźć poszczególne operacje. Wynika z tego między innymi zasada, że komentarz powinien zawsze poprzedzać to, co opisuje. Nie mówi się o tym na zajęciach
z programowania, ale jest to powszechnie przestrzegana reguła.
**Niech każdy komentarz ma znaczenie**. Nadmiar komentarzy nie przynosi żadnych korzyści — zbyt duża ich liczba zmniejsza czytelność opisywanego kodu.
Zamiast pisać więcej komentarzy, lepiej włożyć dodatkowy wysiłek w zwiększenie czytelności samego programu


**Unikaj skrótów**. Komentarze powinny być jednoznaczne i czytelne bez dodat-
kowego wysiłku niezbędnego do rozszyfrowania znaczenia skrótów. Unikaj
wszelkich skrótów poza najbardziej oczywistymi. Gdy nie wpisujesz komen-
tarzy na końcu wierszy, nie jest to zazwyczaj problemem. Jeżeli jednak wpi-
sujesz komentarze w taki sposób i pojawia się problem skrótów, potraktuj to
jako kolejny argument przeciwko tej metodzie.
Różnicuj rodzaje komentarzy. W pewnych przypadkach może pojawić się
potrzeba różnicowania między poziomami komentarzy w sposób sygnalizujący,
że komentarz szczegółowy jest częścią wcześniejszego, ogólniejszego. Można
to robić różnymi metodami. Można spróbować podkreślania głównego komen-
tarza i niepodkreślania szczegółowego.

Wadą tej metody jest to, że zmusza do podkreślania dużej liczby komentarzy.
Jeżeli podkreślasz jeden komentarz, oznacza to, że wszystkie pozostałe, niepod-
kreślone mają charakter podrzędny. W efekcie, gdy piszesz pierwszy komentarz, który nie jest podrzędny w stosunku do wcześniejszego podkreślonego
komentarza, również musisz użyć podkreślenia. To samo dotyczy dalszych
komentarzy. Kod zawiera wtedy zazwyczaj bardzo dużą liczbę podkreśleń lub
podkreślenia nie są stosowane w sposób konsekwentny.
Można wyróżnić kilka odmian tej metody, ale wszystkie one wiążą się z tymi
samymi problemami. Jeżeli komentarze wyższego poziomu będą pisane wielkimi literami, a komentarze niższego poziomu — małymi, to problem zbyt
wielu podkreśleń zastąpi problem zbyt wielu komentarzy pisanych wielkimi
literami. Niektórzy programiści zaczynają ważniejsze komentarze wielką literą,
a szczegółowe małą, ale jest to różnica bardzo subtelna i łatwa do przeoczenia.

Lepszą metodą jest wstawianie przed komentarzami szczegółowymi wielokropka.

Inną metodą, która często sprawdza się najlepiej, jest umieszczenie operacji
opisywanej komentarzem wyższego poziomu w osobnej procedurze. Procedury
powinny być logicznie „płaskie” — wszystkie ich operacje powinny być wykonywane na zbliżonym poziomie. Jeżeli kod wymaga różnicowania między operacjami wyższego i niższego poziomu, procedura nie ma takiego charakteru.
Przeniesienie skomplikowanej grupy operacji do osobnej procedury pozwala
uzyskać dwie procedury logicznie płaskie w miejsce jednej, logicznie niejednorodnej.
Zagadnienie różnych poziomów komentarzy nie dotyczy wcinanego kodu
wewnątrz pętli i instrukcji warunkowych. Wówczas stosuje się najczęściej jeden
ogólny komentarz na początku pętli i komentarze bardziej szczegółowe wstawiane w obrębie wcinanego bloku. W takich przypadkach wcięcia jasno informują o organizacji logicznej komentarzy. Problem różnicowania poziomów
dotyczy wyłącznie sekwencyjnych akapitów kodu, kiedy na pełną operację składa
się kilka takich akapitów, a niektóre z nich mają charakter podrzędny.
Opisuj komentarzami wszystko, co ma związek z błędami i nieudokumentowanymi cechami języka lub środowiska. Jeżeli masz do czynienia z błędem,
jest on prawdopodobnie nieudokumentowany. Nawet jeżeli został gdzieś opisany, nie zaszkodzi dodatkowy opis w kodzie. Jeżeli masz do czynienia z nie-
udokumentowaną cechą języka lub środowiska, to niejako z definicji brak jakiegokolwiek jej opisu i powinien on znaleźć się w programie.

Zapisuj uzasadnienia odstępstw od dobrego stylu programowania. Jeżeli
musisz odejść od dobrego stylu programowania, wyjaśnij, dlaczego to robisz.
Pozwoli to uniknąć sytuacji, w których pełen dobrych intencji programista
dostosowuje kod do lepszego stylu, zmieniając zarazem jego działanie. Takie
uzasadnienie będzie potwierdzeniem tego, że wiedziałeś, co robisz, i że zaskakująca konstrukcja nie wynika z niedbalstwa — nie pozwól, aby ktoś oskarżał
Cię o pisanie złego kodu!

Starając się opisać kod, koncentruj się przede wszystkim na samym kodzie.
Warto przypomnieć, że sam kod programu jest pierwszym rodzajem dokumentacji, który warto dopracować. W poprzednim przykładzie literał $ powinien zostać zastąpiony stałą nazwaną, a zmienne powinny dostarczać pełniejszych informacji o wykonywanych operacjach. Aby maksymalnie zwiększyć
czytelność, należałoby jeszcze wprowadzić zmienną przechowującą wynik
wyszukiwania. Zapewniłoby to wyraźne rozróżnienie między indeksem pętli
a wynikiem.

Używaj komentarzy na końcu wierszy do opisywania deklaracji danych.
Komentarze na końcu wierszy sprawdzają się przy opisywaniu deklaracji danych,
ponieważ nie pojawiają się wtedy problemy typowe dla tego rodzaju komentarzy, gdy są stosowane do opisywania głównego kodu. Warunkiem jest oczy-
wiście odpowiednia ilość dostępnego miejsca. 132 kolumny pozwalają zazwyczaj czytelnie opisać deklarację danych.

Używaj stylów, które nie sprawiają kłopotu przy wprowadzaniu zmian.
Praktycznie każdy bardziej wyszukany styl sprawia problemy przy aktualizowaniu komentarzy i kodu. Spróbuj na przykład wskazać w poniższych komentarzach część, która jest najbardziej narażona na ignorowanie przez programistów wprowadzających zmiany

Istotną rzeczą jest to, aby zwracać uwagę na to, jak wykorzystywany jest czas
poświęcany na pracę z kodem. Jeżeli spędzasz dużo czasu, wprowadzając i usuwając poziome kreski, aby dopasować długość podkreśleń do długości komentarzy, to nie jest to już programowanie, ale proste marnotrawienie czasu. Lepiej znaleźć inny, praktyczniejszy styl komentarzy. W przypadku podkreśleń roz-
wiązaniem może być pozostawienie samych komentarzy, bez tego dodatkowego
elementu. Jeżeli podkreślenia wydają się konieczne, są też inne możliwości.
Jedną z nich jest stosowanie jednolitych podkreśleń, których długość nie jest
związana z długością komentarzy. Takie podkreślenia nie wymagają późniejszego poprawiania i łatwo je wprowadzać przy użyciu makra edytora tekstu.

Aby zredukować czas poświęcany na pisanie komentarzy, używaj Procesu
Programowania w Pseudokodzie. Pisanie zarysu programu w postaci komentarzy jeszcze przed rozpoczęciem budowy właściwego kodu niesie ze sobą
kilka istotnych korzyści. Gdy kończy się praca z kodem, komentarze są już
gotowe. Nie ma potrzeby poświęcania na nie dodatkowego czasu. Zyskujesz
także wszystko to, co daje pisanie wysokopoziomowego pseudokodu przed
utworzeniem niskopoziomowego kodu w języku programowania.
Włączaj komentowanie do procesu programowania. Alternatywą dla włączenia pisania komentarzy do procesu programowania jest pozostawienie pracy
nad nimi na sam koniec projektu. Ma to jednak wiele wad. Przede wszystkim,
pisanie komentarzy staje się wtedy kolejnym zadaniem do wykonania, co
sprawia, że wydaje się bardziej pracochłonne niż przy komentowaniu na bieżąco.
Dodatkowo późne pisanie komentarzy jest faktycznie bardziej pracochłonne,
bo zmusza do przypominania sobie lub sprawdzania, co robią poszczególne
fragmenty kodu, zamiast prostego zapisania tego, co można zapisać bez zastanowienia w trakcie tworzenia tych fragmentów. Takie komentarze są też mniej
dokładne, bo łatwo zapomnieć o niektórych założeniach i drobnych szczegółach projektu.
Typowy argument przeciwko komentowaniu kodu na bieżąco brzmi: „Gdy
koncentrujesz się na pracy z kodem, nie powinieneś rozpraszać się, pisząc
komentarze”. Właściwą odpowiedzią na ten argument jest stwierdzenie, że
jeżeli pisanie kodu wymaga tak silnej koncentracji, że komentowanie zaburza
tok myślenia, to należałoby rozpocząć od napisania pseudokodu, a następnie
przekształcić go w komentarze. Kod, który wymaga tak mocnej koncentracji,
to ważny sygnał ostrzegawczy.

Jeżeli projekt jest trudny do zapisania w postaci kodu programu, uprość taki
projekt, jeszcze zanim zaczniesz zajmować się komentarzami czy kodem. Jeżeli
użyjesz do uporządkowania swoich zamysłów pseudokodu, pisanie kodu stanie
się proste, a komentarze powstaną automatycznie.
Wydajność nie jest dobrym powodem, by unikać komentarzy. Jedną z rzeczy,
które wciąż powracają z kolejnymi falami technologii (patrz omówienie w podrozdziale 4.3, „Twoje położenie na fali technologii”), są środowiska interpretujące kod. Komentarze powodują w nich mierzalne obniżenie szybkości pracy.
W latach osiemdziesiątych komentarze spowalniały pracę pisanych w Basicu
programów na oryginalnym IBM PC. W latach dziewięćdziesiątych taki sam
problem dotyczył stron .asp. W nowym wieku spotykamy się z nim przy
przesyłaniu JavaScriptu i innego kodu wykonywanego po stronie klienta.

W każdym z tych przypadków optymalnym rozwiązaniem nie była rezygnacja z komentarzy. Było nim tworzenie specjalnej, finalnej wersji kodu, która
różniła się od wersji wykorzystywanej w codziennej pracy. Zazwyczaj wykorzystywano do tego celu narzędzia automatycznie usuwające komentarze
w trakcie procesu generowania programu docelowego.

Umieszczaj komentarze blisko kodu, który opisują. Jedną z przesłanek, dla
których prolog procedury nie powinien zawierać obszernej dokumentacji,
jest to, że podejście takie prowadzi do znacznego oddalenia komentarzy od
opisywanych przez nie części kodu. W trakcie konserwacji i rozbudowy programu komentarze odległe od modyfikowanych fragmentów są często ignorowane. Gdy komentarze i kod przestają być ze sobą zgodne, komentarze
stają się bezużyteczne. Dużo lepiej przestrzegać Zasady Bliskości i umieszczać
komentarze jak najbliżej kodu, który opisują. Zwiększa to prawdopodobieństwo,
że pozostaną aktualne po zmianach, przez co zachowają swoją użyteczność.
Poniżej opisuję kilka elementów prologu procedury. Należy je wprowadzać do
kodu tylko wtedy, gdy są potrzebne. Nic nie stoi na przeszkodzie, aby utworzyć
pewien standardowy szablon opisu procedury. Nie warto jednak trzymać się
zasady, że każdy element tego szablonu musi zostać wykorzystany. Wykorzystaj
elementy, które są potrzebne, po czym usuń pozostałe.

Opisuj procedury jednym – dwoma zdaniami w umieszczanym przed nimi
komentarzu. Jeżeli nie jesteś w stanie opisać procedury w jednym lub dwóch
krótkich zdaniach, to prawdopodobnie powinieneś poświęcić nieco czasu na
zastanowienie się nad jej rolą w programie. Trudności w sformułowaniu krótkiego opisu są sygnałem, że projekt nie jest w pełni dopracowany. Oderwij się
od pisania kodu i poświęć nieco czasu na poprawienie projektu.

Opisuj założenia interfejsu. Dokumentowanie założeń interfejsu można traktować jako uzupełnienie innych zasad pracy z komentarzami. Jeżeli budowa
procedury opiera się na jakichkolwiek założeniach dotyczących stanu przekazywanych zmiennych — wartości dopuszczalne i niedopuszczalne, kolejność
elementów tablic, zainicjalizowanie pewnych danych składowych czy to, że
zawierają tylko poprawne dane — opisuj te założenia albo w prologu procedury,
albo przy deklaracjach danych. Takich informacji w komentarzach wymaga
praktycznie każda procedura.
Dbaj też o informacje o wykorzystywanych danych globalnych. Zmienna globalna jest w równym stopniu elementem interfejsu procedury, co każda inna.
Stwarza przy tym istotne zagrożenia, ponieważ nie zawsze jej globalny status
jest wyraźnie widoczny.
Gdy w trakcie pisania procedury zauważasz, że kod wykorzystuje pewne założenia dotyczące jej interfejsu, nie zwlekaj z zapisaniem tych założeń w komentarzach.

Opisuj globalne skutki wykonania procedury. Jeżeli procedura modyfikuje
dane globalne, opisuj dokładnie, na czym polegają te modyfikacje. Jak pisałem
w podrozdziale 13.3, „Dane globalne”, modyfikowanie danych globalnych
jest przynajmniej o rząd wielkości bardziej niebezpieczne niż ich odczytywanie.
Zmiany takie należy więc wprowadzać bardzo ostrożnie, a częścią tej ostrożności jest zapewnienie odpowiedniego opisu. Podobnie jak w innych sytuacjach, gdy pisanie takich opisów staje się uciążliwe, przepisz kod od postaw,
redukując użycie zmiennych globalnych.
Informuj o źródłach stosowanych algorytmów. Jeżeli używasz algorytmu opisanego w książce lub artykule, podaj tytuł książki lub artykułu i numer strony.
Jeżeli napisałeś algorytm sam, zapewnij informację o tym, gdzie można znaleźć
notatki dotyczące tego algorytmu.

Opisy klas
Dla każdej klasy utwórz blok komentarza opisujący jej podstawowe atrybuty:
Opisuj sposób projektowania klasy. Bardzo pomocne są komentarze ogólne,
dostarczające informacji, których nie można w prosty sposób odtworzyć na
podstawie kodu. Opisuj podejście przyjęte przy projektowaniu klasy, ogólną
filozofię tego podejścia oraz rozważone i odrzucone alternatywy.
Opisuj ograniczenia, założenia i inne podobne aspekty. Podobnie jak w przypadku procedur dbaj o opisy ograniczeń wynikających z projektu klasy. Opisuj
też założenia dotyczące danych wejściowych i wyjściowych, schemat obsługi
błędów, globalne skutki wykonywanych operacji, źródła algorytmów itd.
Opisuj interfejs klasy. Czy inny programista będzie w stanie określić, jak używać klasy bez przeglądania jej implementacji? Jeżeli nie, hermetyzacja klasy
jest zagrożona. Interfejs klasy powinien zawierać całość informacji niezbędnych do korzystania z tej klasy. Minimalny wymóg w konwencji Javadoc to 
opisanie każdego parametru i każdej zwracanej wartości (Sun Microsystems 2000). Powinien on zostać spełniony dla każdej udostępnianej procedury
(Bloch 2001).
Nie opisuj w interfejsie klasy szczegółów implementacji. Podstawową zasadą
hermetyzacji jest udostępnianie wyłącznie tych informacji, których udostęp-
nienie jest konieczne. Jeżeli kwestia potrzeby ujawnienia pewnej informacji
budzi wątpliwości, ogólną zasadą jest jej nieujawnianie. Pliki interfejsu klasy
powinny zawierać informacje niezbędne do korzystania z tej klasy, ale nie
informacje potrzebne do pracy z jej kodem.

W każdym pliku utwórz blok komentarza opisujący jego zawartość:
Opisuj przeznaczenie i zawartość pliku. Komentarz nagłówkowy pliku powinien
opisywać klasy lub procedury zawarte w tym pliku. Jeżeli w pliku znajdują się
wszystkie procedury programu, przeznaczenie pliku jest dość oczywiste —
jest to plik zawierający cały program. Jeżeli rolą pliku jest przechowywanie
kodu klasy, jego przeznaczenie jest także oczywiste — jest to plik zawierający
klasę o nazwie podobnej do nazwy pliku.

Zapisuj znacznik wersji. Wiele systemów kontroli wersji wstawia informację
o wersji pliku automatycznie. Na przykład w CVS znaki
// $Id$
zostaną automatycznie zamienione na
// $Id: ClassName.java,v 1.1 2004/02/05 00:36:43 ismena Exp $
Zapewnia to obecność w pliku aktualnej informacji o wersji bez żadnej dodat-
kowej pracy ze strony programistów poza wstawieniem na początku komen-
tarza $Id$ .

Zapisuj w bloku komentarza notę copyright. Wiele firm dba o to, aby w programach znajdowały się informacje o prawach autorskich, klauzule poufności
plików i inne elementy natury prawnej. Jeżeli pracujesz w takiej firmie, umieść
w pliku notę podobną do przedstawionej poniżej. Możesz też spytać doradcę
prawnego firmy, jakie informacje powinny znaleźć się w plikach.
