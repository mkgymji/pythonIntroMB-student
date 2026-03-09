# Metodika — Lekce 08: Funkce

## Cíle lekce

Po lekci student:
- definuje vlastní funkci pomocí `def`
- rozlišuje parametry a argumenty
- používá `return` pro návratovou hodnotu
- volá vlastní funkci z hlavního programu
- refaktoruje existující kód pomocí funkcí (DRY princip)

## Časová dotace

~45 minut (1 vyučovací hodina)

## Průběh hodiny

### Výklad (12 min)
Prezentace — klíčové body:
1. Proč funkce? — opakující se kód → DRY (Don't Repeat Yourself)
2. Syntaxe `def` — název, závorky, dvojtečka, odsazení
3. Parametry — proměnné lokální pro funkci; argumenty = hodnoty při volání
4. `return` — funkce vrátí výsledek; bez `return` vrátí `None`
5. Refaktoring — přepis programu z lekce 05 nebo 06 s funkcemi
   Připomenout analogii mikrovlnky z lekce 01!

### Samostatná práce (28 min)
Studenti pracují na pracovním listu.

### Závěr (5 min)
Ukázka: jak funkce zkrátí a zpřehlední program. Funkce jako „stavební kameny".

## Tipy

- Analogie mikrovlnky (lekce 01): tlačítko na mikrovlnce = volání funkce,
  vnitřní mechanismus = tělo funkce. Nyní si studenti tlačítka „vyrábějí" sami.
- Časté chyby:
  - Zapomenutý `return` → funkce vrátí `None`
  - Volání funkce bez závorek: `hod_kostkou` vs `hod_kostkou()` — velký rozdíl!
  - `return` ukončí funkci — kód za ním se neprovede
- Parametry jsou lokální — proměnná `jmeno` uvnitř funkce není stejná jako venku.
- Funkce bez `return` (jen vedlejší efekty jako `display.show`) jsou OK — nechat studenty to objevit.

## Vzorová řešení

### Úkol 1 — pozdrav
```python
from microbit import *

def pozdrav(jmeno):
    display.scroll("Ahoj, " + jmeno + "!")

pozdrav("Karel")
pozdrav("Jana")
```

### Úkol 2 — hod kostkou s return
```python
from microbit import *
import random

def hod_kostkou(pocet_sten):
    return random.randint(1, pocet_sten)

while True:
    if accelerometer.was_gesture("shake"):
        cislo = hod_kostkou(6)
        display.show(str(cislo))
    sleep(100)
```

### Úkol 3 — refaktoring teploměru
```python
from microbit import *

def zobraz_stav(teplota):
    if teplota > 27:
        display.show(Image.HAPPY)
    elif teplota < 18:
        display.show(Image.SAD)
    else:
        display.show(Image.MEH)

while True:
    zobraz_stav(temperature())
    sleep(2000)
```
