# Metodika — Lekce 05: Náhoda a hry

## Cíle lekce

Po lekci student:
- importuje modul pomocí `import random`
- použije `random.randint(a, b)` pro náhodné celé číslo
- použije `random.choice(seznam)` pro náhodný prvek ze seznamu
- použije `accelerometer.was_gesture("shake")` pro detekci třepání
- sestaví jednoduchou interaktivní hru kombinující náhodu a micro:bit vstup

## Časová dotace

~45 minut (1 vyučovací hodina)

## Průběh hodiny

### Výklad (12 min)
Prezentace — klíčové body:
1. Proč náhoda? — hry, simulace, testování
2. `import random` — načítání modulu (analogie: rozbalení sady nástrojů)
3. `random.randint(1, 6)` — náhodné celé číslo včetně krajních hodnot
4. `random.choice(seznam)` — náhodný prvek; připomíná seznamy z předchozí lekce
5. `accelerometer.was_gesture("shake")` — micro:bit detekuje třepání
   Rozdíl: `was_gesture` (od posledního volání) vs. `is_gesture` (právě teď)

### Samostatná práce (28 min)
Studenti pracují na pracovním listu.

### Závěr (5 min)
Ukázka rozšíření: `random.choice([Image.HAPPY, Image.SAD, Image.SURPRISED])`
pro vizuální „věštírnu".

## Tipy

- `random.randint(a, b)` vrací číslo **včetně** `b` — na rozdíl od `range(n)`.
  Stojí za zdůraznění, studenti mají tendenci psát `randint(1, 5)` pro kostku 1–6.
- `was_gesture("shake")` nefunguje bez `while True:` — gesto se detekuje
  jen při průchodu smyčkou.
- Pokud micro:bit kostku „hodí" sám od sebe při položení: jde o vibraci
  při připojování USB. Stačí přidat krátký `sleep(100)` na začátek smyčky.

## Vzorová řešení

### Úkol 1 — hod kostkou
```python
from microbit import *
import random

while True:
    if accelerometer.was_gesture("shake"):
        cislo = random.randint(1, 6)
        display.show(str(cislo))
    sleep(100)
```

### Úkol 2 — náhodný obrázek
```python
from microbit import *
import random

obrazky = [Image.HAPPY, Image.SAD, Image.SURPRISED,
           Image.ANGRY, Image.CONFUSED, Image.ASLEEP]

while True:
    if accelerometer.was_gesture("shake"):
        display.show(random.choice(obrazky))
    sleep(100)
```

### Úkol 3 — věštírna (Ano / Ne)
```python
from microbit import *
import random

odpovedi = ["ANO", "NE", "MOZNA", "URCITE", "NIKDY"]

while True:
    if accelerometer.was_gesture("shake"):
        display.scroll(random.choice(odpovedi))
    sleep(100)
```

### Bonus — jednoduchá hra: uhádni číslo
```python
from microbit import *
import random

tajne = random.randint(1, 3)

while True:
    if button_a.was_pressed():
        display.show("1")
        sleep(500)
        if tajne == 1:
            display.show(Image.HAPPY)
        else:
            display.show(Image.SAD)
    elif button_b.was_pressed():
        display.show("2")
        sleep(500)
        if tajne == 2:
            display.show(Image.HAPPY)
        else:
            display.show(Image.SAD)
    sleep(50)
```
