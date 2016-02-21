# Instrukcje sterujące

W chwili obecnej nasz kod wykonywany jest po kolei, z góry na dół, linijka po linijce. Nie można nadać temu żadnego specjalnego biegu, nie można o niczym podczas wykonywania zadecydować. Czas więc to zmienić i poznać bardzo przydatne w programowaniu instrukcje sterujące, które, jak sama nazwa wskazuje, słuzą do sterowania przebiegiem działania aplikacji. Dzięki nim bez problemu wykonamy dany fragment kodu tylko gdy zajdzie odpowiednia akcja, wyświetlimy komunikat tylko gdy wystąpi błąd... Przykładów użycia można by tutaj podawać w tysiącach.

## `true` i `false`

Podstawą instrukcji sterujących i podejmowania decyzji jest prawda (`true`) i fałsz (`false`). Na podstawie tego czy dane wyrażenie jest prawdziwe czy fałszywe możemy łatwo podejmować kolejne decyzje w naszym programie przy użyciu instrukcji sterujących.

### Wyrażenia logiczne

Bardzo często do podjęcia decyzji używane są różne wyrażenia logiczne. Są to wyrażenia, które po prostu zwracają logiczną prawdę lub fałsz. Najprostszym możliwym przykładem będzie matematyczna nierówność: `20 > 10`. Jest oczywistym, że 20 jest większe od 10 (i tak będzie zawsze), więc to wyrażenie jest prawdziwe (`true`). Co się stanie, jeśli odwrócimy liczby? Powstanie nierówność: `10 > 20` i tutaj sprawa jest równie oczywista - 10 nie jest większe od 20 więc jest to fałsz (`false`).

Podobne wyrażenia logiczne możemy tworzyć wykorzystując zmienne czy funkcje w naszej aplikacji. Załóżmy, że mamy zmienną `$age`, w której przechowywany jest wiek użytkownika, a my chcemy wyświetlić stronę tylko dla użytkowników pełnoletnich. Przygotowujemy więc proste wyrażenie logiczne `$age >= 18`. Jeśli zwróci ono `true` jasne jest, że użytkownik jest pełnoletni (ma 18 lub więcej lat), a jeśli `false` to ma mniej niż 18 lat.