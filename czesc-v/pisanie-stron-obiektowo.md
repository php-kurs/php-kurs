<h1 style="text-align: center;"> Pisanie stron obiektowo</h1>
<p></p>
<p><span style="font-size:14px">Chcąc zacząć pisać strony w stylu obiektowym musisz przede wszystkim zmienić podejście co do PHP. Pierwszą wskazówką ode mnie będzie informacja, że teraz już rzadko kto pisze w czystym PHP. Dlatego wiele projektów spotkasz z różnymi frameworkami&nbsp;lub ich komponentami. Chodzi generalnie o to, że po co pisać coś na nowo, jak to co chcemy już jest i ma świetną społeczność, która pracuje nad jego rozwojem.</span></p>

<p>&nbsp;</p>

<p><span style="font-size:14px"><strong>1. Zanim zabierzemy się za cokolwiek </strong>warto zaopatrzyć się w książkę oraz dodać do zakładek ten blog:</span></p>

<p style="text-align:center"><a href="http://helion.pl/ksiazki/czysty-kod-podrecznik-dobrego-programisty-robert-c-martin,czykov.htm" rel="nofollow"><img alt="" src="http://s.helion.pl/okladki/125x163/czykov.jpg" style="height:200px; width:153px"></a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href="http://blog.cleancoder.com/" rel="nofollow"><img alt="" src="http://blog.cleancoder.com/assets/clean_code_72_color.png" style="height:200px; width:200px"></a></p>

<p>&nbsp;</p>

<p><span style="font-size:14px"><strong>2. Na pierwszym miejscu będą wzorce</strong>, posłużę się najlepszym linkiem odnośnie implementacji większości wzorców w PHP. Powinieneś sobie je przestudiować i zobaczyć do czego możesz je wykorzystać. Naaprawdę przydatne :)</span></p>

<p style="text-align:center"><span style="font-size:14px"><a href="https://github.com/domnikl/DesignPatternsPHP" rel="nofollow"><img alt="" src="http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2015/02/1423062384Octocat.png" style="height:249px; width:300px"></a>&nbsp;</span></p>

<p style="text-align:justify">&nbsp;</p>

<p><span style="font-size:14px"><strong>3. Musisz wiedzieć jak działa protokół HTTP.</strong> To jest absolutna podstawa!!&nbsp;Co się dzieje jak przychodzi Request i co zwracać w Response. Musisz zrozumieć, że tyle czasu żyje Twój skrypt. Od Requestu do Response. &nbsp;</span></p>

<p><span style="font-size:14px">Wiedząc to, będziesz w stanie bez problemu użyć wzorca MVC nawet nie wiedząc o tym.. ;D &nbsp;Request [/zaloguj /dodaj /blog-3331 ]&nbsp;-&gt; do index.php -&gt; sprawdzasz czy masz taki kontroler, jest? odpalasz i zwracasz response tak w skrócie.&nbsp;Oczywiście system szablonów pasuje też mieć ;) (twig polecam)&nbsp;</span></p>

<p><span style="font-size:14px">Ciekawy link:&nbsp;</span></p>

<p style="text-align:justify"><span style="font-size:14px"><a href="https://symfony.com/doc/current/book/http_fundamentals.html" rel="nofollow" target="_blank"><img alt="" src="https://symfony.com/doc/current/_images/http-xkcd.png" style="height:270px; width:654px"></a></span></p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="font-size:14px"><strong>4. Fajnie byłoby też poznać narzędzia </strong>takie jak behat, phpspec, phpunit i pracę nad stroną rozpoczynać od budowy &nbsp;modułów. Każdy moduł poddajesz procesowi TDD.&nbsp;</span></p>

<p style="text-align:center"><span style="font-size:14px"><a href="http://phpspec.readthedocs.org/en/latest/" rel="nofollow"><img alt="" src="https://cms-assets.tutsplus.com/uploads/users/45/posts/20919/preview_image/phpspec-wide-retina-preview.png" style="height:139px; width:200px"></a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href="http://docs.behat.org/en/v2.5/" rel="nofollow"><img alt="" src="https://camo.githubusercontent.com/d8d967f1ba57d0f7857152ff0c3ca6503deb48f4/68747470733a2f2f646c2e64726f70626f7875736572636f6e74656e742e636f6d2f752f3238323739372f62656861742f62656861742e706e67" style="height:88px; width:200px"></a></span></p>

<p style="text-align:center">&nbsp;</p>

<p style="text-align:center"><span style="font-size:14px"><img alt="" src="http://www.pathfindersolns.com/wp-content/uploads/2012/05/red-green-refactorFINAL2.png" style="height:401px; width:407px"></span></p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="font-size:14px"><strong>5. Do pracy nad takim czymś użyj IDE,</strong> waarto PHPStorma mieć. 30 dni masz, za free, a jak legitke wyślesz to na rok ;) ot promocja dla uczniów i studentów. Darmowe to netbeans, ale jakos mi nie przypadł do gustu.&nbsp;</span></p>

<p style="text-align:center"><a href="https://www.jetbrains.com/phpstorm/" rel="nofollow" target="_blank"><img alt="" src="https://confluence.jetbrains.com/download/attachments/49463943/PhpStorm?version=4" style="height:400px; width:400px"></a>&nbsp;</p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="font-size:14px"><strong>6.</strong> <strong>Dzisiaj PHPersi mają do dyspozycji takie cudo jak composer,</strong> o którym prosiłem Cię byś przeczytał. Jest to must have przy projekcie&nbsp;:)</span></p>

<p style="text-align:center"><span style="font-size:14px"><a href="https://getcomposer.org/" rel="nofollow" target="_blank"><img alt="" src="https://getcomposer.org/img/logo-composer-transparent.png" style="height:356px; width:290px"></a></span></p>

<p style="text-align:justify"><span style="font-size:14px">Czy taka aplikacja dosłownie scalona z framwerokiem jest poprawna? Otóż nie. Twoja domena powinna być niezależna od frameworka. FW powinien robić za Ciebie taką robotę jak obsługa formularzy, requestów , routingu. Piszesz tylko pomost między domeną a FW i jedziesz:) Oczywiście wiadomo, praktyka wygląda inaczej. Grunt by mieć testy :D</span></p>

<p style="text-align:justify">&nbsp;</p>

<hr>
<p style="text-align:justify"><strong><span style="font-size:14px">Pytasz o przykłady? Proszę bardzo:&nbsp;</span></strong></p>

<ul>
	<li style="text-align:justify"><span style="font-size:14px">1.&nbsp;http://symfony.com/doc/current/create_framework/index.html &nbsp; | Pokazane jest to w sumie o co pytasz..</span></li>
	<li style="text-align:justify"><span style="font-size:14px">2.&nbsp;https://github.com/norzechowicz/mydrinks | Tu masz do analizy na długie zimowe wieczory projekt w oparciu o DDD</span></li>
	<li style="text-align:justify"><span style="font-size:14px">3.&nbsp;https://www.youtube.com/watch?v=gpNbmEnRLBU &nbsp;( WARTO POSŁUCHAĆ&nbsp;)</span></li>
</ul>
