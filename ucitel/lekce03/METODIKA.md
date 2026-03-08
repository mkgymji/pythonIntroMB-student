# Metodika — Lekce 03: Podmínky

## Cíle lekce

Po lekci student:
- vysvětlí, k čemu slouží příkaz `if`
- napíše podmínku `if / else` i `if / elif / else`
- použije `button_a.is_pressed()` a `button_b.is_pressed()`
- rozumí hodnotám `True` a `False`
- používá `while True:` jako smyčku pro opakované čtení tlačítek
  (plné vysvětlení smyček přijde v lekci 04)

## Časová dotace

~45 minut (1 vyučovací hodina)

## Průběh hodiny

### Výklad (15 min)
Prezentace — klíčové body:
1. Podmínka v životě: „Jestliže prší, vezmi deštník."
2. Syntaxe `if` / `else` — odsazení jako součást jazyka (4 mezery nebo Tab)
3. `True` a `False` — co vrací `is_pressed()`
4. `while True:` jako zaklínadlo: „program běží a stále kontroluje" — detaily v příští lekci
5. `if / elif / else` — více větví
6. Operátor `and` pro kombinaci podmínek (obě tlačítka)

### Samostatná práce (25 min)
Studenti pracují na pracovním listu.

### Závěr (5 min)
Ukázka chyby: zapomenutá dvojtečka nebo špatné odsazení → `IndentationError`.

## Tipy

- **Odsazení** je pro studenty nejčastější kamenem úrazu — zdůrazni, že Python na něm závisí. Thonny odsazuje automaticky po dvojtečce.
- `while True:` záměrně nevysvětlujeme do hloubky — stačí „program běží pořád dokola". Zvídavým studentům lze říct, že je to speciální případ cyklu, o kterém bude příští lekce.
- Lze ukázat jak program zastavit: tlačítko Stop v Thonny nebo stisknout reset na micro:bitu.

## Vzorová řešení

### Úkol 1
```python
from microbit import *

while True:
    if button_a.is_pressed():
        display.show(Image.HEART)
    else:
        display.show(Image.SAD)
```

### Úkol 2
```python
from microbit import *

while True:
    if button_a.is_pressed():
        display.show(Image.HAPPY)
    elif button_b.is_pressed():
        display.show(Image.ANGRY)
    else:
        display.show(Image.ASLEEP)
```

### Úkol 3 (obě tlačítka + vlastní reakce)
```python
from microbit import *

while True:
    if button_a.is_pressed() and button_b.is_pressed():
        display.scroll("Obe!")
    elif button_a.is_pressed():
        display.show(Image.ARROW_W)
    elif button_b.is_pressed():
        display.show(Image.ARROW_E)
    else:
        display.show(Image.DIAMOND_SMALL)
```
