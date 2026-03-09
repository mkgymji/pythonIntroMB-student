# Metodika — Lekce 04: Cykly a animace

## Cíle lekce

Po lekci student:
- vysvětlí rozdíl mezi `while True` a `for` cyklem
- použije `sleep()` pro časování
- napíše `for i in range(n):` a pracuje s proměnnou `i`
- vytvoří animaci na displeji micro:bitu pomocí cyklu
- zná `display.clear()` a `display.set_pixel(x, y, jas)`

## Časová dotace

~45 minut (1 vyučovací hodina)

## Průběh hodiny

### Výklad (15 min)
Prezentace — klíčové body:
1. `while True:` — nyní formálně: opakuje blok donekonečna, typický pro programy se senzory
2. `sleep(ms)` — pauza v milisekundách; `sleep(1000)` = 1 s
3. `for i in range(n):` — opakuj přesně n-krát; `i` je čítač (0, 1, 2, …, n-1)
4. Iterační proměnná `i` — lze použít ve výpočtu nebo jen jako počítadlo
5. Animace: sekvence obrázků v cyklu nebo `display.show(seznam, delay=...)`
6. `display.set_pixel(x, y, jas)` — pokročilejší, pro bonus

### Samostatná práce (25 min)
Studenti pracují na pracovním listu.

### Závěr (5 min)
Ukázka `Image.ALL_CLOCKS` jako vestavěná animace.

## Tipy

- `range(5)` vrátí 0, 1, 2, 3, 4 — ne 1 až 5. Studenti to pravidelně pletou.
  Nejlepší ukázka: `for i in range(5): display.scroll(str(i))` a sledovat výstup.
- `sleep()` přijímá milisekundy (int). `sleep(1000)` = 1 sekunda.
- Animace bez `while True:` proběhne jednou a skončí — je to záměr nebo chyba? Nechte studenty zjistit.
- `display.show(Image.ALL_CLOCKS, delay=100, loop=True)` — elegant one-liner pro rotující hodiny.

## Vzorová řešení

### Úkol 1 — blikající srdce
```python
from microbit import *

while True:
    display.show(Image.HEART)
    sleep(500)
    display.clear()
    sleep(500)
```

### Úkol 2 — for + range, počítání
```python
from microbit import *

for i in range(5):
    display.show(str(i))
    sleep(600)

display.show(Image.YES)
```

### Úkol 3 — animace sekvencí obrázků
```python
from microbit import *

snimky = [Image.HAPPY, Image.SMILE, Image.SAD, Image.CONFUSED]

while True:
    for obrazek in snimky:
        display.show(obrazek)
        sleep(400)
```

### Bonus — display.set_pixel (svítící had)
```python
from microbit import *

while True:
    for x in range(5):
        display.clear()
        display.set_pixel(x, 2, 9)
        sleep(150)
    for x in range(4, -1, -1):
        display.clear()
        display.set_pixel(x, 2, 9)
        sleep(150)
```
