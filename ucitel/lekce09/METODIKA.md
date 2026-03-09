# Metodika — Lekce 09: Řetězce a radio

## Cíle lekce

Po lekci student:
- používá základní operace s řetězci: `len()`, `.upper()`, `.lower()`, `in`, indexování `[i]`
- importuje modul `radio` a konfiguruje kanál
- posílá zprávy pomocí `radio.send()` a přijímá pomocí `radio.receive()`
- sestaví program pro komunikaci dvou micro:bitů

## Časová dotace

~45 minut (1 vyučovací hodina)

## Průběh hodiny

### Výklad (12 min)
Prezentace — klíčové body:
1. Řetězce — opakování + nové: `len()`, `.upper()`, `.lower()`, `in`, `[i]`
2. Řetězce jako sekvence — analogie se seznamy (indexování funguje stejně)
3. `import radio` — přidání modulu pro bezdrátovou komunikaci
4. `radio.on()`, `radio.send("text")`, `radio.receive()` — základní API
5. `radio.config(channel=7)` — všichni na stejném kanálu

### Samostatná práce (28 min)
**Pracuje se ve dvojicích** — každá dvojice potřebuje 2 micro:bity.
Studenti pracují na pracovním listu.

### Závěr (5 min)
Demonstrace: micro:bity komunikují napříč třídou (jeden kanál = broadcast).

## Tipy

- Radio vyžaduje 2 micro:bity — pracujte ve dvojicích!
- `radio.on()` je povinné — bez něj radio nefunguje.
- Všichni na stejném kanálu (default 7) — zprávy uvidí všichni. Pro párovou komunikaci
  použijte různé kanály: `radio.config(channel=42)`.
- `radio.receive()` vrátí `None`, pokud žádná zpráva nečeká. Vždy testujte:
  `msg = radio.receive(); if msg is not None: ...`
- Délka zprávy je omezena — max. 251 bajtů (v praxi krátké texty).
- Řetězcové metody: `.upper()` a `.lower()` fungují jen pro ASCII — pro českou diakritiku
  je to složitější (neřešit na této úrovni).
- Indexování řetězce `s[i]` funguje stejně jako u seznamů — dobrá paralela.

## Vzorová řešení

### Úkol 1 — řetězcové operace
```python
zprava = "Hello, Microbit!"
print(len(zprava))       # 16
print(zprava.upper())    # HELLO, MICROBIT!
print(zprava.lower())    # hello, microbit!
print(zprava[0])         # H
print("bit" in zprava)   # True
```

### Úkol 2 — radio ping-pong
```python
# Oba micro:bity mají stejný program
from microbit import *
import radio

radio.on()
radio.config(channel=7)

while True:
    if button_a.was_pressed():
        radio.send("Ping!")
        display.show(Image.ARROW_E)

    msg = radio.receive()
    if msg is not None:
        display.scroll(msg)
    sleep(100)
```

### Úkol 3 — chat
```python
from microbit import *
import radio

radio.on()
radio.config(channel=7)

zpravy_a = ["Ahoj!", "Jak se mas?", "Super!", "Nashle!"]
zpravy_b = ["Dobre,diky", "Co delat?", "Nevim", "Zdar!"]
index = 0

while True:
    if button_a.was_pressed():
        index = (index + 1) % len(zpravy_a)
        display.scroll(zpravy_a[index])

    if button_b.was_pressed():
        radio.send(zpravy_a[index])
        display.show(Image.ARROW_E)

    msg = radio.receive()
    if msg is not None:
        display.scroll(msg)

    sleep(100)
```
