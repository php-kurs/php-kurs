# Ogólnie o tablicach

**Tablice w PHP odgrywają bardzo ważną rolę dlatego proszę, przeczytaj ten temat bardzo uważnie!**  
*Abyś łatwiej zrozumiał działanie tablic postaramy się pokazać to na realnych przykładach.*

**Czym są tablice?**

Najprościej mówiąc, tablica to taki pojemnik na dane, które mogą być różnego typu, a więc tablice to typ złożony.

Tablice, w których dane są tego samego typu nazywamy **kolekcją**.  

**Przykładowo:**  

Mamy w garażu 20 aut różnej marki, ale każde z nich ma przypisany numerek.  
Garaż to nasza tablica, numery to indeksy, a auta to wartości pod konkretnym indeksem.  
Możemy śmiało powiedzieć, że nasz garaż przechowuje kolekcję aut.  

**W PHP dysponujemy dwoma rodzajami tablic** 

Tablice które posiadają indeks:
```php

<?php
  $beer = [
   'Perła'
   2.50,
   'dobra!'
  ];
```
 
Asocjacyjne tablice z kluczami.
  
```php

<?php  
  $beer = [
   "name" => 'Perła',
   "cost" => 2.5,
   "currency" => 'PLN'
   "description" => 'Najlepsze piwo dla programistów PHP'
  ];
  
```  

___

Czasami dochodzimy do momentu w którym tablice posiadające jeden wymiar już nam nie wystarczają.
Wtedy zastanawiamy się, czy istnieje jakiś sposób, aby dodać jeden wymiar więcej.

Wyobraź sobie, że posiadasz kilka garaży, każdy garaż przechowuję kolekcję aut.  
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
* 2 : To numer parkingu na którym stoi nasze auto.

# Operacje na elementach

Tablice w PHP deklarujemy w następujący sposób:

```php

<?php
$beer = []; 
  
```

Nazwa zmiennej wskazuje, że będziemy w niej przechowywać informacje o konkretnym piwie.

> **UWAGA!** Możesz spotkać się z zapisem **array()**, ale odchodzi się już od tego zapisu na rzecz [].

Możemy już w momencie deklarowania tablicy określić, jakie będzie miała elementy;
 
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
>**Numeracja elementów tablicy zaczyna się od zera!!**   
>Początkujący programiści często zapominają o numeracji indeksów w tablicy i przekraczają zakres. 


Dodawanie elementów do tablicy zazwyczaj odbywa się na dwa sposoby.


- Za pomocą funkcji array_push
 
[array_push](http://php.net/manual/en/function.array-push.php) - to funkcja która dodaje jakiś element do tablicy
  
**Przykład:**  

```php

<?php
//..
array_push($beer, 'efik');
print_r($beer) # array(4) { 'Perla', 2.50 , 'ID301049102' , 'efik' }
  
```

- Poprzez przypisanie

**Przykład:**  

```php
  
<?php
$beer[] = 'efik';
   
```

Skrypt zwróci dokładnie to samo co wyżej. 
Zwróć uwagę, że nie podaliśmy numeru indeksu, co daje do zrozumienia interpreterowi, aby potraktował to jako dodanie elementu
do istniejącej już kolekcji.

Dodawanie elementów do tablicy asocjacyjnej wygląda nieco inaczej.  
Zamiast pustych nawiasów kwadratowych musimy podać nową nazwę klucza, do którego chcemy coś wpisać. 
( Podając już istniejącą nazwę klucza nadpiszemy wartość która się pod nim znajduje )

```php

<?php  
  $beer = [
   "name" => 'Perła',
   "cost" => 2.5,
   "currency" => 'PLN'
   "description" => 'Najlepsze piwo dla programistów PHP'
  ];
 
  $beer["hello"] = "world";

```

- A co w sytuacji, gdy chcemy połączyć dwie tablice ze sobą?

Do połączenia dwóch tablic potrzebna będzie funkcja [**array_merge**](http://php.net/manual/en/function.array-merge.php).  
Poniżej przykład, w którym łączymy dwie zupełnie różne tablice od siebie w jedną, nową.

```php

<?php
$array1 = ["color" => "red"];
$array2 = ["name" => "event15", "voice" => 0];
$result = array_merge($array1, $array2);
print_r($result);
```

W Usuwaniu elementów tablicy pomaga funkcja [unset\(\)](http://php.net/manual/en/function.unset.php)  


**Przykład:**

```php

<?php
unset($beer[2]);
print_r($beer); # array(3) { 'Perla', 2.5 , 'efik' }

```
Więcej informacji na temat funkcji służących do operowania na tablicach można znaleźć w oficjalnej dokumentacji PHP: 
 
 - [http://php.net/manual/en/ref.array.php](http://php.net/manual/en/ref.array.php)


# Przeglądanie tablic

Jeżeli operujesz na tablicach w PHP, to nie obejdziesz się bez ich przeglądania.
Do takiego przeglądania używamy pętli **foreach** ponieważ jest ona bardzo wygodna w użyciu i daje ogromne możliwości.
Dla pokazania różnicy pomiędzy pętlami **for**, a **foreach** przygotujemy prosty przykład.

Wyobraź sobie, że masz system, który generuje Ci tablicę nieznanej długości. To co w niej się znajduję nie jest istotne.
Jak myślisz, która opcja będzie bezpieczniejsza i wydajniejsza?

```php

 <?php
  $usersCollection = $system->get('user.repository')->getAllUsers();
  
  // Opcja 1:
  
   for( $index = 0; $index < count($usersCollection); $index++){
     echo $UsersCollection[$index]["name"] . PHP_EOL;
   }
   
  // Opcja 2:
   
   foreach( $usersCollection as $userName) {
     echo $userName["name"] . PHP_EOL;
   }
   
```

Przeanalizujmy powyższy przykład.  

- **Opcja 1** 

Są miejsca w których pętle **for** mają dobre zastosowanie, aczkolwiek nie w przypadku tablic. 
Za każdym obiegiem pętli obliczana jest ilość elementów które są przechowywane. 
Dodatkowo niepotrzebny nam jest tutaj indeks tablicy. Po co on jest, skoro poruszamy się po kolekcji użytkowników?  
Dochodzi także niebezpieczeństwo przekroczenia zakresu !!

- [count\(\)](http://php.net/manual/en/function.count.php) - Obliczanie ilości elementów w tablicy.



- **Opcja 2**

Tutaj już jest dużo bezpieczniej. Nie jesteśmy narażeni na przekroczenie indeksu tablicy. Nie interesuje nas indeks, otrzymujemy
tablicę z konkretnym użytkownikiem i wyświetlamy jego imię.

Zapewne już widzisz, że pętla foreach jest bezpieczniejsza i lepsza ? W takim razie wyjaśnijmy jej działanie:

Pętla foreach służy do przeglądania tablic z indeksem , a także asocjacyjnych.

___

**Ogólna konstrukcja pętli:**

```php
<?php
   
   foreach ( $array as $key => $value ) {
      
       // DO something with value o key.
   
   }
 
```

Tłumaczymy ją tak:

**Dla każdego** elementu w tablicy `$array` , pobierz jego klucz `$key` i wartość `$value` na którą wskazuję.  
**Wykonaj** jakąś operację .  
**Powtarzaj dopóki** nie napotkasz ostatniego elementu w tablicy `$array`. 
`
# Sortowanie tablic 

