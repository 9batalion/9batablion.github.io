# AquaCulture Manager Mobile v2 — Magazyn → Produkcja

Ta wersja zmienia model ewidencji: magazyn jest jedynym źródłem prawdy o ilościach.

## Bezpieczna aktualizacja z poprzedniej wersji

Jeżeli aplikacja jest już opublikowana pod tym samym adresem GitHub Pages, zastąp pliki `index.html`, `sw.js`, `manifest.webmanifest` i folder `icons/` plikami z tego pakietu.

**Nie zmieniaj adresu strony/repozytorium**, jeżeli chcesz zachować lokalne IndexedDB na iPhonie. Nazwa bazy pozostaje `AquaCultureManagerLAB`. Aktualizacja podnosi tylko wersję schematu i dodaje magazyn operacji `productionRuns`; istniejące stores nie są usuwane.

Przed aktualizacją wykonaj w aplikacji pełny backup JSON.

## Nowy model

- Magazyn: kultura żywa, surowce, opakowania, produkty gotowe.
- Produkcja: przyjęcie kultury startowej, namnażanie, rozdzielenie, rozlew/pakowanie.
- Każda operacja tworzy ruchy magazynowe.
- Ilości istniejącej pozycji nie edytuje się ręcznie; służy do tego ruch/korekta albo produkcja.
- Stare rekordy `cultures` i `harvests` pozostają w bazie i backupie dla zgodności.
- Aktywne kultury v4 są jednorazowo kopiowane do centralnego magazynu tylko wtedy, gdy nie ma już odpowiadającej pozycji.
- Istniejące stany magazynowe są uzgadniane dodatnim/ujemnym ruchem migracyjnym bez zmiany ich ilości.

## Instalacja PWA na iPhone

Hostuj cały katalog przez HTTPS, otwórz stronę w Safari i wybierz Udostępnij → Dodaj do ekranu początkowego.
