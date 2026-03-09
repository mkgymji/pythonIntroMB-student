# Úvod do Pythonu na Micro:bitu

Výukové materiály pro první ročník vyššího gymnázia (kvinta).

Série 11 lekcí (lekce 11 volitelná), které postupně uvádějí studenty do programování v Pythonu prostřednictvím micro:bitu (MicroPython v2). Každá lekce kombinuje jeden nový Python koncept s konkrétní funkcí micro:bitu.

## Pro učitele

Tento repozitář je **privátní** a obsahuje:
- LaTeX zdrojové soubory pracovních listů a prezentací (`ucitel/`)
- Metodické pokyny pro každou lekci (`METODIKA.md`)
- Texty úloh připravené pro Google Classroom (`classroom_uloha.md`)
- Vzorová řešení (kde je to vhodné)

## Pro studenty

Studenti mají přístup k **veřejnému repozitáři** [mkgymji/pythonIntroMB-student](https://github.com/mkgymji/pythonIntroMB-student), který obsahuje:
- Zkompilované pracovní listy (PDF)
- Prezentace z hodin (PDF)
- Šablony zdrojových kódů (`.py`) tam, kde jsou k dispozici

## Přehled lekcí

| Lekce | Téma | Python |
|-------|------|--------|
| 01 | Seznámení s micro:bitem a Thonny | volání funkce, první skript |
| 02 | Proměnné a typy | `int`, `str`, přiřazení |
| 03 | Podmínky | `if / elif / else` |
| 04 | Cykly | `while True`, `for`, `sleep()` |
| 05 | Náhoda a hry | `import random` |
| 06 | Senzory a data | `float`, `temperature()`, `accelerometer` |
| 07 | Zvuk a hudba | listy, `import music` |
| 08 | Vlastní funkce | `def`, parametry, `return` |
| 09 | Radio — základy | `radio`, posílání zpráv |
| 10 | Radio — hra dvou hráčů | protokoly, `while…else`, stavové proměnné |
| 11 *(volitelná)* | Závěrečný projekt | volná práce |

## Doporučené párování do dvouhodinovek

| Dvouhodinovka | Lekce | Obsah |
|---|---|---|
| 1 | L01 + L02 | První program, proměnné |
| 2 | L03 + L04 | Podmínky, cykly |
| 3 | L05 + L06 | Náhoda, senzory |
| 4 | L07 + L08 | Hudba/seznamy, funkce |
| 5 | L09 + L10 | Rádio — základy + hra dvou hráčů |
| 6 *(volitelná)* | L11 | Volný projekt |

Kurz lze uzavřít po dvouhodinovce 5 — studenti odchází se znalostí celého základu Pythonu
včetně bezdrátové komunikace a hry. Lekce 11 je přirozenou korunkou pro třídy s~více časem.

## Sestavení PDF

```bash
make lekce01      # jedna lekce
make              # všechny lekce
make clean        # smaže pomocné LaTeX soubory
make distclean    # smaže i PDF (pro čistou rekompilaci)
make push-public  # synchronizace do veřejného repo
```

Vyžaduje: XeLaTeX, `latexmk`.

## Šablony zdrojových kódů

Lekce 09 a 11 obsahují `template.py` v adresáři `student/lekceXX/` jako startovní bod pro studenty.
Ostatní lekce šablonu nemají záměrně — studenti kód píší od začátku.
