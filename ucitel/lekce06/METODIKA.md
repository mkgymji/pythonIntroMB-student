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
