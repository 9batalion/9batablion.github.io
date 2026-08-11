# AquaCulture Manager Mobile — PWA

Pakiet jest gotowy do hostowania jako Progressive Web App.

## Instalacja na iPhone

1. Umieść cały folder na hostingu HTTPS (np. GitHub Pages, Cloudflare Pages, Netlify albo własny serwer HTTPS).
2. Otwórz adres aplikacji w Safari na iPhonie.
3. Stuknij przycisk Udostępnij.
4. Wybierz „Dodaj do ekranu początkowego”.
5. Jeżeli iOS pokaże opcję otwierania jako aplikacja internetowa, pozostaw ją włączoną.

Po instalacji AquaCulture pojawi się jako osobna ikona na ekranie głównym.

## Tryb offline

Po pierwszym prawidłowym załadowaniu przez HTTPS Service Worker zapisuje powłokę aplikacji w pamięci podręcznej.
Dane użytkownika i zdjęcia są przechowywane lokalnie w IndexedDB.

## Ważne

- Nie otwieraj `index.html` bezpośrednio jako `file://` — Service Worker wymaga bezpiecznego originu.
- Dla iPhone'a używaj HTTPS.
- Regularnie wykonuj pełny backup JSON z modułu „Baza / kopie”.
- Dane z desktopowej wersji można przenieść przez pełny eksport/import JSON.

## Pliki

- `index.html` — aplikacja
- `manifest.webmanifest` — konfiguracja PWA
- `sw.js` — tryb offline
- `icons/` — ikony iOS/PWA
