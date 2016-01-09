## Object
Jako, iż PHP jest jezykiem obiektowym posiada wbudowany typ obiektowy `Object	`. Aby stworzyć nowy obiekt należy użyć operatora `new` do utworzenia nowej instancji tegoż obiektu. Jest to bardzo proste, spójrz:
```php
<?php

class Person
{
	private $age = 18;

    public function showAge()
    {
        echo "Mam {$this->age} lat.";
    }
}

$matureBoy = new Person;
$matureBoy->showAge();
```

Oczywiście programowanie oparte na obiektach to ogromny dział, dlatego w swoim kursie poświęciliśmy na ten temat osobną część. Dowiesz się w niej dużo więcej szczegółów i poznasz zasady, które rządzą w dobrym projektowaniu kodu.
