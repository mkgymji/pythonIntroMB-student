# Metodika — Lekce 02: Proměnné a typy

## Cíle lekce

Po lekci student:
- vysvětlí, co je proměnná a k čemu slouží
- přiřadí hodnotu proměnné (`jmeno = "Alice"`)
- rozlišuje typy `str` (text) a `int` (celé číslo)
- zobrazí proměnnou na displeji micro:bitu
- spojí řetězce operátorem `+`
- použije `str()` pro převod čísla na text

## Časová dotace

~45 minut (1 vyučovací hodina)

## Průběh hodiny

### Výklad + diskuse (15 min)
Prezentace — klíčové body:
1. Analogie: proměnná = krabice s nálepkou (nálepka = jméno, obsah = hodnota)
2. Přiřazení: `jmeno = "Alice"` — čte se zprava doleva: „vezmi hodnotu, ulož ji do proměnné"
3. Typy: `str` (text v uvozovkách) vs. `int` (celé číslo bez uvozovek)
4. Proměnnou lze použít místo hodnoty — i v `display.scroll()`
5. Spojování řetězců: `"Ahoj, " + jmeno`
6. Konverze: `str(vek)` — bez toho nelze `int` přidat k řetězci

### Samostatná práce (25 min)
Studenti pracují na pracovním listu — 3 úkoly postupně.

### Závěr (5 min)
Shrnutí: proměnná = jméno + hodnota + typ.
Předvést typickou chybu: `"Věk: " + 16` → `TypeError` → vysvětlit proč.

## Tipy

- Chyba `TypeError: can only concatenate str (not "int") to str` je skvělá — nechte ji nastat přirozeně a pak ji se studenty vyřešte. Je to výborný teachable moment.
- Pozor: v MicroPythonu `display.scroll(42)` funguje (automatická konverze), ale na počítači v běžném Pythonu to hodí chybu. Zmiňte to jako rozdíl.
- Proměnné pojmenujte česky nebo anglicky — oba přístupy jsou OK, ale buďte konzistentní.

## Vzorová řešení

### Úkol 1
```python
from microbit import *

jmeno = "Alice"
display.scroll(jmeno)
```

### Úkol 2
```python
from microbit import *

jmeno = "Alice"
vek = 16
display.scroll(jmeno + " " + str(vek))
```

### Úkol 3 (vizitka)
```python
from microbit import *

jmeno = "Alice"
trida = "1.A"
hobby = "fotbal"

zprava = jmeno + ", " + trida + ", " + hobby
display.scroll(zprava)
```
