# Metodika — Lekce 01: Seznámení s micro:bitem a MicroPythonem

## Cíle lekce

Po lekci student:
- ví co je micro:bit a k čemu slouží
- umí připojit micro:bit k počítači a ověřit, že ho Thonny vidí
- umí naflashovat (nebo ověřit přítomnost) MicroPython firmware
- napsal a spustil první Python skript
- zná a používá `display.show()` a `display.scroll()`
- rozumí pojmům: *program*, *skript*, *funkce*, *argument*, *příkaz*

## Časová dotace

~45 minut (1 vyučovací hodina)

## Průběh hodiny

### Úvod (5 min)
- Co je micro:bit — ukázat fyzicky, popsat hardware (LED matrix, tlačítka, senzory)
- Zmínit co budeme v sérii lekcí dělat

### Firmware a připojení (10 min)
- Studenti připojí micro:bit přes USB
- Thonny → Nástroje → Nastavení → Interpreter → MicroPython (BBC micro:bit)
- Pokud není firmware: Thonny nabídne instalaci — provést
- Ověření: REPL v dolním panelu Thonny (zmínit, ne rozebírat — "zde si můžete rychle něco vyzkoušet")

### Výklad + ukázka (15 min)
Prezentace pokrývá:
1. Co je program / skript
2. Co je funkce a jak se volá: `display.show("A")`
3. Argument funkce (co píšeme do závorek)
4. Jak skript spustit (zelené tlačítko v Thonny / F5)
5. Ukázka `display.scroll("Hello!")` — rozdíl od `show`

### Samostatná práce (10 min)
Studenti pracují na pracovním listu — úkoly 1 a 2.

### Závěr + doplněk (5 min)
- Shrnutí pojmů z prezentace
- Doplněk: jak nastavit Thonny doma (viz pracovní list)

## Tipy

- Micro:bity jsou sdílené — zdůrazni nutnost flashovat firmware při každém přechodu od jiné skupiny. Není to chyba, je to normální.
- `display.show()` zobrazí jen první znak řetězce, pokud není nastaveno `delay`. Studenti to objeví — nechat je zjistit proč.
- REPL záměrně nerozvíjíme, jen zmínit. Zabere zbytečně čas.

## Vzorové řešení úkolů

### Úkol 1 (flash firmware)
Procedurální úkol — buď firmware nainstalován nebo student zvládl Thonny průvodce.
Žádný zdrojový kód.

### Úkol 2
```python
from microbit import *
display.scroll("Ahoj! Jsem micro:bit.")
```

nebo varianta se jménem studenta:
```python
from microbit import *
display.scroll("Ahoj, ja jsem Petr!")
```

### Úkol 3 (bonusový)
```python
from microbit import *
display.show(Image.HEART)
sleep(1000)
display.show(Image.HAPPY)
```
