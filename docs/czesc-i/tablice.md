# Ogólnie o tablicach

**Tablice w PHP odgrywają bardzo ważną rolę dlatego proszę, przeczytaj uważnie ten temat!**  
*Abyś łatwiej zrozumiał działanie tablic postaramy się pokazać to na realnych przykładach.*

Czym są tablice?

Najprościej mówiąc, tablica to taki pojemnik na dane które mogą być różnego typu, a więc tablice to typ złożony.

Tablice w których dane są tego samego typu nazywamy **kolekcją**.  
Przykładowo: 

Mamy w garażu 20 aut różnej marki, ale każde z nich ma przypisany numerek.  
Garaż to nasza tablica, numery to indeksy, a auta to wartości pod konkretnym indeksem.  
Możemy śmiało powiedzieć, że nasz garaż przechowuje kolekcję aut.  


**W PHP mamy dwie wersje tablic.**


Tablice które posiadają indeks:
 
**Numeracja elementów tablicy zaczyna się od zera!!** 

>Często początkujący programiści zapominają o numeracji indeksów w tablicy i przekraczają zakres 

 
 a także tablice z kluczami: Asocjacyjne.

**Tutaj częstym błędem jest odwoływanie się do nieistniejącego klucza**

Czasami dochodzimy do momentu w którym tablice posiadające jeden wymiar nam już nie wystarczą.
Wtedy zastanawiamy się, czy istnieje jakiś sposób, aby dodać jeden wymiar więcej.

Wyobraź sobie, że posiadasz kilka garaży, każdy garaż przechowuję kolekcję aut.  
Chcąc się odwołać do konkretnego auta, musisz określić w jakim garażu to auto się znajduję. 

` Garaze[3][2] // Ferrari`

* 3 : To numer konkretnego garażu
* 2 : To numer parkingu na którym stoi nasze auto.

# Tablice z indeksem

Deklarujemy ją w następujący sposób.

```php

<?php
$beer = [];
  
```
W ten oto sposób zadeklarowaliśmy pustą tablicę. 

Nazwa zmiennej wskazuje, że będziemy w niej przechowywać informacje o konkretnym piwie.

### Operacje na elementach
Możemy już w momencie deklarowania tablicy, określić jakie będzie miała elementy;
 
```php

<?php
$beer = [ 'Perła', 2.50, 'ID301049102' ] ;

```

Wiedząc, że mamy do czynienia z tablicą z indeksem, możemy się teraz np. odwołać do indeksu `1` . 
 
```php

<?php
//...
echo $beer[1]; # 2.50
 
``` 

Zapytasz pewnie, jak dodawać jakiś element do takiej tablicy? 
To nic trudnego. Są dwa sposoby aby dodać jakiś element. 

1. [array_push](http://php.net/manual/en/function.array-push.php) - to funkcja która dodaje jakiś element do tablicy
  Przykład:
```php

<?php
//..
array_push($beer, 'efik');
print_r($beer) # array(4) { 'Perla', 2.50 , 'ID301049102' , 'efik' }
  
```
  
2. poprzez przypisanie
  Przykład:
```php
  
<?php
$beer[] = 'efik';
   
```
 Skrypt zwróci dokładnie to samo co wyżej. 
 

W Usuwaniu elementów tablicy pomaga funkcja [unset\(\)](http://php.net/manual/en/function.unset.php)
 Przykład:

```php

<?php
unset($beer[2]);
print_r($beer); # array(3) { 'Perla', 2.5 , 'efik' }

```
 
# Tablice asocjacyjne


# Przeglądanie tablic


# Sortowanie tablic 

