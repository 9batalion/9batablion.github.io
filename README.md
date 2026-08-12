# AquaCulture Manager v6 Ultimate

Wersja v6 scala cały plan rozwoju 5.1–6.

## Nowe moduły

- Panel zbiornika jak panel urządzenia: gotowość, ostatnia kontrola, zdjęcie, szybkie operacje.
- Inteligentny magazyn: rezerwacje, wolny stan, FEFO i inwentaryzacja przez ruchy korekcyjne.
- Kalkulator „Chcę wyprodukować…” z materiałami, brakami i terminem.
- Kalendarz produkcji.
- Szablony produkcji.
- AquaFlow 2.0 z pochodzeniem i partiami potomnymi.
- Incydenty / skażenia i kwarantanna bez zmiany ilości.
- Uproszczona kontrola jakości.
- Analiza wydajności.
- Produkcja wynikająca z otwartych zamówień.
- Zakupy i sugestie zapasów.
- Opcjonalna synchronizacja urządzeń z kontrolą rewizji.

## Bezpieczeństwo aktualizacji

IndexedDB nadal nazywa się `AquaCultureManagerLAB`. Schemat rośnie **6 → 7** wyłącznie przez dodanie czterech store'ów:

- `productionTemplates`
- `inventoryReservations`
- `purchaseOrders`
- `incidents`

Migracja v7 nie zmienia `inventory.qty`, nie kasuje istniejących produktów i nie przelicza starych ruchów.

Przed podmianą plików na GitHub Pages wykonaj pełny backup JSON. Podmień cały pakiet: `index.html`, `sw.js`, `manifest.webmanifest`, `icons/`.

## Synchronizacja

Synchronizacja jest opcjonalna. Bez konfiguracji aplikacja pozostaje offline-first. Folder `sync-server/` zawiera referencyjny backend. Nie publikuj sekretu synchronizacji w repozytorium.
