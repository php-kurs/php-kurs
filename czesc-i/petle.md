# PĘTLE W PHP

Istnieją 4 pętle, które warto znać. Omówimy je wszystkie, a także powiemy które pętle, kiedy należy stosować. Pamiętaj, że to do Ciebie należy wybór, której pętli użyjesz w kodzie w danym momencie. Należy się dobrze zastanowić!

## FOR

```php
<?php
for( {1} ; {2} ; {3} ){
  {4}  
}
```
Pętlę for można stosować do wyświetlania różnych danych, poruszania się po nich. Np. Iterując iteratorem po pliku. Często jest spotykana do wyświetlania jednowymiarowych tablic z indeksem. Jednakże, my polecamy pętle **foreach**.
  
**Omówienie**:

* `{1}` Zmienna iteracyjna, której przypisujemy jakąś początkową wartość. **Uwaga! Wiele osób stosuje zapis $i zapominając o estetyce kodu. Skracanie zmiennych w pętlach powoduje zaciemnienie kodu!**
* `{2}` Wykonuj warunek, dopóki warunek nie zostanie spełniony.
* `{3}` Wykonuj warunek, dopóki warunek nie zostanie spełniony. W tym miejscu zwiększamy/zmniejszamy zmienną albo przypisujemy jej inną wartość.
* `{4}` Tutaj wykonujemy operacje na danych.
  
 **[Przykład](https://3v4l.org/jblAe):**
  ```php
  <?php
    $array = [ 0, 3, 1, 3, 5, 6, 7, 8, 6, 3, 1];
    $items = count($array);
    for( $index = 0; $index < $items; $index += 3){
      echo  $array[$index] ;  
    }
  
  ```
PS: Widzisz, że coś tu nie gra?
Ach te zasiegi zmiennych...
  
## While

```php
<?php
 while( {1} ) {
   {2}
 }

```
Z pętlą while spotkasz się w momencie, gdy będziesz chciał pobrać kilka rekordów z bazy. Co nie zmienia faktu, że to zależy od Ciebie, gdzie ją wykorzystasz.

**Omówienie:**
 
 * `{1}` Wykonuj pętlę, dopóki warunek nie zwróci "**false**"
 * `{2}` Operacje wewnątrz pętli.
 
 **[Przykład](https://3v4l.org/dSXMJ):**
 ```php
 <?php
  $number = 30;
  $index = 0;
  while( $index < $number ){
     echo $number-$index;
     $index+= 6;
  }
 
 ```
 
 
 
 ## DO..WHILE
 ```php
 <?php
  do{
     {1}
  } 
   while ( {2} );
 
 ```
To już najrzadziej spotykana pętla w PHP. Różnica jest taka, że warunek pętli spełniany jest na końcu. Wiec wykona się ona co najmniej raz! Trzeba uważać w tworzeniu takiej pętli.
 
**Omówienie:**

 * `{1}` Instrukcja w tej pętli wykona się zawsze co najmniej raz.
 * `{2}` Warunek sprawdzany na końcu. "Wykonuj **Instrukcja** dopóki **Prawda**" 

**[Przykład](https://3v4l.org/ULsPJ):**

```php
<?php
$zmienna = 4;
do {
    echo $zmienna;
    $zmienna++;
    echo $zmienna;
} while ($zmienna < 5);

```


## Foreach
Pętla foreach została omowiona w rozdziale o Tablicach. Jednakze jest to obecnie najlepsze wyjście jeżeli chodzi o przeglądanie tablic.
**foreach** można też wykorzystać z generatorami. W poniższym przykładzie zbudowaliśmy sobie generator liczb od 1 do 10. Oczywiście `range()` zachowuje się w dokładnie taki sam sposób.

[Prosty przykład](https://3v4l.org/QGMKZ):

```php
<?php
function gen_one_to_ten() {
    for ($i = 1; $i <= 10; $i++) {
        // Note that $i is preserved between yields.
        yield $i;
    }
}

foreach (gen_one_to_ten() as $number) {
    echo "$number\n";
}
```
**Rezultat:**
```
1
2
3
4
5
6
7
8
9
10
```

