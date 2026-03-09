# Metodika — Lekce 06: Čísla a senzory

## Cíle lekce

Po lekci student:
- rozlišuje typ `int` a `float`
- používá operátory `/`, `//`, `%`
- používá `round()` a `abs()`
- čte teplotu pomocí `temperature()`
- čte náklon pomocí `accelerometer.get_x()` a `accelerometer.get_y()`
- zobrazí naměřenou hodnotu jako řetězec na displeji

## Časová dotace

~45 minut (1 vyučovací hodina)

## Průběh hodiny

### Výklad (12 min)
Prezentace — klíčové body:
1. `int` vs `float` — dvě různé reprezentace čísel; dělení `/` vždy vrátí `float`
2. `//` (celé dělení) a `%` (zbytek) — kdy je použít
3. `round(x)` a `abs(x)` — zaokrouhlení a absolutní hodnota
4. `temperature()` — vestavěný teploměr, vrací `int`
5. `accelerometer.get_x()` — rozsah −1024 až 1024, nula = vodorovně

### Samostatná práce (28 min)
Studenti pracují na pracovním listu.

### Závěr (5 min)
Ukázka rozšíření: podmínka nad teplotou — micro:bit „ví", jestli je horko nebo zima.

## Tipy

- `temperature()` vrací `int`, nikoli `float`. Přesnost ±2–3 °C (měří teplotu čipu).
- `accelerometer.get_x()` rozsah −1024 až 1024; hodnota ≈ 0 při vodorovné poloze.
- Zobrazení `float` na displeji: nejdřív `round()`, pak `str()`.
- Operátor `%` — studenti ho neznají ze školy; stačí vysvětlit jako „zbytek po dělení".
- Pokud micro:bit nezobrazuje teplotu správně, je to normální — měří čip, ne vzduch.

## Vzorová řešení

### Úkol 1 — teploměr
```python
from microbit import *

while True:
    temp = temperature()
    display.scroll(str(temp) + "C")
    sleep(3000)
```

### Úkol 2 — inklinometr
```python
from microbit import *

while True:
    x = accelerometer.get_x()
    if x > 200:
        display.show(Image.ARROW_E)
    elif x < -200:
        display.show(Image.ARROW_W)
    else:
        display.show(Image.DIAMOND_SMALL)
    sleep(100)
```

### Úkol 3 — vlastní senzorový program (teploměr s obrázky)
```python
from microbit import *

while True:
    temp = temperature()
    if temp > 27:
        display.show(Image.HAPPY)
    elif temp < 18:
        display.show(Image.SAD)
    else:
        display.show(Image.MEH)
    sleep(2000)
```

### Bonus — Digitální vodováha (hotový kód je v pracovním listu)

Kód je celý v pracovním listu. Klíčové koncepty pro diskusi:
- `abs(x) < 150 and abs(y) < 150` — pásmo „rovně" kolem nuly
- `abs(x) > abs(y)` — dominantní osa určuje, která šipka se zobrazí
- Bez `abs()` by porovnávání záporných hodnot dávalo špatné výsledky

### Bonus — Kompas 8 světových stran

```python
from microbit import *

PRAH = 300

while True:
    x = accelerometer.get_x()
    y = accelerometer.get_y()

    vpravo = x >  PRAH
    vlevo  = x < -PRAH
    dolu   = y >  PRAH
    nahoru = y < -PRAH

    if vpravo and dolu:
        display.show(Image.ARROW_SE)
    elif vpravo and nahoru:
        display.show(Image.ARROW_NE)
    elif vlevo and dolu:
        display.show(Image.ARROW_SW)
    elif vlevo and nahoru:
        display.show(Image.ARROW_NW)
    elif vpravo:
        display.show(Image.ARROW_E)
    elif vlevo:
        display.show(Image.ARROW_W)
    elif dolu:
        display.show(Image.ARROW_S)
    elif nahoru:
        display.show(Image.ARROW_N)
    else:
        display.show(Image.DIAMOND_SMALL)
    sleep(100)
```

**Odpovědi na otázky:**
1. Diagonály musí být výš, protože `elif` vyhodnotí první pravdivou větev. `vpravo and dolu`
   je speciálnější případ než samotné `vpravo` — pokud by `elif vpravo` bylo dřív, diagonála
   by se nikdy nezobrazila.
2. `PRAH = 150` → velmi citlivé, tečka „skáče". `PRAH = 600` → tupé, reaguje jen na výrazný
   náklon. Obvykle 250–350 dává nejpřirozenější chování.

**Vzor pro diskusi:** booleovské proměnné (`vpravo = x > PRAH`) místo přímého `if x > PRAH`
je čitelnější a zabraňuje duplikaci výrazu — dobrý návyk pro složitější podmínky.
