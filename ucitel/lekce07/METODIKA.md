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
1. Co je seznam — uspořádaná sada prvků v hranatých závorkách `[]`
2. Indexování `[0]`, záporné indexy `[-1]`, délka `len()`
3. Procházení `for prvek in seznam:` — opakování z lekce 04
4. `import music` — přehrání předdefinované melodie (`music.NYAN` apod.)
5. Notový zápis — formát `"C4:4"`, délky, pauzy `"R"`

### Samostatná práce (28 min)
Studenti pracují na pracovním listu.

### Závěr (5 min)
Ukázka: jukebox s výběrem melodie tlačítky A/B. Žáci sdílí svou vlastní melodii.

## Tipy

- Připomíná seznamy z lekce 05 (`[Image.HAPPY, Image.SAD, ...]`) — napojit na to.
- `import music` je nutný navíc — nestačí `from microbit import *`.
- Micro:bit přehrává zvuk přes GPIO pin 0 (krokodýlky → sluchátka nebo reproduktor).
  Pokud žáci zvuk neslyší: zkontrolovat zapojení nebo použít `music.pitch(440, 200)`.
- Předdefinované melodie: `music.NYAN`, `music.BIRTHDAY`, `music.DADADADUM`,
  `music.ENTERTAINER`, `music.FUNK`, `music.BLUES`, `music.JUMP_UP`, `music.JUMP_DOWN`.
- Notový formát: `"C4:4"` = C, oktáva 4, 4 tikety (čtvrťová nota při výchozím tempu).
  `"R:4"` = pomlka. Délky: 1=celá, 2=půlová, 4=čtvrťová, 8=osminová.
- `music.play(melodie, wait=False)` — nebude blokovat zbytek programu.

## Vzorová řešení

### Úkol 1 — první melodie
```python
import music

music.play(music.BIRTHDAY)
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

melodie_a = [music.NYAN]
melodie_b = [music.FUNK]

while True:
    if button_a.was_pressed():
        music.play(music.NYAN)
    elif button_b.was_pressed():
        music.play(music.FUNK)
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
