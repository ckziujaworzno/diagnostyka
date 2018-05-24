TEST-Diagnostyka komputera


1. Zaloguj się do komputera i uruchom konsolę

2. W katalogu użytkownika załóż katalog test

3. Wpisz polecenie:  
cd test 

4. Wpisz polecenie:  
git clone https://github.com/ckziujaworzno/diagnostyka

5.W katalogu „test”  powinien znajdować się katalog „diagnostyka” . 
W katalogu znajdują się pliki monitor.sh, diagnostyka.sh oraz README.md 
(zawiera niniejszą instrukcję). 
 Otwórz w edytorze plik diagnostyka.sh i zapisz go pod 
nawą składającą się z imię_nazwisko.sh. i przejdź do konsoli .

6. Wpisz polecenie:  

git add .
#dodaj nowe pliki do repozytorium  

git commit -m "test25_05_2018"
#zatwierdza zmiany

git push -u origin master
#zapisuje zmiany na serwerze

Aby zapisać zmiany, musisz się zalogować, dane do logowania to: 
login: ckziujaworzno
hasło: sdi13jaw

7. Wróć do edytora i uzupełnij brakujące polecenia w kodzie programu. 
Zadanie polega na sprawdzeniu parametrów komputera za pomocą odpowiednich poleceń.
Polecenia wpisz w odpowiednie miejsca w pliku imie_nazwisko.sh
Jeśli chcesz sprawdzić poprawność działania poleceń musisz zmienić uprawnienia pliku 
Poleceniem
 
chmod 777 imie_nazwisko.sh

 i uruchom  plik poleceniem
 
		./imie_nazwisko.sh  

Możesz posłużyć się rozwiązaniami które zapisano w pliku monitor.sh oraz 
wyszukać informacji  Internecie . 
Polecenia zawarte w instrukcji dla ułatwienia możesz kopiować z pliku README.md .

8. Jeśli już skończyłeś pracę zatwierdź zmiany i zapisz zmiany na serwerze wpisując polecenia:

git add .

git commit -m "test25_05_2018"

git push -u origin master

