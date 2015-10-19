# Ogólnie o tablicach

**Tablice w PHP odgrywają bardzo ważną rolę dlatego proszę, przeczytaj uważnie ten temat!**  
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
 
Tablice z kluczami, asocjacyjne.
  
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

Czasami dochodzimy do momentu w którym tablice posiadające jeden wymiar nam już nie wystarczą.
Wtedy zastanawiamy się, czy istnieje jakiś sposób, aby dodać jeden wymiar więcej.

Wyobraź sobie, że posiadasz kilka garaży, każdy garaż przechowuję kolekcję aut.  
Chcąc się odwołać do konkretnego auta, musisz określić w jakim garażu to auto się znajduję. 

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

> **UWAGA!** Możesz spotkać się z zapisem **array()** ale jest on już nieużywany.

Możemy już w momencie deklarowania tablicy, określić jakie będzie miała elementy;
 
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
>Często początkujący programiści zapominają o numeracji indeksów w tablicy i przekraczają zakres. 


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
Zamiast pustych nawiasów kwadratowych, musimy podać nową nazwę klucza, do którego chcemy coś wpisać. 
( Podając już istniejącą nazwę klucza , nadpiszemy wartość która się pod nim znajduje )

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


# Sortowanie tablic 

