# Metodika — Lekce 07: Seznamy a hudba

## Cíle lekce

Po lekci student:
- vytvoří seznam (list) a přistupuje k prvkům pomocí indexu
- používá `len()` pro zjištění délky seznamu
- prochází seznam pomocí `for prvek in seznam:`
- importuje modul `music` a přehraje předdefinovanou melodii
- sestaví vlastní melodii jako seznam not

## Časová dotace

~45 minut (1 vyučovací hodina)

## Průběh hodiny

### Výklad (12 min)
Prezentace — klíčové body:
1. **Paradigmatický skok** — snímek „Co když potřebuji víc hodnot najednou?"
   Ukázat kontrast: `jmeno = "Alice"` (jedna hodnota) vs. `jmena = ["Alice","Bob","Carla"]`
   (kolekce). Nechat studenty chvíli pohledět na TikZ diagram s `jmena[0]`, `jmena[1]`, `jmena[2]`.
   Pojmenovat explicitně: *„Tohle je nový druh proměnné — index je adresa v kolekci."*
2. Syntaxe — hranaté závorky `[]`, různé typy prvků, propojení s lekce 04 a 05
3. Indexování `[0]`, záporné indexy `[-1]`, délka `len()`
4. Procházení `for prvek in seznam:` — opakování z lekce 04
5. `import music` — přehrání předdefinované melodie (`music.NYAN` apod.)
6. Notový zápis — formát `"C4:4"`, délky, pauzy `"R"`
7. Pointovat propojení: **melodie = seznam not** — seznam a hudba jsou jedno

### Samostatná práce (28 min)
Studenti pracují na pracovním listu.

### Závěr (5 min)
Ukázka: jukebox s výběrem melodie tlačítky A/B. Žáci sdílí svou vlastní melodii.

## Tipy

- **Klíčový moment hodiny:** Snímek s kontrastem „dosud vs. nově" — nespěchat.
  Studenti ho v lekci 04 a 05 viděli, ale neměli pojmenování. Teď dostávají rámec.
  Dobře funguje otázka do třídy: *„Kde jsme seznam už použili?"* — sami najdou L04 a L05.
- Připomíná seznamy z lekce 05 (`[Image.HAPPY, Image.SAD, ...]`) — napojit na to.
- `import music` je nutný navíc — nestačí `from microbit import *`.
- Micro:bit přehrává zvuk přes GPIO pin 0 (krokodýlky → sluchátka nebo reproduktor).
  Pokud žáci zvuk neslyší: zkontrolovat zapojení nebo použít `music.pitch(440, 200)`.
- Předdefinované melodie: `music.NYAN`, `music.BIRTHDAY`, `music.DADADADUM`,
  `music.ENTERTAINER`, `music.FUNK`, `music.BLUES`, `music.JUMP_UP`, `music.JUMP_DOWN`.
- Notový formát: `"C4:4"` = C, oktáva 4, čtvrťová nota. `"R:4"` = pomlka.
  Délky: 1=celá, 2=půlová, 4=čtvrťová, 8=osminová.
  ⚠️ **Upozornit studenty:** čím větší číslo délky, tím *kratší* nota — opačně než by čekali.
  (4 = čtvrťová je kratší než 2 = půlová.) Analogie: pizza krájená na 4 vs. na 2 díly.
- `music.play(melodie, wait=False)` — nebude blokovat zbytek programu.

## Vzorová řešení

### Úkol 1 — první melodie
```python
from microbit import *
import music

while True:
    if button_a.was_pressed():
        music.play(music.BIRTHDAY)
    sleep(50)
```

### Úkol 2 — vlastní melodie
```python
import music

melodie = [
    "C4:4", "C4:4", "D4:4", "C4:4", "F4:4", "E4:2",
    "R:2", "C4:4", "C4:4", "D4:4", "C4:4", "G4:4", "F4:2"
]

music.play(melodie)
```

### Úkol 3 — jukebox
```python
from microbit import *
import music

melodie_a = ["C4:4", "E4:4", "G4:4", "C5:2"]  # vlastní melodie (splňuje podmínku)
melodie_b = music.FUNK                           # předdefinovaná

while True:
    if button_a.was_pressed():
        display.show("A")
        music.play(melodie_a)
    elif button_b.was_pressed():
        display.show("B")
        music.play(melodie_b)
    sleep(50)
```

### Bonus — jukebox se seznamem melodií
```python
from microbit import *
import music

melodie = [music.NYAN, music.FUNK, music.BLUES, music.BIRTHDAY]
index = 0

while True:
    if button_a.was_pressed():
        index = (index - 1) % len(melodie)
        display.show(str(index + 1))
    elif button_b.was_pressed():
        index = (index + 1) % len(melodie)
        display.show(str(index + 1))
    if button_a.was_pressed() and button_b.was_pressed():
        music.play(melodie[index])
    sleep(50)
```
