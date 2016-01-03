# Zmienne 

W PHP zmienne można rozpoznać bardzo łatwo, ponieważ zaczynają się one od znaku dolara. Należy zawsze o tym pamiętać, ponieważ zapominanie **$** przed nazwą zmiennej jest częstym błędem początkujących deweloperów. 

**Przykłady definicji zmiennych**

```php
    $customerAge;
    $_POST['price'];
```

##  Co może być nazwą zmiennych w PHP? 
* Może to być dowolnej długości ciąg znaków alfanumerycznych: A-Z, a-z, 0-9
* Nazwa zmiennej może zawierać w sobie znak "_"

Jednak są rzeczy na które trzeba zwrócić uwagę. Nazwa zmiennej **Nie może** zaczynać się od cyfry. 

## Co nie powinno być nazwą zmiennych w PHP?
W większości języków programowania istnieje coś takiego jak słowa kluczowe _(ang. keywords)_. Są to takie wyrazy, których nie można używać w nazwie zmiennej. Powodem tego jest to, że te wyrazy, które można zobaczyć poniżej są zarezerwowane dla samego języka PHP. 
![Słowa kluczowe w PHP](https://cdn.pbrd.co/images/1iF6MHTm.png)

[Źródło: php.net](http://php.net/manual/en/reserved.keywords.php)

#  Wykorzystanie zmiennych
Już wiemy jak wyglądają zmienne i jakich zasad powinniśmy się trzymać nazywając je w programie. Ale czym tak naprawdę są zmienne? Do czego je się wykorzystuje?

Ten obrazek idealnie pokazuje zasadę działania zmiennych:
![Obrazowanie zmiennych](http://www.greenerpackage.com/sites/default/files/Recycling_predictions.jpg)

Zmienną nazwiemy takie miejsce w pamięci komputera, które jest w stanie przechować jakąś informację. W PHP jeżeli chcemy stworzyć miejsce dla przechowania wieku osoby zaglądającej na stronę, stworzymy zmienną $visitorAge. Dzięki temu, będziemy mogli dopisać do tej zmiennej interesujące nas informacje.

```php
        $visitorAge = 12;
        echo "Twój wiek to {$visitorAge} lat." . PHP_EOL;
        echo 'Twój wiek to ' . $visitorAge . ' lat.';
```

W powyższym skrypcie zastosowaliśmy operator konkatenacji. Jest to złączenie dwóch ciągów w jeden. Najczęściej ten operator (kropkę) stosuje się przy wyświetlaniu tekstu, tak, jak zrobiliśmy to wyżej. W rzeczywistości możliwości jego wykorzystania są zależne tylko od wyobraźni dewelopera. 

> **UWAGA** 
W powyższym przykładzie trzeba zwrócić szczególną uwagę na to, w jaki sposób powinno się dopisywać zmienne w wyjściowym łańcuchu tekstowym. 
Jeżeli zapisalibyśmy _**echo '$visitorAge lat.'**_, to dostalibyśmy w wyniku taki ciąg znaków: $visitorAge lat.

Kluczem są użyte apostrofy, które mają również znaczenie dla wydajności tworzonego przez nas oprogramowania. Kiedy zastosujemy znaki podwójnego cudzysłowu " ", to interpreter najpierw przeszuka dany ciąg w celu odnalezienia potencjalnych zmiennych, które mógłby zastąpić przed wyświetleniem na ekranie. 
Kiedy użyjemy znaków pojedynczego cudzysłowu (zapisywany jako apostrofy) ' ' to interpreter uzna wszystko to, co jest tam wpisane za tekst. Nie wykona wtedy sprawdzenia czy w środku znajduje się zmienna. 

Ten mechanizm nazywamy **interpolacją zmiennych** i polega on na zastępowaniu zmiennych ich wartościami.
