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
