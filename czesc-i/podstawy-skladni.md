Skoro tu jesteś to znaczy, że chcesz się **uczyć**! 
Postaramy się nauczyć Cię jak dobrze pracować z plikami PHP. Omówimy główną strukturę pliku PHP tak, abyś potrafił odróżnić zmienną od komentarza, przekażemy również kilka wskazówek dotyczących pisania kodu.
 
**Wygląd przykładowego pliku PHP:**

```php
<?php
# web/app.php
use Symfony\Component\HttpFoundation\Request;

$loader = require_once __DIR__ . '/../app/bootstrap.php.cache';
require_once __DIR__ . '/../app/AppKernel.php';


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

$request  = Request::createFromGlobals();

$response = $kernel->handle($request);
$response->send();

$kernel->terminate($request, $response);
```
----------

# Tagi

**`<?php`** oraz **`?>`** - Są to charakterystyczne znaki rozpoznawcze języka PHP. To, co znajduje się pomiędzy nimi, uważane jest przez interpreter jako kod właściwy, który musi obsłużyć.
 
**`<?=`** oraz **`?>`** - to są specjalne tagi które zawsze będą działać. Ich zadanie to wyświetlanie podanej wartości. Często są stosowane w skompilowanych szablonach. 
 
 **Przykład:**
```html
<!-- kod html -->
<p>Aktualna cena: <?= $totalPrice ?> </p>
<!-- kod html -->
```
Zastępują one dokładnie taką konstrukcję:
```html
<p>Aktualna cena: <?php echo $totalprice ?> </p>

```

# Komentarze


Komentarze w języku PHP są podobne, jak w wielu językach programowania i mają podobne działanie. Służą tylko i wyłącznie dla programisty i jego kolegów.

Istnieją trzy typy komentarzy.  Są to komentarze wymienione poniżej.

## Wieloliniowe

```php
<?php
/* 
 *  Tutaj
 *  Komentarz
 */
```
Rozpoczynają się od /* a kończą  \*/. Oczywiście w tym przykładzie nie jest konieczne co nową linię wstawiać "gwiazdkę". 

## Jednoliniowe

Do jednoliniowych zaliczamy tekst rozpoczynający się od **`//`** lub **`#`** - aczkolwiek częściej spotkać można zapis `// my pretty comment`
```php
<?php
// this is inline comment
# same here!
```

## Specjalne

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

Jak możesz zauważyć, są to komentarze dokumentacji.   
To specjalne komentarze, dzięki którym odpowiednie oprogramowanie (np. phpDocumentor) będzie mogło szybko i łatwo sporządzić dokumentację danej klasy/funkcji.
Oczywiście nie jest to jedyne zastosowanie tych komentarzy!
Dzięki takim komentarzom inteligentne IDE są w stanie praktycznie natychmiast podpowiadać nam o co chodzi. Na przykład możemy za pomocą takiego komentarza poinformować IDE o typie zmiennej, który jest definiowany przez interfejs.

## Komentarze dla innych programistów

Warto wspomnieć tutaj o tym, do czego poszczególne rodzaje komentarzy są wykorzystywane przez programistów. Oczywiście mogę z ręką na sercu powiedzieć, że piszemy dobre komentarze, jak i złe. 

### Dobre komentarze

#### **Prawne komentarze**
Umieszczane są na początku pliku, występują one w komentarzu wielolinijkowym lub jednolinijkowym w zależności od ilości informacji, które w sobie zawierają. Zwykle są informacje o licencji dla każdej części oprogramowania lub o autorze modułu.

**Przykład komentarza wielolinijkowego:**
```php
/********************************************************************
Copyright (C) 2015  PHPKurs

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
**********************************************************************/
```
**Przykład komentarza jednolinijkowego:**
```php
// Copyright (C) 2015 PHPKurs
```

#### **Informacyjne**
Zazwyczaj umieszczane są w jednolinikowych  `//` (patrz plik PHP na początku rozdziału) zawierają informację dla drugiego programisty o instrukcji np. ładowania klas z pamięci.

```php
<?php
// get host name from URL
preg_match('@^(?:http://)?([^/]+)@i',
           "http://www.php.net/index.html", 
           $matches);
           
$host = $matches[1];

// get last two segments of host name
preg_match('/[^.]+\.[^.]+$/', 
           $host, 
           $matches);

echo "Domain name is: {$matches[0]}" . PHP_EOL;
```

#### **Zamierzeń**
Czasem jako programiści musimy podjąć decyzję, w jaki sposób chcemy rozwiązać dany problem. Na przykład - mamy do wyboru dwa typy wyjątków, które możemy użyć w danej sytuacji. Możemy w komentarzu umieścić informację dlaczego w tej chwili tak zdecydowaliśmy. 

#### **Wyjaśnienie**
Komentarz wyjaśniający to taki, który potrafi nam wytłumaczyć na przykład skomplikowane wyrażenie - w jednym czy dwu zdaniach. Bywa to przydatne, gdy dane wyrażenie rzeczywiście jest na tyle zawiłe, że szybciej zrozumiemy jego ideę po przeczytaniu komentarza. 

#### **Ostrzeżenie o konsekwencjach**
Są zazwyczaj informacją w komentarzach jednolinikowych `//`  ostrzegającą na przykład o tym, że uruchomienie "**tego**" będzie miało poważny skutek w postaci spadku wydajności.

```php
// UWAGA: Uruchomienie tej funkcji rozpocznie dump bazy danych - może zająć kilka dni. 
```

#### **Komentarze TODO** 
Są dość często wykorzystywane na początku projektowania aplikacji w celu zrobienia listy TODO. Dziś są wyłapywane przez IDE, ponieważ generują dług technologiczny każdej aplikacji. Każdy komentarz TODO powoduje, że trzeba będzie kiedyś wrócić do tego miejsca. O ile na początku projektowania aplikacji mogą być uznane za przydatne, o tyle później może zabrać kilka godzin pracy, jeśli wróci się do takiego komentarza po 2 miesiącach. 
Wynika z tego to, że mimo iż jest to dobry typ komentarzy, to trzeba z nim postępować ostrożnie.

**Przykład komentarza `TODO`:**
```php
 <?php
   public function divide($numberA, $numberB){
     //TODO: Implement this method.
   }
```
***


## **Dobre praktyki pisania komentarzy**  
Często w książkach dla początkujących autorzy zachęcają do skrupulatnego komentowania swojego kodu. Argumentują takie rozumowanie tym, że w przyszłości wrócisz do swojego kodu, przeczytasz go, spojrzysz na komentarz i wszystko będzie jasne! 

Oczywiście na pewnym etapie nauki programowania - raczkowanie - można stosować się do tej zasady. Początkującym pomaga to zrozumienie w jaki sposób stworzony kod działa (na przykład skomplikowana pętla, którą napisaliśmy, żeby zrozumieć jej dziwne działanie). Jednak kiedy spojrzymy w profesjonalny kod możemy się zdziwić i zbulwersować. **Nie ma tam komentarzy**. Przynajmniej tylu, ilu byśmy się spodziewali po takich gorących prośbach autorów książek. 

Jak to się dzieje, że profesjonaliści nie komentują? Naprawdę są tacy mądrzy? Czytaj dalej :)

**Robert C. Martin** *Czysty kod*:
>W rzeczywistości komentarze są w najlepszym przypadku koniecznym złem. Jeżeli nasz język programowania jest wystarczająco ekspresyjny lub mamy wystarczający talent, by wykorzystywać ten język, aby wyrażać nasze zamierzenia, nie będziemy potrzebować zbyt wielu komentarzy.

Jeżeli komentujesz wszystko obszernie co tylko się da, to znaczy, że Twój kod nie jest czysty.  

>Czytelny kod nie wymaga komentarzy. 

Czytelny kod to taki który czytasz jak artykuł w gazecie, klasa mówi o tym co robi, funkcje/metody opisują siebie same, czytając zmienne wiesz o co chodzi bo nie są one zapisane np  int a,b,c,d. 

**Przykład**
```php
// (A)
// Sprawdzenie czy pracownik ma prawo do wszystkich korzyści
if (( $employee->flags === Employee::HOURLY_FLAG) && ( $employee->age > 65 ) )
 
// (B)
if ( $employee->isEligibleForFullBenefits() ) 
```
> Osobiście wolałbym zobaczyć przykład drugi, bo gdy czytam ten kod, to go rozumiem. Komentarz jest zbędny (***@efiku***). 

## Wskazówka odnośnie pisania kodu PHP:

***Zła praktyka:***
Mieszanie kodu PHP z HTML może się skończyć dla Ciebie tragicznie, Twojego projektu i wspópracowników.  
Wyobraź sobie, że jesteś na miejscu pani Ewy, która dobrze zna się na HTML, ale z PHP nie miała zbytnio do czynienia. Dostała właśnie Twój projekt, ktoś kazał jej zmienić wygląd tabelki. Otwiera taki pomieszany plik i nie wie co tu się dzieje, zupełnie nie widzi gdzie kończy się tabelka a gdzie zaczyna. Skończyło się na tym, że zapomniała, iż przez pomyłkę usunęła jakąś zmienną z kodu i bum. 
 
***Dobra praktyka:***  
Zawsze staraj się oddzielać kod PHP od HTML w swoich skryptach. Na początku będzie ciężko, ale z czasem wejdzie to w nawyk. Odseparowanie warstwy widoku od warstwy logiki ułatwia bardzo pracę. 

Pomyśl.
PS. Złapiesz plusa u pracodawcy :-)
