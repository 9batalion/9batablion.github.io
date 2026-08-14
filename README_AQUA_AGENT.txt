AQUACULTURE MANAGER v10.1 - AQUA AGENT (READ ONLY)
====================================================

CO TO JEST
Aqua Agent to opcjonalny mini-agent AI zintegrowany z AquaCulture Manager.
Agent moze odpowiadac na pytania o aktualny magazyn, partie, produkcje,
koszty, sprzedaz i elementy wymagajace uwagi.

BEZPIECZENSTWO DANYCH
- Klucz OpenAI API NIE jest zapisany w pliku HTML.
- Klucz jest czytany tylko przez lokalny agent-server.mjs ze zmiennej OPENAI_API_KEY.
- Agent v10.1 ma wylacznie narzedzia ODCZYTU. Nie zmienia stanow magazynowych.
- Do API wysylane jest pytanie oraz tylko dane zwrocone przez narzedzia, ktorych model zażąda.
- Zapytania Responses API sa wysylane z store:false.

WYMAGANIA
- Windows 10/11
- Node.js 18 lub nowszy (zalecany Node.js 20/22+)
- Internet tylko do korzystania z OpenAI API
- Klucz OpenAI API z aktywnym rozliczeniem API

URUCHOMIENIE
1. Rozpakuj ZIP do jednego folderu.
2. Uruchom SET_API_KEY.bat i wklej klucz OpenAI API.
3. Zamknij okno konfiguracji.
4. Uruchom START_AQUA_AGENT.bat.
5. Aplikacja otworzy sie pod http://127.0.0.1:8787/
6. Wejdz: Wiecej -> Aqua Agent.

PORTABLE NODE
START_AQUA_AGENT.bat najpierw szuka pliku:
  node\node.exe
Dzieki temu mozesz w przyszlosci wlozyc portable Node do folderu node
bez zmiany skryptow. Jesli go nie ma, skrypt uzywa systemowego node.exe.

MODEL
Domyslnie: gpt-5.6-luna
Mozesz ustawic inny model przed startem poprzez zmienna OPENAI_MODEL.
Przyklad w CMD:
  set OPENAI_MODEL=gpt-5.6-terra
  START_AQUA_AGENT.bat

PORT
Domyslnie 8787. Mozna zmienic przez AQUA_AGENT_PORT.

TRYB BEZ AI
Jesli serwer lub API jest niedostepne, zakladka Aqua Agent ma prosty lokalny
fallback do najczestszych pytan o magazyn, Nanno, F/2, widlonogi, koszty,
sprzedaz i alerty.

=== v10.1 - NATIVE PDF A4 ===
BioPrint Studio ma teraz osobny przycisk "Generuj PDF A4".
Generator tworzy rzeczywisty dokument PDF o rozmiarze 210 x 297 mm i NIE korzysta z paginacji Safari/iPhone.
Dzieki temu dolny rzad etykiet nie jest przenoszony na kolejna strone, a PDF nie zawiera adresu strony, daty ani numeru strony dodawanych przez przegladarke.
Domyslna jakosc: 300 DPI; w razie ograniczenia pamieci generator automatycznie probuje 240 DPI.
"Podglad HTML A4" pozostaje tylko do szybkiej kontroli wygladu.
Do finalnego druku uzywaj pliku z przycisku "Generuj PDF A4".

=== v10.2 iOS Safe PDF ===
Naprawa dla Safari/iPhone: błąd "The operation is insecure" podczas generowania PDF.
Generator PDF nie używa już SVG foreignObject do rasteryzacji etykiet.
Etykiety PDF są rysowane bezpośrednio na czystym Canvas 2D, QR jest rysowany modułami,
a ilustracje są pobierane z osadzonych w aplikacji danych PNG.
Format końcowy PDF pozostaje A4 210 x 297 mm.
