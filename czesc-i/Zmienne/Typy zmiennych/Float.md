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
