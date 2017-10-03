# Ogólnie o tablicach

Jak w wielu innych językach tak i w PHP mamy do dyspozycji tablice.  
Odrygwają one dosyć ważną rolę, gdyż praktycznie każda aplikacja korzysta z tablic, aby przechowywać różne dane. Podczas procesu swojej nauki powinieneś dobrze zrozumieć tablice. Jak się po nich poruszać, jak je sortować czy tam filtrować. Nie obędzie się tutaj też bez zaglądania do Manuala w którym to jest masa funkcji do obsługi tablic.

**Czym jest tablica?**

Najprościej mówiąc, tablica to taki pojemnik na dane, które mogą być różnego typu, a więc tablice to typ złożony.

Tablice, w których dane są tego samego typu nazywamy **kolekcją**.

**Przykładowo:**

Mamy w garażu 20 aut różnej marki, ale każde z nich ma przypisany numerek.  
Garaż to nasza tablica, numery to indeksy, a auta to wartości pod konkretnym indeksem.  
Możemy śmiało powiedzieć, że nasz garaż przechowuje kolekcję aut.

**W PHP dysponujemy dwoma rodzajami tablic**

Tablice które posiadają **indeks**:

```php
<?php
  $beer = [
   'Perła',
    2.50,
   'dobra!'
  ];
```

**Asocjacyjne** tablice z kluczami.

```php
<?php  
  $beer = [
   "name"        => 'Perła',
   "cost"        =>  2.5,
   "currency"    => 'PLN',
   "description" => 'Najlepsze piwo dla programistów PHP'
  ];
```

---

Czasami dochodzimy do momentu w którym tablice posiadające jeden wymiar już nam nie wystarczają.  
Wtedy zastanawiamy się, czy istnieje jakiś sposób, aby dodać jeden wymiar więcej.

Wyobraź sobie, że posiadasz kilka garaży, a każdy garaż przechowuję kolekcję aut.  
Chcąc się odwołać do konkretnego auta, musisz określić w jakim garażu to auto się znajduje.

```php
<?php
  $garage = [
    'Opel',
    'Skoda',
    'Ferrari' # indeks 2
   ];

  $garages = [
      $garage,
      $garage,
      $garage,
      $garage # indeks 3
  ]; 


  echo $garages[3][2]; # Ferrari
```

* 3 : To numer konkretnego garażu
* 2 : To numer parkingu na którym istnieje nasze auto.

# Operacje na elementach

Tablice w PHP deklarujemy w następujący sposób:

```php
<?php
$beer = [];
```

Nazwa zmiennej wskazuje, że będziemy w niej przechowywać informacje o konkretnym piwie.

> **UWAGA!** Możesz spotkać się z zapisem **array\(\)**, ale odchodzi się już od tego zapisu na rzecz \[\].

Możemy już w momencie deklarowania tablicy określić, jakie będzie miała elementy:

```php
<?php
$beer = [ 'Perła', 2.50, 'ID301049102' ] ;
```

Wiedząc, że mamy do czynienia z indeksowaną tablicą, możemy wyświetlić wartość z indeksu `1` .

```php
<?php
//...
echo $beer[1]; # 2.50
```

> **Numeracja elementów tablicy zaczyna się od zera!!**  
> Początkujący programiści często zapominają o numeracji indeksów w tablicy i przekraczają zakres.

Dodawanie elementów do tablicy zazwyczaj odbywa się na dwa sposoby.

** Za pomocą funkcji array\_push**

[array\_push](http://php.net/manual/en/function.array-push.php) - to funkcja która dodaje jakiś element do tablicy

```php
<?php
//..
array_push($beer, 'efik');
print_r($beer) # array(4) { 'Perla', 2.50 , 'ID301049102' , 'efik' }
```

**Poprzez przypisanie**

```php
<?php
$beer[] = 'efik';
```

Skrypt zwróci dokładnie to samo co wyżej.   
Zwróć uwagę, że nie podaliśmy numeru indeksu, co daje do zrozumienia interpreterowi, aby potraktował to jako dodanie elementu do istniejącej już kolekcji.

Dodawanie elementów do tablicy asocjacyjnej wygląda nieco inaczej.  
Zamiast pustych nawiasów kwadratowych musimy podać nową nazwę klucza, do którego chcemy coś wpisać.   
\( Podając już istniejącą nazwę klucza nadpiszemy wartość która się pod nim znajduje \)

```php
<?php  
  $beer = [
   "name"        => 'Perła',
   "cost"        => 2.5,
   "currency"    => 'PLN'
   "description" => 'Najlepsze piwo dla programistów PHP'
  ];

  $beer["hello"] = "world";
```

_A co w sytuacji, gdy chcemy połączyć dwie tablice ze sobą?_

Do połączenia dwóch tablic potrzebna będzie funkcja [**array\_merge**](http://php.net/manual/en/function.array-merge.php).  
Poniżej przykład, w którym łączymy dwie zupełnie różne tablice od siebie w jedną, nową.

```php
<?php
$array1 = ["color" => "red"];
$array2 = ["name" => "event15", "voice" => 0];
$result = array_merge($array1, $array2);
print_r($result);
```

W Usuwaniu elementów tablicy pomaga funkcja [unset\(\)](http://php.net/manual/en/function.unset.php)

```php
<?php
unset($beer[2]);
print_r($beer); # array(3) { 'Perla', 2.5 , 'efik' }
```

**Więcej informacji na temat funkcji służących do operowania na tablicach można znaleźć w oficjalnej dokumentacji PHP: **

* [http://php.net/manual/en/ref.array.php](http://php.net/manual/en/ref.array.php)

# Przeglądanie tablic

Jeżeli operujesz na tablicach w PHP, to nie obejdziesz się bez ich przeglądania.  
Do takiego przeglądania używamy pętli **foreach** ponieważ jest ona bardzo wygodna w użyciu i daje ogromne możliwości.  
Dla pokazania różnicy pomiędzy pętlami **for**, a **foreach** przygotujemy prosty przykład.

Wyobraź sobie, że masz system, który generuje Ci tablicę nieznanej długości. To co w niej się znajduję nie jest istotne.  
Jak myślisz, która opcja będzie bezpieczniejsza i wydajniejsza?

```php
 <?php
  $usersCollection = $app->container->get('entity.user.repository')->getAllUsers();

  // Opcja 1:

   for( $index = 0; $index < count($usersCollection); $index++){
     echo $UsersCollection[$index]->getName() . PHP_EOL;
   }

  // Opcja 2:

   foreach( $usersCollection as $user) {
     echo $user->getName() . PHP_EOL;
   }
```

Przeanalizujmy powyższy przykład.

---

**Opcja 1**

Są miejsca w których pętle **for** mają dobre zastosowanie, aczkolwiek nie w przypadku tablic.   
Za każdym obiegiem pętli obliczana jest ilość elementów które są przechowywane.   
Dodatkowo niepotrzebny nam jest tutaj indeks tablicy. Po co on jest, skoro poruszamy się po kolekcji użytkowników?  
Dochodzi także niebezpieczeństwo przekroczenia zakresu !!

[count\(\)](http://php.net/manual/en/function.count.php) - Obliczanie ilości elementów w tablicy.

---

**Opcja 2**

Tutaj już jest dużo bezpieczniej. Nie jesteśmy narażeni na przekroczenie indeksu tablicy. Nie interesuje nas indeks, otrzymujemy tablicę z konkretnym użytkownikiem i wyświetlamy jego imię.

Zapewne już widzisz, że pętla foreach jest bezpieczniejsza i lepsza ? W takim razie wyjaśnijmy jej działanie:

Pętla foreach służy do przeglądania tablic z indeksem, a także asocjacyjnych.

---

**Ogólna konstrukcja pętli:**

```php
<?php

   foreach ( $array as $key => $value ) {

       // DO something with value o key.

   }
```

---

Tłumaczymy ją tak:

**Dla każdego** elementu w tablicy `$array` , pobierz jego klucz `$key` i wartość `$value` na którą wskazuję.  
**Wykonaj** jakąś operację .  
**Powtarzaj dopóki** nie napotkasz ostatniego elementu w tablicy `$array`.   
\`

# Sortowanie tablic

Istnieje kilka funkcji do sortowania tablic.   
My przedstawimy tutaj kilka z nich, gdyż elegancko są one opisane na **manualu**!  
Nauka programowania to także nauka umięjętności korzystania z dokuemtnacji!

---

Funkcja  [**asort\(\);**](http://php.net/manual/pl/function.asort.php) - sortuje tablicę w taki sposób, że klucze zachowują przypisane wartości. Ten sposób sortowania jest używany głównie przy sortowaniu tablic asocjacyjnych, gdzie znacząca jest kolejność występowania elementów w tablicy.

Link do sprawdzenia wyniku: [https://3v4l.org/lXMsv](https://3v4l.org/lXMsv)

```php
<?php

$messages = [ 
  "a" => "use this ",
  "b" => "@ - ",
  "c" => "Don't"  
];
asort ($messages);

foreach( $messages as $message){
  echo $message ." ";
}

echo PHP_EOL;
```

Funkcja [**sort\(\);**](http://php.net/manual/pl/function.sort.php) - sortuję tablicę w kolejności od najmniejszego do największego. Musisz pamiętać, że klucze zostaną nadpisane!

Link do sprawdzenia wyniku: [https://3v4l.org/sODK2](https://3v4l.org/sODK2)

```php
<?php

$messages = [ 
  "a" => "use this ",
  "b" => "@ - ",
  "c" => "Don't"  
];
sort ($messages);

foreach( $messages as $key => $message){
  echo "{$key} - {$message} \n";
}

echo PHP_EOL;
```

Funkcja [**rsort\(\);**](http://php.net/manual/pl/function.rsort.php) - Działanie takie samo co do powyższego, jednakże elementy zostają posortowane w kolejności odwrotnej.

Link do sprawdzenia wyniku: [https://3v4l.org/a1gAb](https://3v4l.org/a1gAb)

```php
<?php

$messages = [ 
  "a" => "use this ",
  "b" => "@ - ",
  "c" => "Don't"  
];
rsort ($messages);

foreach( $messages as $key => $message){
  echo "{$key} - {$message} \n";
}

echo PHP_EOL;
```

---

_**Poniżej tabelk, która przedstawia atrybuty poszczególnych funkcji sortujących.**_

[![](http://i.imgur.com/Wc3xnGo.png)](http://php.net/manual/en/array.sorting.php)

Po takim krótkim wstępie odnośnie sortowania \( zakładam, że zajrzałeś do manuala \) pora wykorzystać to w praktyce.

Na celownik bierzemy sobie funkcję:

* [asort\(\);](http://php.net/manual/en/function.asort.php)
* [uasort\(\);](http://php.net/manual/en/function.uasort.php)

# Praktyka

Zrobimy sobie kolekcje książek. Taką kolekcję posortujemy i odpowiednio wyświetlimy. Aby wszystko wyglądądało przejrzyście dorzucę screenshoty z procesu debugowania aplikacji. Zgadza się! Koniec z **var\_dump\(\)**, **print\_r\(\)**!

_Proszę kliknąć na zdjęcia, jeżeli nic nie widać!_

Krok 1: Odpalamy nasze IDE.

[![](http://i.imgur.com/QvJqsda.png)](http://i.imgur.com/QvJqsda.png)

Krok 2: Piszemy klasę Book która będzie reprezentować bardzo bardzo uproszczoną książkę.

```php
<?php
namespace efiku;

class Book
{
    private $name;
    private $author;
    private $codeNumber;

    /**
     * Book constructor.
     * @param string $name
     * @param string $author
     * @param int $codeNumber
     */
    public function __construct(string $name, string $author, int $codeNumber)
    {
        $this->name = $name;
        $this->author = $author;
        $this->codeNumber = $codeNumber;
    }

    /**
     * @return string
     */
    public function getName() : string
    {
        return $this->name;
    }

    /**
     * @return string
     */
    public function getAuthor() : string
    {
        return $this->author;
    }

    /**
     * @return int
     */
    public function getCodeNumber() : int
    {
        return $this->codeNumber;
    }

    public function __toString()
    {
        return $this->name . " --- " . $this->author . " --- " . $this->codeNumber;
    }
}
```

Ta klasa przechowuje tylko przykładowe dane, wzbogacona została metodą magiczną **\_\_toString\(\)**, która pozwala wyświetlać klasy np. `echo $book` , gdzie zmienna `$book` to obiekt klasy Book. O Klasach i obiektach dowiesz się w następnej części kursu. Spokojnie;\)

Krok 3: Piszemy skrypt wykorzysujący klasę.

```php
<?php
declare(strict_types = 1);
require "../vendor/autoload.php"; // Ja używam composera, Ty musisz zrobić require swojej klasy tutaj.. ( np. "project/Book.php" )
use efiku\Book;

$arrayOfBooks = [];

// Generowanie tablicy z książkami
foreach (range(1, 20) as $number) {
    $arrayOfBooks["book.{$number}"] = new Book(
        "PHP {$number}",
        "Podręcznik profesjonalisty! wydanie:{$number}",
        mt_rand(1, $number + 1 * 3)
    );
}

// Sortujemy z użyciem wbudowanego mechanizmu
asort($arrayOfBooks);

foreach ($arrayOfBooks as $book) {
    echo $book . PHP_EOL;
}

/////////////////////////////////////////////////////

echo "\nSORTUJEMY Według Naszego mechanizmu\n\n";

uasort($arrayOfBooks, function (Book $first, Book $second) {
    $firstEditionNumber = (int)substr(strrchr($first->getAuthor(), ":"), 1);
    $secondEditionNumber = (int)substr(strrchr($second->getAuthor(), ":"), 1);
    return $firstEditionNumber <=> $secondEditionNumber;
});

foreach ($arrayOfBooks as $book) {

    echo $book . PHP_EOL;
}
```

Krok 4: Patrzymy co się dzieje.

Napisany kod jest zgodny z PHP7 i niestety, aby poszedł na starszych wersjach, będzie trzeba go przerobić.. ale nie przerabiajmy bo PHP7+ jest super!

Okej.. Zobaczmy jak wygląda nasze IDE wraz z kodem.  
Po lewej stronie gotowy skrypt, po prawej listing kodu z klasą Book.

Dodatowo w skrypcie pojawiły się break-pointy w kluczowych momentach jego działania!

[![](http://i.imgur.com/XBuZrYm.png)](http://i.imgur.com/XBuZrYm.png)

W takim razie rozpocznijmy debugowanie!

Po kliknięciu trzy razy "Step Over", widzimy co siedzi w naszej tablicy `$arrayOfBooks` oraz, że dane wprowadzane są poprawnie

[![](http://i.imgur.com/QBeDA21.png)](http://i.imgur.com/QBeDA21.png)

Pomińmy sobie to.   
Następnie chcemy się dowiedzieć jak wygląda nasza tablica po sortowaniu `asort` , jak widać nie tego chcieliśmy. Ktoś tu zaraz sobie może pomyśleć: Hej, zaraz! Przecież ta tablica była ładnie posortowana. Po co tutaj `asort`? Załóżmy, że asort to taka pani która przyszła i pomieszała nam tablicę, a My teraz musimy ją ogarnąć ;&gt;

[![](http://i.imgur.com/7p6lGIA.png)](http://i.imgur.com/7p6lGIA.png)

Teraz sprawdźmy naszą funkcję sortującą. Jak widzisz jako drugi parametr przyjmuje `Callback`. Wykorzystaliśmy tutaj [funkcję anonimową ](http://php.net/manual/en/functions.anonymous.php)\( inline function \). Dostajemy dwa elementy kolekcji. Możemy sobie rzutować je, by było ładnie widać o co się rozchodzi. Celem tutaj jest wydzielenie liczb po `:` i posortowanie odpowiednio w kolejności od najmniejszego do największego operatorem `<=>`\(spaceship operator\)

[![](http://i.imgur.com/GgxbG38.png)](http://i.imgur.com/GgxbG38.png)

# Zadania

1. Utwórz tablicę w której będziesz przechowywał jakieś elementy \(ilość około 150\), następnie wyświetl je za pomocą odpowiedniej pętli. \( Jaką pętle tutaj zastosujesz? Co się stanie gdy odwołasz się do nieistniejącego indeksu? \)
2. Utwórz tablicę asocjacyjną z kolekcją płyt. Każda płyta powinna mieć: numer, nazwę, datęUtworzenia, Posortuj taką kolekcję od najnowszej płyty do najstarszej.
3. \[**Zaawansowane**\] Utwórz klasę o nazwię kontener i zaimplementuj interfejs ArrayAccess i Countable.
   * 3.1 Odwołaj się do nieistniejącego indeksu za pomocą \[\] lub offsetGet.
   * 3.2 Zmodyfikuj tak, aby można było dodawać do kolekcji tylko elementy implementujące stworzony przez Ciebie interfejs
   * 3.4 Sprawdź czy możesz policzyć elementy. np. count\( tablica \)
   * 3.5 Przygotuj odpowiednie testy.



