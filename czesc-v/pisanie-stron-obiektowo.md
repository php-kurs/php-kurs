Chcąc zacząć pisać strony w stylu obiektowym musisz przede wszystkim zmienić podejście co do PHP. Pierwszą wskazówką będzie informacja, że teraz już rzadko kto pisze w czystym PHP. Dlatego wiele projektów spotkasz z różnymi frameworkami lub ich komponentami. Chodzi generalnie o to, że po co pisać coś na nowo, jak to co chcemy już jest i ma świetną społeczność, która pracuje nad jego rozwojem.



1. Zanim zabierzemy się za cokolwiek warto zaopatrzyć się w książkę oraz dodać do zakładek ten blog:

 [![Czysty Kod](http://s.helion.pl/okladki/125x163/czykov.jpg)](http://forum.miroslawzelent.pl/95526/pisanie-stron-obiektowo?state=edit-96095) 
 
 [![Blog Boba](http://blog.cleancoder.com/assets/clean_code_72_color.png)](http://blog.cleancoder.com/)

2. Na pierwszym miejscu będą wzorce, posłużę się najlepszym linkiem odnośnie implementacji większości wzorców w PHP. Powinieneś sobie je przestudiować i zobaczyć do czego możesz je wykorzystać. Naaprawdę przydatne :)

[![Wzorce](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2015/02/1423062384Octocat.png)](https://github.com/domnikl/DesignPatternsPHP)

3. Musisz wiedzieć jak działa protokół HTTP. To jest absolutna podstawa!! Co się dzieje jak przychodzi Request i co zwracać w Response. Musisz zrozumieć, że tyle czasu żyje Twój skrypt. Od Requestu do Response.  

Wiedząc to, będziesz w stanie bez problemu użyć wzorca MVC nawet nie wiedząc o tym.. ;D  Request [/zaloguj /dodaj /blog-3331 ] -> do index.php -> sprawdzasz czy masz taki kontroler, jest? odpalasz i zwracasz response tak w skrócie. Oczywiście system szablonów pasuje też mieć ;) (twig polecam) 

Ciekawy link: 

[![HTTP REQ](https://symfony.com/doc/current/_images/http-xkcd.png)](https://symfony.com/doc/current/book/http_fundamentals.html)

4. Fajnie byłoby też poznać narzędzia takie jak behat, phpspec, phpunit i pracę nad stroną rozpoczynać od budowy  modułów. Każdy moduł poddajesz procesowi TDD. 

[![Spec](https://cms-assets.tutsplus.com/uploads/users/45/posts/20919/preview_image/phpspec-wide-retina-preview.png)](http://phpspec.readthedocs.org/en/latest/) 

[![Behat](https://camo.githubusercontent.com/d8d967f1ba57d0f7857152ff0c3ca6503deb48f4/68747470733a2f2f646c2e64726f70626f7875736572636f6e74656e742e636f6d2f752f3238323739372f62656861742f62656861742e706e67)](http://docs.behat.org/en/v2.5/)

![TDD](http://www.pathfindersolns.com/wp-content/uploads/2012/05/red-green-refactorFINAL2.png)]

5. Do pracy nad takim czymś użyj IDE, waarto PHPStorma mieć. 30 dni masz, za free, a jak legitke wyślesz to na rok ;) ot promocja dla uczniów i studentów. Darmowe to netbeans, ale jakos mi nie przypadł do gustu. 

[![Storm](https://confluence.jetbrains.com/download/attachments/49463943/PhpStorm?version=4)](https://www.jetbrains.com/phpstorm/)

6. Dzisiaj PHPersi mają do dyspozycji takie cudo jak composer, o którym prosiłem Cię byś przeczytał. Jest to must have przy projekcie :)

[![Composer](https://getcomposer.org/img/logo-composer-transparent.png)](https://getcomposer.org/)

Czy taka aplikacja dosłownie scalona z framwerokiem jest poprawna? Otóż nie. Twoja domena powinna być niezależna od frameworka. FW powinien robić za Ciebie taką robotę jak obsługa formularzy, requestów , routingu. Piszesz tylko pomost między domeną a FW i jedziesz:) Oczywiście wiadomo, praktyka wygląda inaczej. Grunt by mieć testy....



Pytasz o przykłady? Proszę bardzo: 

1. [Przykład pisania swojego Frameworka na komponentach Symfony](http://symfony.com/doc/current/create_framework/index.html) 
2. [Profesjonalny projekt w oparciu o DDD i TDD](https://github.com/norzechowicz/mydrinks)
3. [Fabien o PHP](https://www.youtube.com/watch?v=gpNbmEnRLBU)
